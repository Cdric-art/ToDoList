//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Cédric Evrard on 22/06/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class NewItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    
    func save() async throws {
        do {
            guard canSave else { return }
            
            guard let uid = Auth.auth().currentUser?.uid else { return }
            
            let newId = UUID().uuidString
            let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
            
            let itemEncode = try Firestore.Encoder().encode(newItem)
            try await Firestore.firestore().collection("users").document(uid).collection("todos").document(newId).setData(itemEncode)

        } catch {
            print(error.localizedDescription)
        }
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
