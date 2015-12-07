//
//  FlightRowController.swift
//  IronSkies
//
//  Created by Ben Gohlke on 12/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import WatchKit

class FlightRowController: NSObject
{
    @IBOutlet var separator: WKInterfaceSeparator!
    @IBOutlet var originLabel: WKInterfaceLabel!
    @IBOutlet var destinationLabel: WKInterfaceLabel!
    @IBOutlet var flightNumberLabel: WKInterfaceLabel!
    @IBOutlet var statusLabel: WKInterfaceLabel!
    
    var flight: Flight?
    {
        didSet
        {
            if let flight = flight
            {
                originLabel.setText(flight.origin)
                destinationLabel.setText(flight.destination)
                flightNumberLabel.setText(flight.number)
                if flight.onSchedule
                {
                    statusLabel.setText("On time")
                }
                else
                {
                    statusLabel.setText("Delayed")
                    statusLabel.setTextColor(UIColor.redColor())
                }
            }
        }
    }
}