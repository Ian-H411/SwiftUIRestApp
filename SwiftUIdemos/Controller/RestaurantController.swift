//
//  RestaurantController.swift
//  SwiftUIdemos
//
//  Created by Ian Hall on 5/25/21.
//

import Foundation

struct WebServiceKeys {
    static let apiKey = "b8b0642210489d98200ac49d50d6978c"
    static let apiKeyWord = "key="
    static let latKeyword = "lat="
    static let longKeyword = "lon="
    static let distanceSettingKeyword = "distance="
    static let url = "https://api.documenu.com/v2/restaurants/search/geo?"
}

enum MenuJSONKeys: String {
    case menuName      = "menu_name"
    case sections      = "menu_sections"
    case sectionName   = "section_name"
    //also use for menu item description
    case sectionDescription = "description"
    case menuItem      = "menu_items"
    case menuItemName  = "name"
}

class RestaurantController {

    static let shared = RestaurantController()
    
    var restaurants = [Restaurant]()
    
    func getRestaurantsBasedOnGeo(lat: Double, long: Double, filterDistance: Int, completion: @escaping (Data?) -> Void) {
        let urlString = WebServiceKeys.url + WebServiceKeys.latKeyword + String(lat) + WebServiceKeys.longKeyword + String(long) + WebServiceKeys.distanceSettingKeyword + String(filterDistance)
        guard let url = URL(string: urlString + WebServiceKeys.apiKeyWord + WebServiceKeys.apiKey) else { completion(nil); return }
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(data)
                return
            }
            guard let data = data else {
                completion(nil)
                return
            }
            completion(data)
        }
        task.resume()
    }
    
    func convertRestaurantData(data: Data) {
        var jsonDecoded: [String: Any]?
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                jsonDecoded = json
            }
        } catch let error as NSError {
            print("failed to convert data:\(error.localizedDescription)")
        }
        guard let json = jsonDecoded,
              let restaurants = json[RestaurantJSONKeys.dataKey.rawValue] as? [[String: Any]] else { return }
        for restaurant in restaurants {
            let newRestaurant = Restaurant(json: restaurant)
            RestaurantController.shared.restaurants.append(newRestaurant)
            
        }
        
    }
}
