//
//  RidePassVC.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 11/7/22.
//

import UIKit

class RidePassVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Ride Pass"
    }
}

extension RidePassVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.StoryBoard.ridePassCell, for: indexPath) as! RidePassCell
        
        return cell
    }
}
