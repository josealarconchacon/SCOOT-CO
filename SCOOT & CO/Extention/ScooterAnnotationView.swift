//
//  ScooterAnnotationView.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/12/22.
//

import Foundation
import UIKit
import MapKit

class ScooterAnnotationView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            let scootAnnotationImage = UIImage(named: "kick-scooter")
            let setSize = CGSize(width: 25, height: 25)
            UIGraphicsBeginImageContext(setSize)
            scootAnnotationImage!.draw(in: CGRect(x: 0, y: 0, width: setSize.width, height: setSize.height))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            // Add Image
            self.image = resizedImage
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        // Enable callout
        canShowCallout = true
        // Move the image a little bit above the point.
        centerOffset = CGPoint(x: 0, y: -20)
    }
}
