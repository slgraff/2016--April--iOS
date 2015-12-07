//
//  ScheduleInterfaceController.swift
//  IronSkies
//
//  Created by Ben Gohlke on 12/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import WatchKit
import Foundation


class ScheduleInterfaceController: WKInterfaceController
{
    
    @IBOutlet var flightsTable: WKInterfaceTable!
    var flights = Flight.allFlights()

    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
        flightsTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
        
        for index in 0..<flightsTable.numberOfRows
        {
            if let controller = flightsTable.rowControllerAtIndex(index) as? FlightRowController
            {
                controller.flight = flights[index]
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int)
    {
        let flight = flights[rowIndex]
        presentControllerWithName("Flight", context: flight)
        
    }
}
