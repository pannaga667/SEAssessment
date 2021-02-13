//
//  TableView.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation
import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(_ className: T.Type, indexPath: IndexPath) -> T? {
        
        let className = String.getStringOfClass(objectClass: className)
        return self.dequeueReusableCell(withIdentifier: className, for: indexPath) as? T
    }
    
    func registerNib(_ className: AnyClass) {
        let classNameString = String.getStringOfClass(objectClass: className)
        register(UINib.init(nibName: classNameString, bundle: .main), forCellReuseIdentifier: classNameString)
    }
    
//    func registerNib<T: UITableViewCell>(_ cell: T.Type) {
//        register(UINib.init(nibName: cell.name, bundle: nil), forCellReuseIdentifier: cell.name())
//    }
    
    func registerClass(_ className: AnyClass) {
        let classNameString = String.getStringOfClass(objectClass: className)
        register(className, forCellReuseIdentifier: classNameString)
    }
}
