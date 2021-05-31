//
//  User.swift
//  SwiftUIdemos
//
//  Created by Ian Hall on 5/27/21.
//

import Foundation

class User {
    
    let userName: String
    let ID: Int
    weak var groupReference: FoodGroup?
    
    init(userName: String, id: Int) {
        self.userName = userName
        self.ID = id
    }
}
