//
//  NewsAssetModel.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation

struct NewsAssetModel: Decodable, Hashable {
    let id: Int
    let headline: String
    let abstract: String
    let author: String
    let url: String
    let images: [NewsImageModel]
    
    enum CodingKeys: String, CodingKey {
        case id
        case headline
        case abstract = "theAbstract"
        case author = "byLine"
        case url
        case images = "relatedImages"
    }
}
