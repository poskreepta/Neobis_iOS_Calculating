//
//  CalcService.swift
//  CalculatorApp
//
//  Created by poskreepta on 18.05.23.
//

import Foundation

struct CalculatorModel {
    
    var firstOperand: Float
    var secondOperand: Float
    var operation: Operation
    
    func calculate() -> Float {
        switch operation {
        case .addition:
            return firstOperand + secondOperand
        case .substraction:
            return firstOperand - secondOperand
        case .multiplication:
            return firstOperand * secondOperand
        case .division:
            return firstOperand / secondOperand
        }
    }
}

enum Operation {
    case addition, substraction, multiplication, division
}

