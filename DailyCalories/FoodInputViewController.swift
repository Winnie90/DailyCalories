//
//  FoodInputViewController.swift
//  DailyCalories
//
//  Created by Chris Winstanley on 05/06/2017.
//  Copyright © 2017 Chris Winstanley. All rights reserved.
//

import UIKit

class FoodInputViewController: UIViewController {

    var foodInput: (Int) -> ()!
        
    @IBOutlet weak var caloriesInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func convertTextToCalories(caloriesText text: String?) -> Int {
        guard let caloriesAsString = text,
              let caloriesAsInt = Int(caloriesAsString) else { return 0 }
        return caloriesAsInt
    }

    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        let calories = convertTextToCalories(caloriesText: caloriesInput.text)
        foodInput(calories)
        dismiss(animated: true)
    }

}
