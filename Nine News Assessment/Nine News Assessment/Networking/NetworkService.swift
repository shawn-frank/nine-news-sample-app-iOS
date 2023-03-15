//
//  NetworkService.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation

protocol NetworkService {
    func fetchData<T>() async throws -> [T] where T : Decodable
}
