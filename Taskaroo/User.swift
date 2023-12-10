//
//  User.swift
//  Taskaroo
//
//  Created by Kari Groszewska on 12/10/23.
//

import Foundation

//var currentUser = User(name: "")
struct User: Encodable, Identifiable, Hashable{
    var id = UUID()
    var email: String
}

