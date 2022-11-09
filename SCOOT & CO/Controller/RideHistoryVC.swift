//
//  RideHistoryVC.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/20/22.
//

import UIKit

class RideHistoryVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArray = [DataHistoryModel]()
    
    var selectIndex = -1
    var isCoollapce = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableView.automaticDimension
        getData()
        navigationItem.title = "Ride History"
    }
    
    func getData() {
        dataArray = DataHistory().dataHistory
    }
    
    // Reload the tableview data when you rotate the device
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.reloadData()
    }
}

extension RideHistoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectIndex == indexPath.row &&
            isCoollapce == true {
            return 300
        } else {
            return 50
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RideHistoryCell", for: indexPath) as! RideHistoryCell
        cell.ttpeOfRideLabel.text = dataArray[indexPath.row].dayOfRide
        cell.mapImage.image = UIImage(named: "\(dataArray[indexPath.row].rideRoute)")
        cell.timeOfRideLabel.text = dataArray[indexPath.row].rideType
        cell.distanceLabel.text = dataArray[indexPath.row].rideCost
        cell.saleTaxLabel.text = dataArray[indexPath.row].rideCityTax
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if selectIndex == indexPath.row {
            if self.isCoollapce == false {
                self.isCoollapce = true
            } else {
                self.isCoollapce = false
            }
        } else {
            self.isCoollapce = true
        }
        self.selectIndex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

