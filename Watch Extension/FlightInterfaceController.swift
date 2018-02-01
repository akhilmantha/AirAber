//
//  FlightInterfaceController.swift
//  Watch Extension
//
//  Created by akhil mantha on 01/02/18.
//  Copyright © 2018 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class FlightInterfaceController: WKInterfaceController {
  
  
  @IBOutlet var flightLabel : WKInterfaceLabel!
  @IBOutlet var routeLabel : WKInterfaceLabel!
  @IBOutlet var boardingLabel : WKInterfaceLabel!
  @IBOutlet var boardTimeLabel : WKInterfaceLabel!
  @IBOutlet var statusLabel : WKInterfaceLabel!
  @IBOutlet var gateLabel : WKInterfaceLabel!
  @IBOutlet var seatLabel : WKInterfaceLabel!
  
  
  var flight : Flight? {
    
    didSet {
      
      guard let flight  = flight else {return}
      
      flightLabel.setText("Flight \(flight.shortNumber) ")
      routeLabel.setText(flight.route)
      boardingLabel.setText("\(flight.number) Boards")
      
      
      
      
    }
    
    
    
    
    
  }
  

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
