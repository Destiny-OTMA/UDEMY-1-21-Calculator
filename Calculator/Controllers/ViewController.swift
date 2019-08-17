//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var displayLabel: UILabel!
  
  private var isFinishedTypingNumber: Bool = true
  
  
  @IBAction func calcButtonPressed(_ sender: UIButton) {
    
    //What should happen when a non-number button is pressed
    
    isFinishedTypingNumber = true
    
    guard let number = Double(displayLabel.text!) else {
      fatalError("Cannot convert display label text to a Double.")
    }
    
    // Code to handle the black buttons
    if let calcMethod = sender.currentTitle {
      if calcMethod == "AC" {
        displayLabel.text = "0"
      } else if calcMethod == "+/-" {
        displayLabel.text = String(number * -1)
      } else if calcMethod == "%" {
        displayLabel.text = String(number / 100)
      }
    }
  }
  
  
  @IBAction func numButtonPressed(_ sender: UIButton) {
    
    //What should happen when a number is entered into the keypad
    
    
    if let numValue = sender.currentTitle {
      
      if isFinishedTypingNumber {
        displayLabel.text = numValue
        isFinishedTypingNumber = false
      } else {
        
        // Check to see if a decimal point has already been entered
        // and if it already has, then do not allow another one.
        if numValue == "." {
          
          guard let currentDisplayValue = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to a Double!.")
          }
          
          let isInt = floor(currentDisplayValue) == currentDisplayValue
          
          if !isInt {
            return
          }

        }
        
        displayLabel.text = displayLabel.text! + numValue
        
      }
      
    }
    
  }
  
}

