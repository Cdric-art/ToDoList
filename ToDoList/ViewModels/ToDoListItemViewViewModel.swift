//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Cédric Evrard on 22/06/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class ToDoListItemViewViewModel: ObservableObject {
    
    func toggleIsDone(item: ToDoListItem) async throws {
        do {
            var itemCopy = item
            itemCopy.setDone(!item.isDone)
            
            guard let uid = Auth.auth().currentUser?.uid else { return }
            
            let encodeItem = try Firestore.Encoder().encode(itemCopy)
            try await Firestore.firestore().collection("users").document(uid).collection("todos").document(item.id).setData(encodeItem)

        } catch {
            print(error.localizedDescription)
        }
    }
    
}
