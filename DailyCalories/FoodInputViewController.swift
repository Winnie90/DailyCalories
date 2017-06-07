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
    
    public var foodInput: ((Int) -> (Void))?
        
    @IBOutlet weak var caloriesInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        caloriesInput.becomeFirstResponder()
        caloriesInput.textColor = UIColor.white
        caloriesInput.delegate = self
    }
    
    private func convertTextToCalories(caloriesText text: String?) -> Int {
        guard let caloriesAsString = text else { return 0 }
        let index = caloriesAsString.index(caloriesAsString.endIndex, offsetBy: -units.characters.count)
        let caloriesWithoutUnits = caloriesAsString.substring(to: index)
        guard let caloriesAsInt = Int(caloriesWithoutUnits) else { return 0 }
        return caloriesAsInt
    }

    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        let calories = convertTextToCalories(caloriesText: caloriesInput.text)
        dismiss(animated: true) { [weak self] in
            if let strongSelf = self {
                strongSelf.foodInput?(calories)
            }
        }
    }

}

extension FoodInputViewController : UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if let text = textField.text {
            textField.text = "\(text)\(units)"
            let newPosition = textField.beginningOfDocument
            textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
        } else {
            textField.text = ""
        }
    }

}
