//
//  HowToScootCell.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/20/22.
//

import UIKit

class HowToScootCell: UITableViewCell {

    @IBOutlet weak var scootLable: UILabel!
    @IBOutlet weak var scootDescription: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
