//
//  ImageManager.swift
//  myAP
//
//  Created by ak77m on 13.02.2022.
//

import SwiftUI
import Combine

final class ImageManager: ObservableObject {
    
    @Published var url: String?
    @Published var image: UIImage?
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(url: String) {
        self.url = url
        $url
            .flatMap { (path) -> AnyPublisher<UIImage?, Never> in
                PictureRequest.shared.fetchPicture(for: self.url)
            }
            .assign(to: \.image, on: self)
            .store(in: &self.cancellableSet)
    }

}
