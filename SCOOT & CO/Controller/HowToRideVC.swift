//
//  HowToRideVC.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/20/22.
//

import UIKit

class HowToRideVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var scootInfo: [HowToRide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        displayScootInfo(scootInfo: scootInfo)
        navigationItem.title = "How to Ride SCOOT&CO"
    }
}

extension HowToRideVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return scootInfo.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "howToScoot", for: indexPath) as! HowToScootCell
        cell.scootLable.text = scootInfo[indexPath.section].title
        cell.scootDescription.text = scootInfo[indexPath.section].description
        return cell
    }
}
