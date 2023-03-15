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
        initialViewController.mainCoordinator = self
        navigationController.pushViewController(initialViewController, animated: false)
        customizeNavigationController()
    }
    
    func customizeNavigationController() {
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func displayNewsAssets(with newsAssets: [NewsAssetModel]) {
        let newsFeedViewController = NewsFeedViewController()
        newsFeedViewController.mainCoordinator = self
        navigationController.pushViewController(newsFeedViewController, animated: true)
    }
}
