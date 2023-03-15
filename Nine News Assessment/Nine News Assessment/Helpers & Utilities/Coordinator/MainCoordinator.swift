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
    
    func displayNewsAssets(with newsAssetManager: NewsAssetManager) {
        let newsFeedViewController = NewsFeedViewController(newsAssetManager: newsAssetManager)
        newsFeedViewController.mainCoordinator = self
        navigationController.setViewControllers([newsFeedViewController], animated: true)
    }
    
    func presentErrorAlert(withMessage message: String) {
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            self?.navigationController.dismiss(animated: true)
        }))
        
        navigationController.present(alert, animated: true, completion: nil)
    }
}
