//
//  FoodViewModel.swift
//  DailyCalories
//
//  Created by Chris Winstanley on 11/07/2017.
//  Copyright © 2017 Chris Winstanley. All rights reserved.
//

import Foundation

struct CalorieSuggestion {
    let name: String
    let calories: Int
}

struct FoodSuggestionsViewModel {
    public func getSuggestions(forInput: String) -> [CalorieSuggestion] {
       return []
    }
}
