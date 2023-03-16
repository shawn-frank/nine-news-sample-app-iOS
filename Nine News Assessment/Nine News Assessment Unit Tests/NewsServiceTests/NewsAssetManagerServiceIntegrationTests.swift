//
//  NewsAssetManagerServiceIntegrationTests.swift
//  Nine News Assessment Unit Tests
//
//  Created by Shawn Frank on 16/3/2023.
//

import XCTest
@testable import Nine_News_Assessment

class NewsAssetManagerServiceTests: XCTestCase {

    func test_success_news_asset_fetch_request() async {
        let service = SuccessNewsFeedService()
        let sut = NewsAssetManager(newsService: service)
        
        sut.updateUI = {
            XCTAssertEqual(sut.newsAssets.count, 4, "There should be 4 news assets")
        }
        
        try? await sut.fetchNewsAssets()
    }

    func test_failure_server_error_news_asset_fetch_request() async {
        let service = ServerErrorNewsFeedService()
        let sut = NewsAssetManager(newsService: service)
        
        do {
            try await sut.fetchNewsAssets()
        }
        catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.server)
        }
    }

    func test_sorting_descending_order_news_assets() async {
        let service = SuccessNewsFeedService()
        let sut = NewsAssetManager(newsService: service)
        
        sut.updateUI = {
            var previousNewsAsset: NewsAssetModel?
            
            for asset in sut.newsAssets {
                if previousNewsAsset == nil {
                    previousNewsAsset = asset
                    continue
                }
                
                if let previousTimestamp = previousNewsAsset?.timeStamp {
                    XCTAssertGreaterThan(previousTimestamp, asset.timeStamp, "News assets are not sorted")
                }
            }
        }
        
        try? await sut.fetchNewsAssets()
    }
}
