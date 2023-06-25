//
//  User.swift
//  ToDoList
//
//  Created by Cédric Evrard on 22/06/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let emailAddress: String
    let joined: TimeInterval
}
