//
//  NewsAssetManager.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation

class NewsAssetManager {
    private(set) var newsAssets: [NewsAssetModel] = []
    private let newsService: NetworkService!
    
    init(newsService: NetworkService = NewsNetworkService()) {
        self.newsService = newsService
    }
    
    var updateUI: (() -> Void)?
    
    @MainActor
    func fetchNewsAssets() async throws {
        guard let fetchNewsURL = URL(string: SystemConstants.NetworkConstants.fetchNewsEndpoint) else {
            throw NetworkError.invalidURL
        }
        
        let responseModel: NewsResponseModel = try await newsService.fetchData(url: fetchNewsURL)
        newsAssets = responseModel.assets
        
        updateUI?()
    }
}
