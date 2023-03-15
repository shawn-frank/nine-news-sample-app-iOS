//
//  FetchNewsService.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation
import Network

struct FetchNewsService: NewsFeedNetworkService {
    func fetchData() async throws -> [NewsAssetModel] {
        guard let fetchNewsURL = URL(string: SystemConstants.NetworkConstants.fetchNewsEndpoint) else {
            throw NetworkError.invalidURL
        }
        
        let urlRequest = URLRequest(url: fetchNewsURL)
        let session = URLSession(configuration: .default)
        
        guard let (data, response) = try? await session.data(for: urlRequest) else {
            // Would need to handle no internet error as well
            throw NetworkError.server
        }
        
        if let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode > 400 {
            throw NetworkError.server
        }
        
        guard let newsResponse = try? JSONDecoder().decode(NewsResponseModel.self,
                                                           from: data) else {
            throw NetworkError.decode
        }
        
        return newsResponse.assets
    }
}
