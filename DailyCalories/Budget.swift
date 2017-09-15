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
}

extension Budget {
    func encode() -> [String: Any] {
        return [
            "calories": calories,
            "date": date
        ]
    }
}
