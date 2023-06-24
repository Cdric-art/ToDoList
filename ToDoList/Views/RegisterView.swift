//
//  RegisterView.swift
//  ToDoList
//
//  Created by Cédric Evrard on 22/06/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, backgroundColor: .orange)
            
            // Register form
            Form {
                TextField("Full name", text: $name)
                    .autocorrectionDisabled()
                TextField("Email address", text: $email)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $password)

                TLButton(title: "Create account", backgroundColor: .green, action: {
                    // Attempt register
                })
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
