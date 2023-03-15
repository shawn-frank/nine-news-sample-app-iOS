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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
    }
    
    private func configureInterface() {
        view.backgroundColor = .white
        navigationItem.setHidesBackButton(true, animated: false)
        title = Date().getGreeting()
    }
}
