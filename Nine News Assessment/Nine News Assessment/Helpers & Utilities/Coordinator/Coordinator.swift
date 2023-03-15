//
//  Coordinator.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get}
    
    func start()
}
