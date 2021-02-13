//
//  StoryBoard.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation
import UIKit

enum StoryBoard: String{
    case main = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func instantiateVC<T: UIViewController>(_ objectClass: T.Type) -> T {
        let identifier =  String.getStringOfClass(objectClass: objectClass)
        return instance.instantiateViewController(withIdentifier: identifier) as! T
    }
}
