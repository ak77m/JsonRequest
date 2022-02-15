//
//  PictureRequest.swift
//  myAP
//
//  Created by ak77m on 13.02.2022.
//

import Combine
import UIKit

final class PictureRequest  {
    public static let shared = PictureRequest()
    
    /// New style request using Combine
    func fetchPicture(for url: String?) -> AnyPublisher< UIImage?, Never> {
       // URL(string: url) doesn't work with Optional We have to unwrap url before
        guard let url = url, let url = URL(string: url) else { return Just(nil).eraseToAnyPublisher() }
        
            return URLSession.shared.dataTaskPublisher(for: url)
                .map { UIImage(data:$0.data) }
                .replaceError(with: nil)
                .receive(on: RunLoop.main)
                .eraseToAnyPublisher()
        }
}
