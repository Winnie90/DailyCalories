//
//  Budget.swift
//  DailyCalories
//
//  Created by Christopher Winstanley on 05/06/2017.
//  Copyright © 2017 Chris Winstanley. All rights reserved.
//

import Foundation

struct Budget {
    var calories: Int
    var date: Date
    
    init(calories: Int, date: Date) {
        self.calories = calories
        self.date = date
    }
    
    init(dict: Dictionary<String, Any>) {
        if let calories = dict["calories"] as? Int {
            self.calories = calories
        } else {
            self.calories = 0
        }
        if let date = dict["date"] as? Date {
            self.date = date
        } else {
            self.date = Date()
        }
    }
}

extension Budget {
    func encode() -> Dictionary<String, Any> {
        return [
            "calories": calories,
            "date": date
        ]
    }
}
