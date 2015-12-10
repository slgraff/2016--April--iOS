//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 10/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController
{

    @IBOutlet var outputLabel: UILabel!
    
    var brain: CalculatorBrain?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        brain = CalculatorBrain()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func operandTapped(sender: UIButton)
    {
        let completeOperand = brain?.addOperandDigit((sender.titleLabel?.text)!)
        outputLabel.text = completeOperand
    }
    
    @IBAction func operatorTapped(sender: UIButton)
    {
        if let solution = brain?.setOperator((sender.titleLabel?.text)!)
        {
            outputLabel.text = "\(solution)"
            brain = nil
            brain = CalculatorBrain()
        }
    }
    
    @IBAction func clearTapped(sender: UIButton)
    {
        brain = nil
        brain = CalculatorBrain()
        outputLabel.text = "0"
    }
}

