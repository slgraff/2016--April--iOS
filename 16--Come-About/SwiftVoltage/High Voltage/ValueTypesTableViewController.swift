//
//  ValueTypesTableViewController.swift
//  High Voltage
//
//  Created by Ben Gohlke on 7/26/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ValueTypesTableViewController: UITableViewController
{

    var delegate: ValueTypesViewControllerDelegate?
    var valueTypes = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
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
        return valueTypes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("TypeCell", forIndexPath: indexPath) 

        cell.textLabel?.text = self.valueTypes[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        delegate?.valueTypeWasChosen(valueTypes[indexPath.row])
    }
}
