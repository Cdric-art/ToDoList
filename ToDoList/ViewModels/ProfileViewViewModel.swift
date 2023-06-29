//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Cédric Evrard on 22/06/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
class ProfileViewViewModel: ObservableObject {
    @Published var user: User?
    
    func fetchUser() async {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(userId).getDocument() else { return }
                
        self.user = try? snapshot.data(as: User.self)
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}
