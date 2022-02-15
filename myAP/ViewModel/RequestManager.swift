//
//  RequestManager.swift
//  myAP
//
//  Created by ak77m on 03.02.2022.
//

import Combine
import SwiftUI


final class RequestManager: ObservableObject {

    @Published var url = "https://jsonplaceholder.typicode.com/photos"
    @Published var myData = [JsonStruct]()
   
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        // subscriber
        $url
            .flatMap { (url) -> AnyPublisher<[JsonStruct], Never> in
                JsonRequest.shared.fetchData(for: url)
            }
            .assign(to: \.myData, on: self)
            .store(in: &self.cancellableSet)
    }

    
    /// old style request with completion: @escaping ([JsonStruct]) -> ()
    /// necessary to disable init()
    func standartRequest ()  {
        JsonRequest.shared.standartRequest(url) { array in
            self.myData = array
            print("it's Works")
        }
    }
    
}



