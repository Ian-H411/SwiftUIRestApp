//
//  FoodGroup.swift
//  SwiftUIdemos
//
//  Created by Ian Hall on 5/27/21.
//

import Foundation

class FoodGroup {
    
    var users: [User]
    var likedRestaurants: [Restaurant] = []
    
    init(users: [User]) {
        self.users = users
    }
}
