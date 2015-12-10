//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Ben Gohlke on 12/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase
{
    override func setUp()
    {
        super.setUp()
    }
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBrainCreated()
    {
        // given
        let brain = CalculatorBrain()
        
        // when
        XCTAssertNotNil(brain, "brain object not properly instantiated")
    }
    
    func testAddOperand()
    {
        // given
        let brain = CalculatorBrain()
        let existingOperand1 = brain.operand1String
        
        // when
        brain.addOperandDigit("4")
        
        // then
        let newOperand1 = "\(existingOperand1)4"
        XCTAssertEqual(brain.operand1String, newOperand1, "Operand not properly added")
        
    }
    
    func testCalculateIfNeeded()
    {
        // given
        let brain = CalculatorBrain()
        brain.operand1String = "12"
        brain.operand2String = "18"
        brain.setOperator("+")
        
        // when
        let solution = brain.setOperator("=")
        
        // then
        XCTAssertEqual(solution, 30.0, "Solution not found (should = 30)")
    }
    

    
}
