//
//  MainCoordinator.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController = UINavigationController()
    
    func start() {
        let initialViewController = SplashViewController()
        navigationController.pushViewController(initialViewController, animated: false)
        customizeNavigationController()
    }
    
    func customizeNavigationController() {
        navigationController.navigationBar.prefersLargeTitles = true
    }
}
