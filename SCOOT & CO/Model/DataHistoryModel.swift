//
//  DataHistoryModel.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/27/22.
//

import Foundation
import UIKit

class DataHistoryModel {
    var dayOfRide: String
    var rideType: String
    var rideRoute: String
    var rideCost: String
    var rideCityTax: String
    
    init(dayOfRide: String, rideType: String, rideRoute: String, rideCost: String, rideCityTax: String) {
        self.dayOfRide = dayOfRide
        self.rideType = rideType
        self.rideRoute = rideRoute
        self.rideCost = rideCost
        self.rideCityTax = rideCityTax
    }
}

