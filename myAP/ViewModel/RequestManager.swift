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
    
    private let defaultValue = UserDefaults.standard.getArrayData(JsonStruct.self, forKey: "cache")    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        // subscriber
        $url
            .flatMap { (url) -> AnyPublisher<[JsonStruct], Never> in
                JsonRequest.shared.fetchData(for: url)
            }
            .receive(on: RunLoop.main)
            .sink{
                if $0.isEmpty {
                    self.myData = self.defaultValue}
                else {
                    self.myData = $0
                    self.myData.indices.forEach { self.myData[$0].date = Date() }
                    UserDefaults.standard.setStructArray(self.myData, forKey: "cache")
                }
                
            }
            .store(in: &self.cancellableSet)
    }

    
    /// old style request with completion: @escaping ([JsonStruct]) -> ()
    /// necessary to disable init()
    func standartRequest ()  {
        JsonRequest.shared.standartRequest(url) { array in
            self.myData = array
        }
    }
}



