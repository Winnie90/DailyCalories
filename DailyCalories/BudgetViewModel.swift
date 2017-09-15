//
//  BudgetViewModel.swift
//  DailyCalories
//
//  Created by Chris Winstanley on 07/06/2017.
//  Copyright © 2017 Chris Winstanley. All rights reserved.
//

import Foundation

class BudgetViewModel: NSObject {
    
    private let budgetStorage = BudgetStorageAdapter()
    private var privateBudget: Budget!
    
    private var budget: Budget {
        get {
            return privateBudget
        }
        set {
            privateBudget = newValue
            budgetStorage.store(budget: budget)
        }
    }
    
    override init() {
        super.init()
        budget = budgetStorage.retrieve()
    }
 
    public func getCaloriesWithUnits() -> String {
        return "\(getCalories())kCal"
    }

    public func getCalories() -> Int {
        return budget.calories
    }

    public func reduceCalories(_ caloriesReduction: Int) {
        budget = Budget(calories: budget.calories - caloriesReduction,
                        date: budget.date)
    }

}
