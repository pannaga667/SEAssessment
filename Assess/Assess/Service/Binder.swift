//
//  Binder.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation
import  UIKit
class Binder<T> {
    typealias  Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener:  Listener?) {
        self.listener = listener
        listener?(value)
    }
}

