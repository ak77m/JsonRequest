//
//  Date+Ext.swift
//  myAP
//
//  Created by ak77m on 19.02.2022.
//

import Foundation

extension Date {

    func formattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat =  "MM/dd/yyyy hh:mm:ss"
        return formatter.string(from: self)
    }
    
}
