//
//  DataHistory.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/27/22.
//

import Foundation
import UIKit

class DataHistory {
    var dataHistory = [
        DataHistoryModel(dayOfRide: "June 13, 2022, 10am",
                         rideType: "Standar",
                         rideRoute: "map0",
                         rideCost: "Scoot ride (0.94mile, - 10mi 7s)\t$10.55",
                         rideCityTax: "New York Sales Tax\t$0.75"),
        DataHistoryModel(dayOfRide: "June 15, 2022, 7pm",
                         rideType: "Standar",
                         rideRoute: "map1",
                         rideCost: "Scoot ride (1.4mile, - 15mi)\t$13.05",
                         rideCityTax: "New York Sales Tax\t$0.79"),
        DataHistoryModel(dayOfRide: "June 20, 2022, 7am",
                         rideType: "Long Range",
                         rideRoute: "map2",
                         rideCost: "Scoot ride (2.4mile, - 25mi)\t$19.05",
                         rideCityTax: "New York Sales Tax\t$2.79")
    ]
}
