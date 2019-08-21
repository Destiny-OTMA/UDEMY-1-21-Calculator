//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Destiny Sopha on 8/17/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
  
  // Angela called her variable number, I called mine displayedNumber
  private var displayedNumber: Double?
  
  private var intermediateCalculation: (firstNumber: Double, calcMethod: String)?
  
  mutating func setDisplayedNumber(_ number: Double) {
    self.displayedNumber = number
  }
  
  mutating func calculate(symbol: String) -> Double? {
    
    if let n = displayedNumber {
      
      // Code to handle the black buttons
      switch symbol {
      case "AC":
        return 0
      case "+/-":
        return n * -1
      case "%":
        return n / 100
      case "=":
        return performTwoNumCalculation(secondNumber: n)
      default:
        intermediateCalculation = (firstNumber: n, calcMethod: symbol)
      }
      
    }
    return nil
    
  }
  
  private func performTwoNumCalculation(secondNumber: Double) -> Double? {
    
    if let firstNumber = intermediateCalculation?.firstNumber, let operation = intermediateCalculation?.calcMethod {
      
      switch operation {
      case "÷":
        return firstNumber / secondNumber
      case "×":
        return firstNumber * secondNumber
      case "-":
        return firstNumber - secondNumber
      case "+":
        return firstNumber + secondNumber
      default:
        fatalError("The operation passed in does not match any of the cases.")
      }
    }
    return nil
  }
}

