//
//  FoodInputViewController.swift
//  DailyCalories
//
//  Created by Chris Winstanley on 05/06/2017.
//  Copyright © 2017 Chris Winstanley. All rights reserved.
//

import UIKit

class FoodInputViewController: UIViewController {

    let units: String = "kCal"
    public var foodInput: ((Int) -> Void)?
        
    @IBOutlet weak var caloriesInputTextField: UITextField!
    @IBOutlet weak var foodInputTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        caloriesInputTextField.becomeFirstResponder()
        caloriesInputTextField.textColor = UIColor.white
        foodInputTextField.textColor = UIColor.white
        
        foodInputTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func convertTextToCalories(caloriesText text: String?) -> Int {
        guard let caloriesAsString = text,
            let caloriesAsInt = Int(caloriesAsString) else { return 0 }
        return caloriesAsInt
    }

    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        let calories = convertTextToCalories(caloriesText: caloriesInputTextField.text)
        dismiss(animated: true) { [weak self] in
            if let strongSelf = self {
                strongSelf.foodInput?(calories)
            }
        }
    }
    
    @objc public func textFieldDidChange(_ textField: UITextField) {
//        if let text = textField.text {
//            CaloriesRequest().getCaloriesForFood(foodName: text, callback: {result, error in
//                print(result)
//            })
//        }
    }
}
