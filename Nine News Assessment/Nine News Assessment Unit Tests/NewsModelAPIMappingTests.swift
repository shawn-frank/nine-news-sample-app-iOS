//
//  NewsModelAPIMappingTests.swift
//  Nine News Assessment Unit Tests
//
//  Created by Shawn Frank on 16/3/2023.
//

import XCTest
@testable import Nine_News_Assessment

class NewsModelAPIMappingTests: XCTestCase {
    func test_valid_json_successful_decode() {
        let testBundle = Bundle(for: type(of: self))
        
        guard let path = testBundle.path(forResource: "NewsAssets", ofType: "json"),
              let jsonData = try? String(contentsOfFile: path).data(using: .utf8) else {
            return
        }
        
        let result = try? JSONDecoder().decode(NewsResponseModel.self, from: jsonData)
                
        XCTAssertNotNil(result, "Decoding NewsAssets.json should not be nil")
        XCTAssertEqual(result?.assets.count, 18, "There should be 18 news items loaded from NewsAssets.json")
        // check the values and properties
    }
}

