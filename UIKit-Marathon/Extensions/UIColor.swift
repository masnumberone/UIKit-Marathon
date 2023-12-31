//
//  UIColor.swift
//  UIKit-Marathon
//
//  Created by work on 13.08.2023.
//

import UIKit

extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static let backgroundFill = UIColor(hex: 0xF4F4F5)
    static let blueDark = UIColor(hex: 0x1C2039)
}
