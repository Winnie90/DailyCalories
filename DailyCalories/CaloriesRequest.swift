//
//  CaloriesRequest.swift
//  DailyCalories
//
//  Created by Chris Winstanley on 11/07/2017.
//  Copyright © 2017 Chris Winstanley. All rights reserved.
//

import Foundation

struct CaloriesRequest {
    
    let appId : String = ""
    let apiKey: String = "b43bc038ebc3388d434c8b370bf62aad"
    let url: String = "https://api.nutritionix.com/v1_1/search/"
    let fields: String = "fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat&appId=[YOURID]&appKey=[YOURKEY]"
    
    public func getCaloriesForFood(){
        cheddar%20cheese?
        
        let request = NSMutableURLRequest(URL: yourURL)
        request.HTTPMethod = "POST"
        
        let data = yourString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().uploadTaskWithRequest(request,
                                                                      fromData: data)
        
        task.resume()
    }
}
