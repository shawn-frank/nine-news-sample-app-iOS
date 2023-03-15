//
//  NewsFeedViewController.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation
import UIKit

class NewsFeedViewController: UIViewController {
    weak var mainCoordinator: MainCoordinator?
    private var newsAssetManager: NewsAssetManager!
    
    init(newsAssetManager: NewsAssetManager) {
        self.newsAssetManager = newsAssetManager
        super.init(nibName: nil, bundle: nil)
    }
    
    // Even though this is considered unsafe, there is no chance of
    // Storyboard instantiation in this projects
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
        
        newsAssetManager.newsAssets.forEach { newsAsset in
            print(newsAsset.author)
        }
    }
    
    private func configureInterface() {
        view.backgroundColor = .white
        navigationItem.setHidesBackButton(true, animated: false)
        title = Date().getGreeting()
    }
}
