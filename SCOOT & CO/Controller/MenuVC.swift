//
//  ProfileVC.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/14/22.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var setMainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpMenu()
    }
    
    
    private func setUpMenu() {
        self.setMainView.layer.cornerRadius = 20
        self.setMainView.clipsToBounds = true
    }
}
