//
//  CalculatorLogic.swift
//  CalculatorPro
//
//  Created by M1086168 on 16/01/23.
//

import Foundation

struct CalculatorLogic {
    private var number : Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double)
    {
        self.number = number
    }
    
    
    mutating func calculate(_ symbol: String) -> Double?
    {
    
        if let n = number {
            switch symbol{
            case "+/-":
                return  n * -1
            case "%" :
                return n * 0.01
            case "AC":
                return 0
            case"=":
                return performTwoNumberCalculation(n2:n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    private func performTwoNumberCalculation(n2: Double)-> Double?{
        if let n1 =  intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1+n2
            case "-":
                return n1-n2
            case "ᳵ":
                return n1*n2
            case "÷" :
                return n1/n2
            default:
                fatalError("The operation passed is does not match any of the cases")
            }
        }
        return nil
    }
    
}
