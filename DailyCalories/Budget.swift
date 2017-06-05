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
    
    public func getCaloriesWithUnits() -> String {
        return "\(calories)kcal"
    }
    
    public mutating func reduceCalories(_ caloriesReduction: Int) {
        calories = calories - caloriesReduction
    }
}
