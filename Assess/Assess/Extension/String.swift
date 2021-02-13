//
//  String.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation
import UIKit

extension String {
    static func getStringOfClass(objectClass: AnyClass) -> String {
        let className = String(describing: objectClass.self)
        return className
    }
    
    func sizeOfStringWithFont(_ font: UIFont, boundedToSize: CGSize, lineBreakMode: NSLineBreakMode) -> CGSize {
        let stringSize = self.boundingRect(with: boundedToSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return CGSize(width: ceil(stringSize.width), height: ceil(stringSize.height));
    }
    
    
    
    static func random(length: Int = 20) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
    
}
