//
//  OnboardingCell.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/7/22.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    static let slideIdentifier = "slideCell"
    
    @IBOutlet weak var slideimage: UIImageView!
    @IBOutlet weak var slideTitle: UILabel!
    @IBOutlet weak var slideDescription: UILabel!
}


extension OnboardingCell {
    func setSlideValue(_ slide: Slide) {
        slideimage.image = slide.image
        slideTitle.text = slide.title
        slideDescription.text = slide.description
    }
}



