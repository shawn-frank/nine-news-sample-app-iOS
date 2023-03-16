//
//  AsyncImageService.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 16/3/2023.
//

import Combine
import UIKit

class AsyncImageService {
    private let cache = NSCache<NSString, UIImage>()
    static let shared = AsyncImageService()
    
    func loadImage(_ url: URL) -> AnyPublisher <UIImage?, Never> {
        if let image = cache.object(forKey: url.absoluteString as NSString) {
            let publisher: AnyPublisher <UIImage?, Never> = Just(image).eraseToAnyPublisher()
            return publisher
        }
        
        let session = URLSession(configuration: .default)
        
        let publisher: AnyPublisher <UIImage?, Never> = session.dataTaskPublisher(for: url).map
        { [weak self] data, response in
            guard let image = UIImage(data: data) else { return nil }
            self?.cache.setObject(image, forKey: url.absoluteString as NSString)
            return image
        }
        .catch { err in
            Just(nil)
        }
        .eraseToAnyPublisher()
        
        return publisher
    }
}
