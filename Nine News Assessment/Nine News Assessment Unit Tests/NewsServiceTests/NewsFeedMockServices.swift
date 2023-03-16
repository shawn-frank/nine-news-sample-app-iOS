//
//  NewsFeedMockServices.swift.swift
//  Nine News Assessment Unit Tests
//
//  Created by Shawn Frank on 16/3/2023.
//

import XCTest
@testable import Nine_News_Assessment

struct SuccessNewsFeedService: NetworkService {
    func fetchData<Response>(url: URL) async throws -> Response where Response : Decodable {
        
        var newsAssets = [NewsAssetModel]()
        
        for index in 1 ... 4 {
            let newsAsset = NewsAssetModel(id: index,
                                           headline: "Headline \(index)",
                                           abstract: "Abstract \(index)",
                                           author: "",
                                           url: "",
                                           images: [])
            
            newsAssets.append(newsAsset)
        }
        
        let newsResponse = NewsResponseModel(assets: newsAssets)
        return newsResponse as! Response
    }
}

struct ServerErrorNewsFeedService: NetworkService {
    func fetchData<Response>(url: URL) async throws -> Response where Response : Decodable {
        throw NetworkError.server
    }
}
