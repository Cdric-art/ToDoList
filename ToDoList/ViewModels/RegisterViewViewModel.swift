//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Cédric Evrard on 22/06/2023.
//

import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    func register() {
        
    }
    
    private func validate() -> Bool {
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields."
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            
            errorMessage = "Please enter valide email."
            
            return false
        }
        
        return true
    }
}
