//
//  MainCoordinator.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator {
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
    
    /// Displays news assets contained within a NewsAssetManager in a list format
    /// - Parameter newsAssetManager: The configured NewsAssetManager view model object
    func displayNewsAssets(from newsAssetManager: NewsAssetManager) {
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
    
    
    /// Loads a URL in a WKWebView
    /// - Parameter urlString: The url to be loaded
    func loadURL(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            // handle errors
            return
        }
        
        print("Load: \(urlString)")
    }
}
