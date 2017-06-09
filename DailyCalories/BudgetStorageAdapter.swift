//
//  BudgetStorageAdapter.swift
//  DailyCalories
//
//  Created by Chris Winstanley on 08/06/2017.
//  Copyright © 2017 Chris Winstanley. All rights reserved.
//

import Foundation

struct BudgetStorageAdapter {
    
    public func store(budget: Budget) {
        UserDefaults.standard.set(budget.encode(), forKey: "budget")
        UserDefaults.standard.synchronize()
    }
    
    public func retrieve() -> Budget {
        if let budgetDict = UserDefaults.standard.dictionary(forKey: "budget"),
            let calories = budgetDict["calories"] as? Int,
                let date = budgetDict["date"] as? Date {
            return Budget(calories: calories, date: date)
        }
        return Budget(calories: 1900, date: Date())
    }
}
