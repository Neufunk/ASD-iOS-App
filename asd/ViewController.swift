//
//  ViewController.swift
//  ASD-iOS-App
//
//  Created by Johnathan on 19/04/18.
//  Copyright © 2018 Liblum. All rights reserved.
//  github.com/Neufunk/ASD-iOS-App
//
// INDEX //
// Keep that order when populating arrays !
/************
 0 - NAMUR
 1 - PHILIPPEVILLE
 2 - CINEY
 3 - GEDINNE
 ************/

import UIKit
import CoreLocation
import CallKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var findCenterButton: UIButton!
    @IBOutlet weak var upperLogo: UIImageView!
    
    var locationManager: CLLocationManager!
    var currentCoordinate = CLLocation(latitude: 0.0, longitude: 0.0)
    let data = Data()
    let effect = Effect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        findCenterButton.roundedButton(corner: .topLeft, corner2: .bottomRight)
        findCenterButton.alpha = 0
        upperLogo.alpha = 0
    }
    
    @IBAction func onFindCenterButtonClick(_ sender: Any) {
        findNearestCenter()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        findCenterButton.pulsate()
        findCenterButton.fadeIn(duration: 2, delay: 0)
        upperLogo.fadeIn(duration: 2, delay: 0)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        currentCoordinate = CLLocation(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
    }
    
    private func findNearestCenter() {
        var finaleDistance = currentCoordinate.distance(from: data.arrayLocation[Data.centre]!)
        for (key, _) in data.arrayLocation {
            let newDistance = currentCoordinate.distance(from: data.arrayLocation[key]!)
            if newDistance < finaleDistance {
                finaleDistance = newDistance
                Data.centre = key
                Data.distance = Double(round(finaleDistance))
            }
        }
    }
}

