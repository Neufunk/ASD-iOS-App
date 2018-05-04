//
//  SecondViewController.swift
//  ASD-iOS-App
//
//  Created by Johnathan Orsolini on 28/04/18.
//  Copyright © 2018 Liblum. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class SecondViewController: UIViewController {
    
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var infoView: UIView!
    
    let data = Data()
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
    
    @IBAction func onMailButtonClick(_ sender: Any) {
        sendEmail()
    }
    
    private func callNumber(phoneNumber:String) {
        if let phoneCallURL:NSURL = NSURL(string:"tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL as URL)) {
                application.open(phoneCallURL as URL)
            }
        }
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = (self as! MFMailComposeViewControllerDelegate)
            mail.setToRecipients(["informatique@asd-namur.be"])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
