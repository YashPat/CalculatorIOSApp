//
//  buttonFormat.swift
//  Calculator
//
//  Created by Patil, Yash M on 10/22/18.
//  Copyright © 2018 Patil, Yash M. All rights reserved.
//

import Foundation
import UIKit

extension UIButton
{
    func design()
    {
        self.layer.cornerRadius = 3
        self.backgroundColor = UIColor.white
        self.layer.borderWidth = 0
        //self.layer.borderColor = UIColor(red: 197/255, green: 239/255, blue: 247/255, alpha: 1).cgColor
        self.layer.shadowColor = UIColor(red: 197/255, green: 239/255, blue: 247/255, alpha: 1).cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.titleLabel?.font = UIFont(name: "Futura-Medium", size: 40)
        self.setTitleColor(.black, for: .normal)
        
    }
}

