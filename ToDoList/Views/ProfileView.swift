//
//  ProfileView.swift
//  ToDoList
//
//  Created by Cédric Evrard on 22/06/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading...")
                        .font(.footnote)
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding(.top)
        
        // Info
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text("Name : ")
                    .bold()
                Text(user.name)
            }
            HStack {
                Text("Email : ")
                    .bold()
                Text(user.emailAddress)
            }
            HStack {
                Text("Menber since :")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        .padding(.top)
        
        Spacer()
        
        // Sign out
        Button("Log out", action: viewModel.logOut)
            .tint(.red)
            .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
