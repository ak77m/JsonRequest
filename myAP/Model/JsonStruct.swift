//
//  JsonStruct.swift
//  myAP
//
//  Created by ak77m on 03.02.2022.
//

import Foundation

struct JsonStruct : Codable, Hashable {
    let albumId : Int
    let id : Int
    let title : String
    let url : String
    let thumbnailUrl : String
}

