//
//  SplashViewController.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    
    weak var mainCoordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchNewsAssets()
    }
    
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
    
    func fetchNewsAssets() {
        let vm = NewsAssetManager()
        
        Task {
            do {
                try await vm.fetchNewsAssets()
                mainCoordinator?.displayNewsAssets(with: vm.newsAssets)
            }
            catch {
                
            }
        }
    }
}
