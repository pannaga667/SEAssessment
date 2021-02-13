//
//  MainCoordinator.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation
import UIKit
class MainCoordinator: Coordinator{
    let window: UIWindow
    var childCoordinators = [Coordinator]()
    
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let appHomeCoordinator = AppHomeCoordinator( navigationController: navigationController)
        appHomeCoordinator.start()
    }
}
