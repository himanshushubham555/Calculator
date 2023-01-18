//
//  ViewController.swift
//  CalculatorPro
//
//  Created by M1086168 on 13/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var isFinishedTypingNumber: Bool = true
    //var decimalIsNotUsed = true
    
    private var displayValue: Double{
        get{
            guard let number = Double(displayLabel.text!) else{
                fatalError("Cannot convert diaplay label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
   
    private var calculator = CalculatorLogic()

    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
       
        calculator.setNumber(displayValue)
        if let calMethod = sender.currentTitle {
            
            if let result = calculator.calculate(calMethod){
                displayValue = result
            }
            
            
//            if calMethod == "+/-" {
//                displayValue *= -1
//            } else if calMethod == "%" {
//               displayValue *= 0.01
//            }
//           else if calMethod == "AC"{
//               displayLabel.text = "0"
//           }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle{
            
            if isFinishedTypingNumber{
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "."{
                    
                    guard let currentDisplayValue = Double(displayLabel.text!) else{
                        fatalError("Cannot convert display label text to a double!")
                    }
                    
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    if !isInt{
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

