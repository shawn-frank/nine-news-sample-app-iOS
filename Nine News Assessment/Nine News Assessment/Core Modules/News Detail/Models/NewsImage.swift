//
//  NewsImage.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation

struct NewsImage: Decodable {
    let id: Int
    let url: String?
    let width: Int
    let height: Int
}
