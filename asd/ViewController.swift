//
//  ViewController.swift
//  ASD-iOS-App
//
//  Created by Johnathan on 19/04/18.
//  Copyright © 2018 Liblum. All rights reserved.
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
    
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var adressButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    var locationManager: CLLocationManager!
    var currentCoordinate = CLLocation(latitude: 0.0, longitude: 0.0);
    var index = 0;
    let arrayLocation = [CLLocation(latitude: 50.4518992, longitude: 4.8725157), CLLocation(latitude: 50.1971293, longitude: 4.5407462), CLLocation(latitude: 50.2937976, longitude: 5.0979676), CLLocation(latitude: 49.9804433, longitude: 4.9367074)]
    let arrayAdress = ["CENTRE DE NAMUR/EGHEZEE \nAvenue de la Dame 93 \n5100 Jambes", "CENTRE DE PHILIPPEVILLE \nRue de l'Arsenal 7 bte 2 \n5600 Philippeville", "CENTRE DE CINEY \nRue Ed. Dinot 21 \n5590 Ciney", "CENTRE DE GEDINNE \nRue R.Gridlet 8 \n5575 Gedinne"]
    let arrayPhoneNumber = ["081257457", "071610088", "083214108", "061589508"]
    
    override func viewDidLoad() {
        super.viewDidLoad();
        locationManager = CLLocationManager();
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.requestWhenInUseAuthorization();
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation();
        }
    }
    
    @IBAction func onGetCenterButtonClick(_ sender: Any) {
        getNearestCenter();
    }
    
    @IBAction func callButtonClick(_ sender: Any) {
        callNumber(phoneNumber: arrayPhoneNumber[index])
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        print("user latitude = \(userLocation.coordinate.latitude)");
        print("user longitude = \(userLocation.coordinate.longitude)");
        currentCoordinate = CLLocation(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude);
    }
    
    private func getNearestCenter() {
        var count = 0;
        var finaleDistance = currentCoordinate.distance(from: arrayLocation[count]);
        for _ in arrayLocation {
            let newDistance = currentCoordinate.distance(from: arrayLocation[count]);
            if newDistance < finaleDistance {
                finaleDistance = newDistance;
                index = count;
            }
            count += 1;
        }
        let userDistance = Double(round(finaleDistance));
        adressLabel.text = arrayAdress[index];
        adressLabel.isHidden = false;
        distanceLabel.text = "\(userDistance/1000) Kilomètres";
        adressButton.isHidden = true;
        emailButton.isHidden = false;
        callButton.isHidden = false;
    }
    
    private func callNumber(phoneNumber:String) {
        if let phoneCallURL:NSURL = NSURL(string:"tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL as URL)) {
                application.openURL(phoneCallURL as URL);
            }
        }
    }
    
}

