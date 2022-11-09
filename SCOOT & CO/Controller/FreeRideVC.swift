//
//  FreeRideVC.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 11/3/22.
//

import UIKit

class FreeRideVC: UIViewController {
    

    @IBOutlet weak var shareRideButton: UIButton!
    @IBOutlet weak var copyRideButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareRideButton.layer.cornerRadius = 15.0
        copyRideButton.layer.cornerRadius = 15.0
        navigationItem.title = "Free Ride"
    }
    @IBAction func shareARideButtonPressed(_ sender: Any) {
        let infoText = "Check out SCOOT&CO"
        let url:NSURL = NSURL(string: "https://www.apple.com/app-store/")!
        let img = UIImage(named: "launchScreen")
        
        
        let activityController = UIActivityViewController(activityItems: [infoText,url,img!], applicationActivities: [])
        if let popover = activityController.popoverPresentationController {
            popover.sourceView = self.view
            popover.sourceRect = self.view.frame
        }
        self.present(activityController, animated: true)
    }
}
