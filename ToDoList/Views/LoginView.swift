//
//  LoginView.swift
//  ToDoList
//
//  Created by Cédric Evrard on 22/06/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, backgroundColor: .pink)
                
                // Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    SecureField("Password", text: $viewModel.password)
                    
                    TLButton(title: "Log in", backgroundColor: .blue, action: {
                        Task {
                            try await viewModel.login()
                        }
                    })
                    .opacity(viewModel.password.count < 6 ? 0.6 : 1)
                }
                .multilineTextAlignment(.center)
                .offset(y: -50)
                
                
                // Create account
                VStack {
                    Text("New around here ?")
                    NavigationLink("Create an account", destination: RegisterView())
                        .foregroundColor(.pink)
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
