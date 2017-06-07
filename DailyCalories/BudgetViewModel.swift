//
//  BudgetViewModel.swift
//  DailyCalories
//
//  Created by Chris Winstanley on 07/06/2017.
//  Copyright © 2017 Chris Winstanley. All rights reserved.
//

import Foundation

class BudgetViewModel : NSObject {
    
    private var budget = Budget(calories: 1900)
 
    public func getCaloriesWithUnits() -> String {
        return "\(getCalories())kCal"
    }

    public func getCalories() -> Int {
        return budget.calories
    }
    
    public func reduceCalories(_ caloriesReduction: Int) {
        budget = Budget(calories: budget.calories - caloriesReduction)
    }

}
