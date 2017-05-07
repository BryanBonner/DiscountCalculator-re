//
//  CalculatorViewController.swift
//  DiscountCalculator
//
//  Created by Bryan Bonner on 3/13/17.
//  CPSC 411 - Assignment 3
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    
    //this allows us to create a constant to this shared instance of calculator data
    let Data: CalculatorData = CalculatorData.shared
    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var dollarsOffTextField: UITextField!
    @IBOutlet weak var discountPercTextField: UITextField!
    @IBOutlet weak var otherDiscountTextField: UITextField!
    @IBOutlet weak var taxPercTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        priceTextField.delegate = self
        dollarsOffTextField.delegate = self
        discountPercTextField.delegate = self
        otherDiscountTextField.delegate = self
        taxPercTextField.delegate = self
        
        // Reset values when user swipes - used in place of unWind
        priceTextField.text = Data.price.description
        dollarsOffTextField.text = Data.dollarsOff.description
        discountPercTextField.text = Data.discountPerc.description
        otherDiscountTextField.text = Data.otherDiscountPerc.description
        taxPercTextField.text = Data.taxPerc.description
        priceLabel.text = Data.originalPrice.description
        discountLabel.text = Data.discountPrice.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
            case priceTextField:
                Data.price = Double(priceTextField.text!)!
            case dollarsOffTextField:
                Data.dollarsOff = Double(dollarsOffTextField.text!)!
            case discountPercTextField:
                Data.discountPerc = Double(discountPercTextField.text!)!
            case otherDiscountTextField:
                Data.otherDiscountPerc = Double(otherDiscountTextField.text!)!
            case taxPercTextField:
                Data.taxPerc = Double(taxPercTextField.text!)!
            default:
                break
        }
        
        //calculate discount and original price text everytime user finishes keyboard typing
        priceLabel.text = String(format: "%.2f", Data.calcOriginalWithTax())
        discountLabel.text = String(format: "%.2f", Data.calculateDiscount())
    }
 
}

