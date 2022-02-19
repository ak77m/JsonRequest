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
        guard let url = url, let url = URL(string: url) else { return Just(nil).eraseToAnyPublisher() }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 60)

            return URLSession.shared.dataTaskPublisher(for: request)
                .map { UIImage(data:$0.data) }
                .replaceError(with: nil)
                .eraseToAnyPublisher()
        }
}
