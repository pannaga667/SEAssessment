//
//  AppHomeCoordinator.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation
import UIKit

class AppHomeCoordinator: Coordinator{
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
   
    func start() {
        let vc = AppHomeViewController.instance
        vc.modalPresentationStyle = .overFullScreen
      navigationController.pushViewController(vc, animated: false)
    }
    init(navigationController: UINavigationController) {
       
        self.navigationController = navigationController
        
    }
}
