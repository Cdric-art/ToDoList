//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Cédric Evrard on 22/06/2023.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    
    func save() {
        
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
