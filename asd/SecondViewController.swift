//
//  SecondViewController.swift
//  ASD-iOS-App
//
//  Created by Johnathan Orsolini on 28/04/18.
//  Copyright © 2018 Liblum. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    
    let data = Data()
    let viewController = ViewController()
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)
    
    override func viewDidLoad() {
        adressLabel.text = data.arrayAdress[Data.centre]
        distanceLabel.text = "\(Data.distance/1000) Kilomètres"
    }
    
    @IBAction func onCallButtonClick(_ sender: Any) {
        callNumber(phoneNumber: data.arrayPhoneNumber[Data.centre]!)
    }
    
    @IBAction func onWebsiteButtonClick(_ sender: Any) {
        if let url = URL(string: data.arrayWebsite[Data.centre]!) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    private func callNumber(phoneNumber:String) {
        if let phoneCallURL:NSURL = NSURL(string:"tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL as URL)) {
                application.open(phoneCallURL as URL)
            }
        }
    }
    
    @IBAction func onSwipeDown(_ sender: UIPanGestureRecognizer) {
        let touchPoint = sender.location(in: self.view?.window)
        if sender.state == UIGestureRecognizerState.began {
            initialTouchPoint = touchPoint
        } else if sender.state == UIGestureRecognizerState.changed {
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        } else if sender.state == UIGestureRecognizerState.ended || sender.state == UIGestureRecognizerState.cancelled {
            if touchPoint.y - initialTouchPoint.y > 100 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                })
            }
        }
    }
    
    
    
    
}
