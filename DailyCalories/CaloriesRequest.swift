//
//  CaloriesRequest.swift
//  DailyCalories
//
//  Created by Chris Winstanley on 11/07/2017.
//  Copyright © 2017 Chris Winstanley. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CaloriesRequest {
    
    let apiKey: String = "b43bc038ebc3388d434c8b370bf62aad"
    let urlString: String = "https://api.nutritionix.com/v1_1/search/"
    let fields: String = "?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat&appId=acb073b1&appKey=b43bc038ebc3388d434c8b370bf62aad"
    
    public func getSuggestions(for searchText: String) -> [CalorieSuggestion] {
    
        performRequest(for: searchText) { (result, error) in
           self.convertResult(resultString: result)
        }
    }
    
    private func performRequest(for searchText:String, callback: @escaping (Data, String?) -> Void) {
        
        guard let url: URL = URL(string: urlString + searchText + fields) else { return }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                callback(nil, error?.localizedDescription)
            } else {
                callback(result!, nil)
            }
        }
        task.resume()
    }
    
    private func convertResult(resultString: String) -> [CalorieSuggestion] {
        let json = JSON(data: resultString)
        
    }
    
}
