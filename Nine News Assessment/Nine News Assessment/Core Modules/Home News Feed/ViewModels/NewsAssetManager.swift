//
//  NewsAssetManager.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation

class NewsAssetManager {
    private(set) var newsAssets: [NewsAssetModel] = []
    private let newsService: NewsFeedNetworkService!
    
    init(newsService: NewsFeedNetworkService = FetchNewsService()) {
        self.newsService = newsService
    }
    
    func fetchNewsAssets() async throws {
        
    }
}
