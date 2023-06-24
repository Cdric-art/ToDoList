//
//  LoginView.swift
//  ToDoList
//
//  Created by Cédric Evrard on 22/06/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView()
                
                // Login Form
                Form {
                    TextField("Email Address", text: $email)
                    SecureField("Password", text: $password)
                    
                    Section {
                        Button("Log in", action: {
                            // Action log in
                        })
                        .frame(maxWidth: .infinity)
                    }
                }
                .multilineTextAlignment(.center)
                
                // Create account
                VStack {
                    Text("New around here ?")
                    NavigationLink("Create an account", destination: RegisterView())
                }
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
