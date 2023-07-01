//
//  RegisterView.swift
//  ToDoList
//
//  Created by Cédric Evrard on 22/06/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, backgroundColor: .orange)
            
            // Register form
            Form {
                TextField("Full name", text: $viewModel.name)
                    .autocorrectionDisabled()
                TextField("Email address", text: $viewModel.email)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $viewModel.password)

                TLButton(title: "Create account", backgroundColor: .green, action: {
                    Task {
                        try await viewModel.createUser()
                    }
                })
                .opacity(viewModel.password.count < 6 ? 0.6 : 1)
            }
            .multilineTextAlignment(.center)
            .offset(y: -50)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
