//
//  RideHistoryCell.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/20/22.
//

import UIKit

class RideHistoryCell: UITableViewCell {
    
    @IBOutlet weak var ttpeOfRideLabel: UILabel!
    @IBOutlet weak var timeOfRideLabel: UILabel!
    
    @IBOutlet weak var mapImage: UIImageView!
    
    
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var saleTaxLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
