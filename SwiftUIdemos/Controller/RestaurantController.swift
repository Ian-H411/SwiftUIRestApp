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

class RestaurantController {

    static let shared = RestaurantController()
    
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
    
    func convertRestaurantData() {
        
    }
}
