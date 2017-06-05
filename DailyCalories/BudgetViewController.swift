//
//  BudgetViewController.swift
//  DailyCalories
//
//  Created by Chris Winstanley on 05/06/2017.
//  Copyright © 2017 Chris Winstanley. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController {
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    var todaysBudget = Budget(calories: 1900)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateCaloriesLabel()
    }
    
    private func updateCaloriesLabel() {
        caloriesLabel.text = todaysBudget.getCaloriesWithUnits()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let foodInputViewController = segue.destination as? FoodInputViewController {
            foodInputViewController.foodInput = { calories in
                self.todaysBudget.reduceCalories(calories)
                self.updateCaloriesLabel()
            }
        }
    }

}
