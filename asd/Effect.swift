//
//  Effect.swift
//  ASD-iOS-App
//
//  Created by Johnathan Orsolini on 28/04/18.
//  Copyright © 2018 Liblum. All rights reserved.
//

import Foundation
import UIKit

class Effect {
    
}

extension UIButton {
    func roundedButton(corner: UIRectCorner, corner2: UIRectCorner? = nil){
        let maskPath: UIBezierPath
        if corner2 != nil {
            maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners:[corner, corner2!], cornerRadii: CGSize(width: 200, height: 150))
        } else {
            maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners:[corner], cornerRadii: CGSize(width: 200, height: 150))
        }
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = self.bounds
        maskLayer1.path = maskPath.cgPath
        self.layer.mask = maskLayer1
    }
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.1
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.2
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
}

extension UIView {
    func fadeIn(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
}
