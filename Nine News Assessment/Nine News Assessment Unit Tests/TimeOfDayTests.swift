//
//  TimeOfDayTests.swift
//  Nine News Assessment Unit Tests
//
//  Created by Shawn Frank on 16/3/2023.
//

import XCTest
@testable import Nine_News_Assessment

class TimeOfDayTests: XCTestCase {
    
    func test_morning_greetings() {
        let morningStart = 0
        let morningEnd = 11
        let minutes = [15, 20, 30, 45, 50]
        let seconds = [10, 25, 35, 47, 58]
        
        for hour in morningStart ... morningEnd {
            guard let minute = minutes.shuffled().first,
                  let second = seconds.shuffled().first,
                  let date = Calendar.current.date(bySettingHour: hour, minute: minute, second: second, of: Date())
            else {
                continue
            }
            
            let greeting = date.getGreeting()
            XCTAssertEqual("Good morning", greeting, "\(hour) should be morning")
        }
    }
    
    func test_afternoon_greetings() {
        let afternoonStart = 12
        let afternoonEnd = 16
        let minutes = [15, 20, 30, 45, 50]
        let seconds = [10, 25, 35, 47, 58]
        
        for hour in afternoonStart ... afternoonEnd {
            guard let minute = minutes.shuffled().first,
                  let second = seconds.shuffled().first,
                  let date = Calendar.current.date(bySettingHour: hour, minute: minute, second: second, of: Date())
            else {
                continue
            }
            
            let greeting = date.getGreeting()
            XCTAssertEqual("Good afternoon", greeting, "\(hour) should be afternoon")
        }
    }
    
    func test_evening_greetings() {
        let eveningStart = 17
        let eveningEnd = 23
        let minutes = [15, 20, 30, 45, 50]
        let seconds = [10, 25, 35, 47, 58]
        
        for hour in eveningStart ... eveningEnd {
            guard let minute = minutes.shuffled().first,
                  let second = seconds.shuffled().first,
                  let date = Calendar.current.date(bySettingHour: hour, minute: minute, second: second, of: Date())
            else {
                continue
            }
            
            let greeting = date.getGreeting()
            XCTAssertEqual("Good evening", greeting, "\(hour) should be evening")
        }
    }
}
