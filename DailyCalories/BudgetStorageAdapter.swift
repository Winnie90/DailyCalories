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
        UserDefaults.standard.get("budget")
    }
}
