//
//  MapVC.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/12/22.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var setMapView: MKMapView!
    @IBOutlet weak var openCameraButton: UIButton!
    @IBOutlet weak var centerMapViewButton: UIButton!
    @IBOutlet weak var leadingConstraintForMenuView: NSLayoutConstraint!
    
    var setLocations: [Locations] = []
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMapView()
        configureLocationManager()
        enableLocationServices()
        centerMapViewOnUserLocation()
        
        layoutButtons()
        self.menuView.isHidden = true
        configureNavegationBar()
        centerButtonToUserLocation()
    }
    
    // MARK: Helper Functions
    func centerMapViewOnUserLocation() {
        guard let _corrdinate = locationManager.location?.coordinate else {
            return
        }
        let region = MKCoordinateRegion(center: _corrdinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
        setMapView.setRegion(region, animated: true)
    }
    
    func configureLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        self.setMapView.register(ScooterAnnotationView.self,
                                 forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        disppalyLocations()
    }
    
    func configureMapView() {
        setMapView.showsUserLocation = true
        setMapView.userTrackingMode = .follow
    }
    
    func layoutButtons() {
        setBtnLayout(centerMapViewButton)
        setBtnLayout(openCameraButton)
    }
    
    // MARK: Selectors
    @objc func dismissMenu() {
        self.menuView.isHidden = true
        configureNavegationBar()
    }
    
    @objc func handleBtnOnCenteringLocation() {
        centerMapViewOnUserLocation()
    }
    
    @objc func handleBtnMenueToggle() {
        if ((navigationItem.leftBarButtonItem?.isSelected) != nil) {
            navigationItem.leftBarButtonItem = UIBarButtonItem(image:
                                                            UIImage(named: "return"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(dismissMenu))
            navigationItem.leftBarButtonItem?.tintColor = UIColor(displayP3Red: 119/255, green: 136/255, blue: 153/255, alpha: 1)
        }
        self.menuView.isHidden = false
        leadingConstraintForMenuView.constant = 0
    }
    
    func configureNavegationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image:
                                                        UIImage(named: "menu")?
                                                        .withRenderingMode(.alwaysOriginal),
                                                        style: .plain,
                                                        target: self, action: #selector(handleBtnMenueToggle))
    }
    
    func centerButtonToUserLocation() {
        centerMapViewButton.setImage(UIImage(named: "locationArrow")?.withRenderingMode(.alwaysOriginal), for: .normal)
        centerMapViewButton.addTarget(self, action: #selector(handleBtnOnCenteringLocation), for: .touchUpInside)
    }
}

extension MapVC: CLLocationManagerDelegate, MKMapViewDelegate {
    func enableLocationServices() {
        let managerStatus = CLLocationManager()
        switch managerStatus.authorizationStatus {
        case .notDetermined:
            print("Location authorize statues is notDetermined")
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Location authorize statues is restricted")
        case .denied:
            print("Location authorize statues is denied")
        case .authorizedAlways:
            print("Location authorize statues is authorizedAlways")
        case .authorizedWhenInUse:
            print("Location authorize statues is authorizedWhenInUse")
        @unknown default:
            print("Location !!!!!")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        centerMapViewOnUserLocation()
    }
}

extension MapVC {
    func disppalyLocations() {
        setLocations = [
            Locations(title: "Near N 15th St", latitude: 40.72374871275206, longitude: -73.95797000170732),
            Locations(title: "Near 33 Nassau Ave", latitude: 40.72338640610774, longitude: -73.95184438854609),
            Locations(title: "Kent Ave, At the Corner og N 13th St", latitude: 40.723077391513925, longitude: -73.95861931015554),
            Locations(title: "210 N 12th St, Between Driggs Av and 12th St", latitude: 40.71982804633529, longitude: -73.95376265342271),
            Locations(title: "Near Greenpoint Terminal Market", latitude: 40.72829297632462, longitude: -73.9603510697253),
            Locations(title: "365 5th Ave", latitude: 40.748633705043446, longitude: -73.98410282089543),
            Locations(title: "1 W 34th St", latitude: 40.748862141409724, longitude: -73.9851151204778),
            Locations(title: "Midtown Manhattan", latitude: 40.730537, longitude: -73.98143770120748),
            Locations(title: "32 Waverly Pl, Near Washington Square Park", latitude: 40.73011155124369, longitude: -73.995560),
            Locations(title: "25 W 3rd St", latitude: 40.72858658021798, longitude: -73.99645061230643),
            Locations(title: "Clost to 504 Grand S", latitude: 40.715375867486735, longitude: -73.98195762409225),
            Locations(title: "At the Corner of 87 Attorney St", latitude: 40.71819685824619, longitude: -73.98480577145438),
            Locations(title: "In Front of Remedy Diner", latitude: 40.72179108084684, longitude: -73.98557816760069),
            Locations(title: "Near NYC Pet", latitude: 40.71862968335396, longitude: -73.96397765167431),
            Locations(title: "At Domino Park", latitude: 40.71532904661726, longitude: -73.96741346902077),
            Locations(title: "Close To Beacon's Closet", latitude: 40.7239282791428, longitude: -73.9525489539229),

            Locations(title: "At Crescent St Park", latitude: 40.7572860012547, longitude: -73.93325955906612),
            Locations(title: "Near Astoria Delancy Inn & Suites", latitude: 40.75755950636556, longitude: -73.93630911819885),
            Locations(title: "31st Ave & 35th St Astoria", latitude: 40.76326060805863, longitude: -73.92030713379543),
            Locations(title: "Near Museum of the Moving Image", latitude: 40.75663395388541, longitude: -73.92394406883466),
            Locations(title: "Brooklyn Boulders Queensbridge", latitude: 40.75310343241746, longitude: -73.93990930070636)
        ]

        for locations in setLocations {
            let annotation = MKPointAnnotation()
            annotation.title = locations.title

            let location = CLLocationCoordinate2D(latitude: locations.latitude , longitude: locations.longitude)
            annotation.coordinate = location
            setMapView.addAnnotation(annotation)
        }
    }
}
