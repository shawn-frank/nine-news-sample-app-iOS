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
        let newsImages = [NewsImageModel(id: 1, url: "1000x200.jpg", width: 1000, height: 200),
                          NewsImageModel(id: 2, url: "300x200.jpg", width: 300, height: 200),
                          NewsImageModel(id: 3, url: "900x600.jpg", width: 900, height: 600),
                          NewsImageModel(id: 4, url: "150x200.jpg", width: 150, height: 200)]
        
        let newsAsset = NewsAssetModel(id: 1, headline: "", abstract: "", author: "",
                                       url: "", images: newsImages, timeStamp: 0)
        
        let newsImages2 = [NewsImageModel(id: 1, url: "1001x200.jpg", width: 1000, height: 200),
                          NewsImageModel(id: 2, url: "1000x200.jpg", width: 300, height: 200)]
        
        let newsAsset2 = NewsAssetModel(id: 1, headline: "", abstract: "", author: "",
                                       url: "", images: newsImages2, timeStamp: 0)
        
        let newsManager = NewsAssetManager()
        
        XCTAssertEqual("150x200.jpg", newsManager.getThumbnailURL(for: newsAsset),
                       "Smallest image not returned")
        XCTAssertEqual("1000x200.jpg", newsManager.getThumbnailURL(for: newsAsset2),
                       "Smallest image not returned")
    }

}
