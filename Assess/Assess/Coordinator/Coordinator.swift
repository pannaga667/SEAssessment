//
//  Coordinator.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get set}
//    var navigationController: UINavigationController {get set}
    func start()
}
