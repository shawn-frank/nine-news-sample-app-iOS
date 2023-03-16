//
//  Int64+Timestamp.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 16/3/2023.
//

import Foundation

extension Int64 {
    var dateFromTimeStamp: String {
        let date = NSDate(timeIntervalSince1970: Double(self) / 1000)
        
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd MM YYYY, hh:mm"
        
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
}
