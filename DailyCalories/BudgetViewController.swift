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
    
    var todaysBudget = BudgetViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateCaloriesDisplay()
    }
    
    private func updateCaloriesDisplay() {
        updateCaloriesLabel()
        
        if todaysBudget.getCalories() < 0 {
            view.backgroundColor = UIColor.orange
        } else {
            view.backgroundColor = UIColor.blue
        }
    }
    
    private func updateCaloriesLabel() {
        let calories = todaysBudget.getCaloriesWithUnits()
        caloriesLabel.text = calories
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navController = segue.destination as? UINavigationController,
            let foodInputViewController = navController.topViewController as? FoodInputViewController {
                foodInputViewController.foodInput = { [unowned self] calories in
                    self.todaysBudget.reduceCalories(calories)
                    self.updateCaloriesDisplay()
                }
        }
    }

}
