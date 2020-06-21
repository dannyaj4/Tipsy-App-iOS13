//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculateTip = 0.1
    var numberOfPeople = 2
    var inputNumber = 0.0
    var labelResult: String?
    var thePct = 0.0
    var theCalculateTip: String = ""
    
    
    
    @IBAction func tipChange(_ sender: UIButton) {
      
        var tipButtonChange = sender.currentTitle!
        if tipButtonChange == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if tipButtonChange == "10%" {
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else {
            twentyPctButton.isSelected = true
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
        }
        
        billTextField.endEditing(true)
       
               
       
        
    }

    @IBAction func stepperValueChange(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int((sender.value))
        
    }
    
    func getCalculate() {
        inputNumber = Double(billTextField.text!)!
        if zeroPctButton.isSelected == true {
            calculateTip = inputNumber / Double(numberOfPeople)
        } else if tenPctButton.isSelected == true {
            thePct = 0.1
            calculateTip = inputNumber * thePct / Double(numberOfPeople)
        } else {
            thePct = 0.2
            calculateTip = inputNumber * thePct / Double(numberOfPeople)
        }

    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        getCalculate()
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    func getLabelResult() -> String {
        labelResult = "Split between \(numberOfPeople) people, with \(inputNumber) tip "
        return labelResult!
    }
    
    
//MARK: - UIStoryboardSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationValue = segue.destination as! ResultViewController
            destinationValue.labelResult = getLabelResult()
            destinationValue.theLabel = calculateTip
        }
    }
    
    
    

}

