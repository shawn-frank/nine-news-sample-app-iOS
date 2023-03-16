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
        let timestamps: [Int64] = [1553046991963, 1678620600000, 1553040533345, 1676939393000, 1678597056854, 1678235950269, 1678235950269]
        
        for index in 1 ... 4 {
            let newsAsset = NewsAssetModel(id: index,
                                           headline: "Headline \(index)",
                                           abstract: "Abstract \(index)",
                                           author: "",
                                           url: "",
                                           images: [],
                                           timeStamp: timestamps.randomElement()!)
            
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
