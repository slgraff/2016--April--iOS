//
//  ElectricityConversions.swift
//  High Voltage
//
//  Created by Ben Gohlke on 7/26/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import Foundation

class ElectricityConversions
{
    var allValuesFound: Bool
    var delegate: ElectricityConversionsDelegate?
    
    var ampsString: String
    var ohmsString: String
    var wattsString: String
    var voltsString: String
    
    init()
    {
        allValuesFound = false
        ampsString = ""
        ohmsString = ""
        wattsString = ""
        voltsString = ""
    }
    
    func findOtherValuesIfPossible()
    {
        var count = 0
        if ampsString != ""
        {
            count++
        }
        if ohmsString != ""
        {
            count++
        }
        if wattsString != ""
        {
            count++
        }
        if voltsString != ""
        {
            count++
        }
        if count >= 2
        {
            calculateAllValues()
        }
        
    }
    
    private func calculateAllValues()
    {
        var amps = 0.0, ohms = 0.0, volts = 0.0, watts = 0.0
        if ohmsString != "" && voltsString != ""
        {
            ohms = (ohmsString as NSString).doubleValue
            volts = (voltsString as NSString).doubleValue
            amps = volts / ohms
            watts = volts * amps
        }
        else if ohmsString != "" && ampsString != ""
        {
            ohms = (ohmsString as NSString).doubleValue
            amps = (ampsString as NSString).doubleValue
            volts = amps * ohms
            watts = volts * amps
        }
        else if ohmsString != "" && wattsString != ""
        {
            ohms = (ohmsString as NSString).doubleValue
            watts = (wattsString as NSString).doubleValue
            amps = sqrt(watts / ohms)
            volts = amps * ohms
        }
        else if ampsString != "" && voltsString != ""
        {
            volts = (voltsString as NSString).doubleValue
            amps = (ampsString as NSString).doubleValue
            ohms = volts / amps
            watts = volts * amps
        }
        else if wattsString != "" && ampsString != ""
        {
            watts = (wattsString as NSString).doubleValue
            amps = (ampsString as NSString).doubleValue
            volts = watts / amps
            ohms = volts / amps
        }
        else if voltsString != "" && wattsString != ""
        {
            volts = (voltsString as NSString).doubleValue
            watts = (wattsString as NSString).doubleValue
            amps = watts / volts
            ohms = volts / amps
        }
        
        voltsString = "\(volts)"
        ampsString = "\(amps)"
        ohmsString = "\(ohms)"
        wattsString = "\(watts)"
        
        allValuesFound = true
        delegate?.valuesWereCalculated()
    }
}