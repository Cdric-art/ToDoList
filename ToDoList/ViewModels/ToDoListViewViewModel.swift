//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Cédric Evrard on 22/06/2023.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView: Bool = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete ToDo item
    /// - Parameter id: ToDo id
    func delete(id: String) {
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
