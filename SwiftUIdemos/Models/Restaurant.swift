//
//  Restaurant.swift
//  SwiftUIdemos
//
//  Created by Ian Hall on 5/25/21.
//

import SwiftUI

class Restaurant {
    let name: String
    let restaurantType: [String]
    let address: String
    let lattitude: Double
    let longitude: Double
    let phone: String
    let website: String
    let hours: String
    let id: String
    let menus: [RestaurantMenu]
    var isLiked: Bool = false
    
    init(json: [String: Any]) {
        let nameFound = json[RestaurantJSONKeys.name.rawValue] as? String ?? ""
        let type = json[RestaurantJSONKeys.cuisineType.rawValue] as? [String] ?? []
        let address = json[RestaurantJSONKeys.address.rawValue] as? [String: String] ?? [:]
        let geo = json[RestaurantJSONKeys.geo.rawValue] as? [String: Double] ?? [:]
        let menus = json[RestaurantJSONKeys.menus.rawValue] as? [[String: Any]] ?? []
        
        let formattedAddress = address[RestaurantJSONKeys.addressFormatted.rawValue]
        let lat = geo[RestaurantJSONKeys.lattitude.rawValue] ?? 0.0
        let lon = geo[RestaurantJSONKeys.longitude.rawValue] ?? 0.0
        
        self.name = nameFound
        self.restaurantType = type
        self.address = formattedAddress ?? "address not found"
        self.lattitude = lat
        self.longitude = lon
        for menuJSON in menus {
//            let menu = RestaurantMenu(menuSection: menuJSON)
        }
    }
}

enum RestaurantJSONKeys: String {
    case dataKey       = "data"
    case name          = "restaurant_name"
    case phone         = "restaurant_phone"
    case website       = "restaurant_website"
    case hours         = "hours"
    case id            = "restaurant_id"
    case cuisineType   = "cuisines"
    //address and Subaddress keys
    case address       = "address"
    case addressFormatted = "formatted"
    case geo           = "geo"
    case lattitude     = "lat"
    case longitude     = "lon"
    case menus         = "menus"
}
