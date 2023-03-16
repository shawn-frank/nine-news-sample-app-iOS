//
//  NewsAssetManager.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation
import UIKit

final class NewsAssetManager {
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
    
    
    /// Returns the smallest image of a news asset by area
    /// - Parameter newsAsset: The news asset object
    /// - Returns: A URL string of the smallest image or nil if the news asset has no images
    func getThumbnailURL(for newsAsset: NewsAssetModel) -> String? {
        let sortedAssetImages = newsAsset.images.sorted {
            ($0.width * $0.height) < ($1.width * $1.height)
        }.map { $0.url }
        
        return sortedAssetImages.first
    }
}
