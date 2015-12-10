//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 10/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

enum OperatorType: Int
{
    case None = 1
    case Addition
    case Subtraction
    case Multiplication
    case Division
}

class CalculatorBrain
{
    var operand1String = ""
    var operand2String = ""
    var type: OperatorType = .None
    var userIsTypingANumber: Bool = false
    var calculationError: Bool = false
    
    func addOperandDigit(digit: String) -> String
    {
        if type == .None
        {
            operand1String += digit
            return operand1String
        }
        else
        {
            operand2String += digit
            return operand2String
        }
    }
    
    func setOperator(opType: String) -> Double?
    {
        var solution: Double?
        switch opType
        {
        case "+":
            type = .Addition
        case "−":
            type = .Subtraction
        case "×":
            type = .Multiplication
        case "÷":
            type = .Division
        case "=":
            solution = calculateIfPossible()
        default:
            type = .None
        }
        
        return solution
    }
    
    func calculateIfPossible() -> Double?
    {
        var solution: Double?
        if operand1String != "" && operand2String != "" && type != .None
        {
            switch type
            {
            case .Addition:
                solution = Double(operand1String)! + Double(operand2String)!
            case .Subtraction:
                solution = Double(operand1String)! - Double(operand2String)!
            case .Multiplication:
                solution = Double(operand1String)! * Double(operand2String)!
            case .Division:
//                if Double(operand2String)! != 0.0
//                {
                    solution = Double(operand1String)! / Double(operand2String)!
//                }
//                else
//                {
//                    calculationError = true
//                }
            default: break
            }
        }
        
        return solution
    }
}