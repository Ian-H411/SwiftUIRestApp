//
//  Restaurant.swift
//  SwiftUIdemos
//
//  Created by Ian Hall on 5/25/21.
//

import SwiftUI

class Restaurant {
    let name: String
    let restaurantType: String
    let address: String
    let images: [Image]
    var isLiked: Bool = false
    
    init(name: String, type: String, address: String, images: [Image]) {
        self.name = name
        self.restaurantType = type
        self.address = address
        self.images = images
    }
    
//    init(json: [String: Any]) {
//
//    }
}
