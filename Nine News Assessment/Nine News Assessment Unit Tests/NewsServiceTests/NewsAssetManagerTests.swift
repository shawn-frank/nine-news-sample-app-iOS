//
//  NewsAssetManagerTests.swift
//  Nine News Assessment Unit Tests
//
//  Created by Shawn Frank on 16/3/2023.
//

import XCTest
@testable import Nine_News_Assessment

class NewsAssetManagerUnitTests: XCTestCase {

    func test_smallest_thumbnail_size() {
        let newsImages = [NewsImageModel(id: 1, url: "large", width: 1000, height: 200),
                          NewsImageModel(id: 2, url: "large", width: 300, height: 200),
                          NewsImageModel(id: 3, url: "large", width: 900, height: 600),
                          NewsImageModel(id: 4, url: "smallest", width: 150, height: 200)]
        
        let newsAsset = NewsAssetModel(id: 1, headline: "", abstract: "", author: "",
                                       url: "", images: newsImages, timeStamp: 0)
        
        let newsImages2 = [NewsImageModel(id: 1, url: "large", width: 1001, height: 200),
                          NewsImageModel(id: 2, url: "smallest", width: 1000, height: 200)]
        
        let newsAsset2 = NewsAssetModel(id: 1, headline: "", abstract: "", author: "",
                                       url: "", images: newsImages2, timeStamp: 0)
        
        let newsManager = NewsAssetManager()
        
        XCTAssertEqual("smallest", newsManager.getThumbnailURL(for: newsAsset),
                       "Smallest image not returned")
        XCTAssertEqual("smallest", newsManager.getThumbnailURL(for: newsAsset2),
                       "Smallest image not returned")
    }

}
