//
//  NewsResponseModel.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation

struct NewsResponseModel: Decodable {
    let assets: [NewsAssetModel]
}
