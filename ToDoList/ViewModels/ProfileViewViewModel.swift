//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Cédric Evrard on 22/06/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
    @Published var user: User?
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else { return }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    emailAddress: data["emailAddress"] as? String ?? "",
                    joined: data["dueDate"] as? TimeInterval ?? Date().timeIntervalSince1970
                )
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
