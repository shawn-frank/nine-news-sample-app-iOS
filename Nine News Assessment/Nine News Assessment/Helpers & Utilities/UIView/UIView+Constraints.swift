//
//  UIView+Constraints.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import UIKit

extension UIView {
    
    /// Adds multiple AutoLayout constraints to another view
    /// - Parameters:
    ///   - superview: The view to add a constraint to
    ///   - leading: Specify if the leading constraint is required, defaults to true
    ///   - top: Specify if the top constraint is required, defaults to true
    ///   - trailing: Specify if the trailing constraint is required, defaults to true
    ///   - bottom: Specify if the bottom constraint is required, defaults to true
    func pin(to anotherView: UIView,
             leading: Bool = true,
             top: Bool = true,
             trailing: Bool = true,
             bottom: Bool = true) {
        
        if leading {
            leadingAnchor.constraint(equalTo: anotherView.leadingAnchor)
                .isActive = true
        }
        
        if top {
            topAnchor.constraint(equalTo: anotherView.topAnchor)
                .isActive = true
        }
        
        if trailing {
            trailingAnchor.constraint(equalTo: anotherView.trailingAnchor)
                .isActive = true
        }
        
        if bottom {
            bottomAnchor.constraint(equalTo: anotherView.bottomAnchor)
                .isActive = true
        }
    }
}

