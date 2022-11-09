//
//  RideInfoData.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/25/22.
//

import Foundation
import UIKit

// How To Ride SCOOT&CO data
extension HowToRideVC {
    func displayScootInfo(scootInfo : [HowToRide]) {
        self.scootInfo = [
            HowToRide(title: "Find a Scoot",
                        description: "Use the map in the Scoot app to find the nearest Scoot."),
            HowToRide(title: "Start your Scoot",
                        description: "Scan the Scoot's QR code with your app. Start your Scoot by hitting the throttle on the right."),
            HowToRide(title: "Be safe, have fun",
                        description: "Wear a helmet for safety and follow all local traffic rules."),
            HowToRide(title: "Park your Scoot",
                        description: "When you're ready to stop, park your Scoot in a designated parking area where it's easily accessible again, but clear of access ways.")
        ]
    }
}

// Slide Welcome Screen
extension OnboardingVC {
    func displaySlideView(setSlide: [Slide]) {
        self.setSlide = [
            Slide(title: "Easy access from anywhere",
                  description: "SCOOT & CO offers easy access to move around the city",
                  image:  UIImage(named: "eassyAccess")!),
            Slide(title: "Unlocked using a QR code",
                  description: "SCOOT & CO offers easy access to move around the city",
                  image:  UIImage(named: "qrCode")!),
            Slide(title: "Easy access from anywhere",
                  description: "SCOOT & CO offers easy access to move around the city",
                  image:  UIImage(named: "eassyAccess")!)
        ]
    }
}

