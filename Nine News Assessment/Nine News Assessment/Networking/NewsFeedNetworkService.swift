//
//  NetworkService.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation

protocol NewsFeedNetworkService {
    func fetchData() async throws -> [NewsAssetModel]
}
