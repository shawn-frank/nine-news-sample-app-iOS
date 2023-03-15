//
//  NewsAsset.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation

struct NewsAsset: Decodable {
    let id: Int
    let headline: String
    let abstract: String
    let author: String
    let images: [NewsImage]
    
    enum CodingKeys: String, CodingKey {
        case id
        case headline
        case abstract = "theAbstract"
        case author = "byLine"
        case images = "relatedImages"
    }
}
