//
//  ButtonFlashExtension.swift
//  Calculator
//
//  Created by Patil, Yash M on 10/21/18.
//  Copyright © 2018 Patil, Yash M. All rights reserved.
//

import Foundation
import UIKit

extension UIButton
{
    func flash()
    {
        let flash = CABasicAnimation(keyPath: "Opacity")
        flash.duration = 5
        flash.fromValue = 0.75
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        
        layer.add(flash, forKey: nil)
    }
}
