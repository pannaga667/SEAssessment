//
//  ColorConstants.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation

import UIKit

struct ColorStringConstants {
    static let backGroundColor: String = "backGroundColor"
    
}

@available(iOS 11.0, *)
struct ColorConstants {
    static var backGroundColor: UIColor {
        return UIColor(named: ColorStringConstants.backGroundColor) ?? UIColor.white
    }
}
