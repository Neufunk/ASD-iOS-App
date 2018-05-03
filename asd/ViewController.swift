//
//  ViewController.swift
//  ASD-iOS-App
//
//  Created by Johnathan on 19/04/18.
//  Copyright © 2018 Liblum. All rights reserved.
//  github.com/Neufunk/ASD-iOS-App

import UIKit
import CoreLocation
import CallKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var findCenterButton: UIButton!
    @IBOutlet weak var upperLogo: UIImageView!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    
    var locationManager: CLLocationManager!
    var currentCoordinate = CLLocation(latitude: 0.0, longitude: 0.0)
    let data = Data()
    
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
        infoButton.roundedButton(corner: .topLeft, corner2: .bottomRight)
        blurView.alpha = 0
        findCenterButton.alpha = 0
        upperLogo.alpha = 0
        infoButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        findCenterButton.fadeIn(duration: 2, delay: 0)
        upperLogo.fadeIn(duration: 2, delay: 0)
        infoButton.fadeIn(duration: 2, delay: 0)
        findCenterButton.pulsate()
    }
    
    @IBAction func onFindCenterButtonClick(_ sender: Any) {
        findNearestCenter()
    }
    
    @IBAction func onInfoButtonClick(_ sender: Any) {
        blurView.alpha = 1
        let alert = UIAlertController(title: "Informations", message: "Cliquez sur le bouton ci-dessous pour rechercher un centre ASD. Vos données de géolocalisation seront utilisées pour trouver le centre le plus proche de vous. Vos informations ne seront ni stockées, ni partagées avec des tiers.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            self.blurView.alpha = 0
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        currentCoordinate = CLLocation(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        Data.userLocation = userLocation
    }
    
    func findNearestCenter() {
        var finaleDistance = currentCoordinate.distance(from: data.arrayLocation[Data.centre]!)
        for (key, _) in data.arrayLocation {
            let newDistance = currentCoordinate.distance(from: data.arrayLocation[key]!)
            if newDistance < finaleDistance {
                finaleDistance = newDistance
                Data.centre = key
                Data.distance = Double(round(finaleDistance/10)*10)
            }
        }
    }
}

