//
//  FetchNewsService.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation

struct FetchNewsService: NetworkService {
    
    func fetchData<T>() async throws -> [T] where T : Decodable {
        guard let fetchNewsURL = URL(string: SystemConstants.NetworkConstants.fetchNewsEndpoint) else {
            throw NetworkError.invalidURL
        }
        
        let urlRequest = URLRequest(url: fetchNewsURL)
        let session = URLSession(configuration: .default)
        
        guard let (data, response) = try? await session.data(for: urlRequest) else {
            // Would need to handle no internet error as well
            throw
        }
    }
}
