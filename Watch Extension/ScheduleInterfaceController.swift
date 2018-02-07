//
//  ScheduleInterfaceController.swift
//  Watch Extension
//
//  Created by akhil mantha on 07/02/18.
//  Copyright © 2018 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class ScheduleInterfaceController: WKInterfaceController {

    @IBOutlet var flightsTable: WKInterfaceTable!
    var flights = Flight.allFlights()
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        flightsTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
    }

}
