//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Destiny Sopha on 8/17/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import Foundation


class CalculatorLogic: UIViewController {

      // Code to handle the black buttons
      if let calcMethod = sender.currentTitle {
        if calcMethod == "AC" {
          displayLabel.text = "0"
        } else if calcMethod == "+/-" {
          displayValue = displayValue * -1
        } else if calcMethod == "%" {
          displayValue = displayValue / 100
        }
      }

  
  
  
  
  
  
}
