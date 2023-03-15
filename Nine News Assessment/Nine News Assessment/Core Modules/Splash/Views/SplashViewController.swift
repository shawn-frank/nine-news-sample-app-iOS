//
//  SplashViewController.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation
import UIKit
import Combine

final class SplashViewController: UIViewController {
    
    weak var mainCoordinator: MainCoordinator?
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchNewsAssets()
    }
    
    // MARK: INTENTS
    private func fetchNewsAssets() {
        let newsAssetManager = NewsAssetManager()
        
        newsAssetManager.updateUI = { [weak self] in
            if let strongSelf = self {
                strongSelf.mainCoordinator?.displayNewsAssets(from: newsAssetManager)
            }
        }
        
        Task {
            do {
                try await newsAssetManager.fetchNewsAssets()
            }
            catch {
                if let error = error as? NetworkError {
                    mainCoordinator?.presentErrorAlert(withMessage: error.localizedDescription)
                }
                else {
                    mainCoordinator?.presentErrorAlert(withMessage: "An Unknown Error occured. Please try again later.")
                }
            }
        }
    }
}

// MARK: CONFIGURE LAYOUT
extension SplashViewController {
    
    private func configureInterface() {
        view.backgroundColor = .white
        configureSplashImage()
        configureActivityIndicator()
    }
    
    private func configureSplashImage() {
        let splashImage = UIImage(named: SystemConstants.SplashScreen.splashScreenImageName)
        let splashImageView = UIImageView(image: splashImage)
        splashImageView.translatesAutoresizingMaskIntoConstraints = false
        splashImageView.contentMode = .scaleAspectFit
        view.addSubview(splashImageView)
        splashImageView.pin(to: view)
    }
    
    private func configureActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        configureActivityIndicatorLayoutConstraints(activityIndicator)
    }
    
    private func configureActivityIndicatorLayoutConstraints(_ activityIndicator: UIActivityIndicatorView) {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                      constant: CGFloat(-SystemConstants.SplashScreen.progressViewBottomPadding)),
            activityIndicator.widthAnchor.constraint(equalToConstant: CGFloat(SystemConstants.SplashScreen.progressViewWidth)),
            activityIndicator.heightAnchor.constraint(equalToConstant: CGFloat(SystemConstants.SplashScreen.progressViewHeight))
        ])
    }
}

