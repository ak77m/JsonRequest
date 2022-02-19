//
//  ViewModifier.swift
//  myAP
//
//  Created by ak77m on 14.02.2022.
//

import SwiftUI

// MARK: -  Main page images modifier with custom shadow
extension Image {
    func customStyle() -> some View {
        self
            .resizable()
            .frame(width: 100, height: 100, alignment: .center)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

// MARK: - Custom Color (for different themes)
extension Color {
    static let lightBackgroundColor = Color.init(#colorLiteral(red: 0.9385425448, green: 0.9503578544, blue: 0.9501500726, alpha: 1))
    static let darkBackgroundColor = Color.init(#colorLiteral(red: 0.07909170538, green: 0.07909170538, blue: 0.07909170538, alpha: 1))
}




