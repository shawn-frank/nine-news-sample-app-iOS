//
//  Asset.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation

struct Asset: Decodable {
    let id: Int
    let headline: String
    let abstract: String
    let author: String
    let images: [NewsImage]
    
    enum CodingKeys: String, CodingKey {
        case headline
        case abstract = "theAbstract"
        case author = "byLine"
        case images = "relatedImages"
    }
}
