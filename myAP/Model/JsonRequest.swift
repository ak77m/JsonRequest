//
//  JsonRequest.swift
//  myAP
//
//  Created by ak77m on 03.02.2022.
//

import Foundation
import Combine

final class JsonRequest {
    public static let shared = JsonRequest()
    
    /// New style request using Combine
    func fetchData(for url: String) -> AnyPublisher< [JsonStruct], Never> {
        guard let url = URL(string: url) else {
            return Just([JsonStruct]()).eraseToAnyPublisher()
        }
            return URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: [JsonStruct].self, decoder: JSONDecoder())
                .replaceError(with: [])
               
                .eraseToAnyPublisher()
        }
    
    /// Old style request
    func standartRequest (_ url: String, _ completion: @escaping ([JsonStruct]) -> () )  {
        guard let url = URL(string: url) else {
            return
        }
            URLSession.shared.dataTask(with: url) {(data, response, error) in
                do {
                    if let newData = data {
                        let decodedData = try JSONDecoder().decode([JsonStruct].self, from: newData)
                        DispatchQueue.main.async {
                            completion(decodedData)
                        }
                    } else {
                        print("No data")
                    }
                } catch {
                    print("Error \(error)")
                }
            }.resume()
        }
}
