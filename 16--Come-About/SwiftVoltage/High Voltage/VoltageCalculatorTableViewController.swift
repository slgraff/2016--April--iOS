//
//  VoltageCalculatorTableViewController.swift
//  High Voltage
//
//  Created by Ben Gohlke on 7/26/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol ValueTypesViewControllerDelegate
{
    func valueTypeWasChosen(chosenValueType: String)
}

protocol ElectricityConversionsDelegate
{
    func valuesWereCalculated()
}

class VoltageCalculatorTableViewController: UITableViewController, ValueTypesViewControllerDelegate, ElectricityConversionsDelegate, UITextFieldDelegate, UIPopoverPresentationControllerDelegate
{
    
    @IBOutlet weak var clearBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var addValueTypeBarButtonItem: UIBarButtonItem!
    
    var currentTextField: UITextField?
    var resistanceTextField: UITextField?
    var voltageTextField: UITextField?
    var powerTextField: UITextField?
    
    var converter: ElectricityConversions?
    
    var tableData = [String]()
    var valueTypes: Dictionary<String, String> = ["Amps": "CurrentCell", "Ohms": "ResistanceCell", "Volts": "VoltageCell", "Watts": "PowerCell"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "High Voltage"
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tableData.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if tableData.count > 0
        {
            return "Enter two values"
        }
        else
        {
            return ""
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifier = tableData[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) 

        let textField = cell.viewWithTag(1) as! UITextField
        textField.text = ""
        textField.delegate = self
        textField.userInteractionEnabled = !converter!.allValuesFound
        
        switch identifier
        {
        case "CurrentCell":
            currentTextField = textField
            if converter?.ampsString != ""
            {
                textField.text = converter?.ampsString
            }
            
        case "ResistanceCell":
            resistanceTextField = textField
            if converter?.ohmsString != ""
            {
                textField.text = converter?.ohmsString
            }
            
        case "PowerCell":
            powerTextField = textField
            if converter?.wattsString != ""
            {
                textField.text = converter?.wattsString
            }
            
        case "VoltageCell":
            voltageTextField = textField
            if converter?.voltsString != ""
            {
                textField.text = converter?.voltsString
            }
            
        default:
            print("")
        }

        let keys = (valueTypes as NSDictionary).allKeysForObject(identifier) as! [String]
        let keyToRemove = keys[0]
        valueTypes.removeValueForKey(keyToRemove)

        textField.becomeFirstResponder()

        return cell
    }
    
    // MARK: - UITextField delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        if textField.text != ""
        {
            rc = true
            if textField == currentTextField
            {
                converter?.ampsString = textField.text!
            }
            if textField == resistanceTextField
            {
                converter?.ohmsString = textField.text!
            }
            if textField == voltageTextField
            {
                converter?.voltsString = textField.text!
            }
            if textField == powerTextField
            {
                converter?.wattsString = textField.text!
            }
        }
        
        if rc
        {
            textField.resignFirstResponder()
        }
        
        converter?.findOtherValuesIfPossible()
        
        return rc
    }
    
    // MARK: - ValueTypesViewController delegate
    
    func valueTypeWasChosen(chosenValueType: String)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        if converter == nil
        {
            converter = ElectricityConversions()
            converter?.delegate = self
        }
        
        let cellIdentifier = valueTypes[chosenValueType]
        tableData.append(cellIdentifier!)
        if tableData.count == 2
        {
            addValueTypeBarButtonItem.enabled = false
        }
        
        let row = (tableData as NSArray).indexOfObject(cellIdentifier!)
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: row, inSection: 0)], withRowAnimation: .Automatic)
    }
    
    // MARK: - ElectricityConversions delegate
    
    func valuesWereCalculated()
    {
        resetValueTypesDictionary()
        
        if voltageTextField == nil
        {
            let cellIdentifier = valueTypes["Volts"]
            tableData.append(cellIdentifier!)
        }
        if currentTextField == nil
        {
            let cellIdentifier = valueTypes["Amps"]
            tableData.append(cellIdentifier!)
        }
        if resistanceTextField == nil
        {
            let cellIdentifier = valueTypes["Ohms"]
            tableData.append(cellIdentifier!)
        }
        if powerTextField == nil
        {
            let cellIdentifier = valueTypes["Watts"]
            tableData.append(cellIdentifier!)
        }
        
        tableView.reloadData()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func clearTransaction(sender: UIBarButtonItem)
    {
        tableData.removeAll(keepCapacity: true)
        addValueTypeBarButtonItem.enabled = true
        converter = nil
        voltageTextField = nil
        currentTextField = nil
        resistanceTextField = nil
        powerTextField = nil
        resetValueTypesDictionary()
        tableView.reloadData()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowValueTypePopoverSegue"
        {
            let valueTypesVC = segue.destinationViewController as! ValueTypesTableViewController
            valueTypesVC.delegate = self
            valueTypesVC.popoverPresentationController?.delegate = self
            let contentHeight = 44.0 * CGFloat(valueTypes.count)
            valueTypesVC.preferredContentSize = CGSizeMake(CGFloat(100.0), contentHeight)
            valueTypesVC.valueTypes = Array(valueTypes.keys)
        }
    }
    
    // MARK: - UIPopoverPresentation delegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None
    }
    
    // MARK: - Private methods
    
    func resetValueTypesDictionary()
    {
        valueTypes.removeAll(keepCapacity: true)
        valueTypes = ["Amps": "CurrentCell", "Ohms": "ResistanceCell", "Volts": "VoltageCell", "Watts": "PowerCell"]
    }
}
