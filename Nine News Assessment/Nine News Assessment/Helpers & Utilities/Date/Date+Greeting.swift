//
//  Date+Greeting.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation

extension Date {
    func getGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: self)
        
        switch hour {
        case 6..<12 : return "Good morning"
        case 12..<17 : return "Good afternoon"
        default: return "Good evening"
        }
    }
}
