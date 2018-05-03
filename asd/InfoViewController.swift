//
//  InfoViewController.swift
//  ASD-iOS-App
//
//  Created by Johnathan Orsolini on 30/04/18.
//  Copyright © 2018 Liblum. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class InfoViewController: UIViewController, UIScrollViewDelegate {
    
    let data = Data()
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)
    let regionRadius: CLLocationDistance = 600
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var horaireLabel: UILabel!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var centreLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var statutLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var accessLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.scrollView.frame = CGRect(x: 0, y: 131, width: self.view.frame.width, height: 400)
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width*3, height: self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.scrollView.isPagingEnabled = true
        self.pageControl.currentPage = 0
        
        centreLabel.text = data.arrayCentre[Data.centre]
        horaireLabel.text = data.arrayHoraire[Data.centre]
        serviceLabel.text = data.arrayService[Data.centre]
        accessLabel.text = data.arrayAccess[Data.centre]
        
        checkTime()
        centerMapOnLocation(location: data.arrayLocation[Data.centre]!)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth: CGFloat = scrollView.frame.width
        let currentPage: CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        self.pageControl.currentPage = Int(currentPage)
    }
    
    private func checkTime(){
        let calendar = Calendar.current
        let now = Date()
        let ouverture = calendar.date(
            bySettingHour: 8,
            minute: 0,
            second: 0,
            of: now)!
        let fermeture = calendar.date(bySettingHour: 17, minute: 0, second: 0, of: now)!
        if now >= ouverture && now <= fermeture {
            statutLabel.text = "Ouvert"
            // RGB base 1 du vert ASD #96bb37
            statutLabel.textColor = UIColor.init(red: 0.58, green: 0.73, blue: 0.21, alpha: 1)
        } else {
            statutLabel.text = "Actuellement fermé"
            statutLabel.textColor = UIColor.red
        }
    }
    
    func centerMapOnLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = data.arrayCentre[Data.centre]
        annotation.subtitle = data.arrayAdress[Data.centre]
        annotation.coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        mapView.addAnnotation(annotation)
    }
    
    @IBAction func onFacebookButtonClick(_ sender: Any) {
        let urlApp = "fb://profile/\(data.arrayFacebook[Data.centre]![1])"
        let urlWeb = "https://facebook.com/\(data.arrayFacebook[Data.centre]![0])"
        let application = UIApplication.shared
        if (application.canOpenURL(NSURL(string: urlApp)! as URL)){
            application.open(URL(string: urlApp)!)
        } else {
            application.open(URL(string: urlWeb)!)
        }
    }
    
    @IBAction func onCrossClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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

