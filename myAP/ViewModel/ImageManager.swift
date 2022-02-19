//
//  ImageManager.swift
//  myAP
//
//  Created by ak77m on 13.02.2022.
//

import SwiftUI
import Combine

final class CacheImageManager {
    
    static let shared = CacheImageManager()
    
    var imageCache = NSCache<NSString, ImageManager>()

    func loadFrom(url: String) -> ImageManager {

        if let loader = imageCache.object(forKey: url as NSString) {
            return loader
       
        } else {
            let loader = ImageManager(url: url)
            imageCache.setObject(loader, forKey: url as NSString)
            return loader
        }
    }
}

final class ImageManager: ObservableObject {
    
    @Published var url: String?
    @Published var image: UIImage?
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(url: String) {
        self.url = url
            $url
                .flatMap { (path) -> AnyPublisher<UIImage?, Never> in
                    PictureRequest.shared.fetchPicture(for: url)
                }
                .receive(on: RunLoop.main)
                .assign(to: \.image, on: self)
                .store(in: &self.cancellableSet)
        }
            
        

}
