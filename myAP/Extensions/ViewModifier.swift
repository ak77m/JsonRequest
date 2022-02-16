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


// MARK: - Custom Color (for future)
extension Color {
    static let lightBackgroundColor = Color.init(#colorLiteral(red: 0.9385425448, green: 0.9503578544, blue: 0.9501500726, alpha: 1))
    static let lightTextColor = Color.init(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    static let darkBackgroundColor = Color.init(#colorLiteral(red: 0.07909170538, green: 0.07909170538, blue: 0.07909170538, alpha: 1))
    static let darkTextColor = Color.init(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
}


// MARK: -  custom style (for future)
struct myStyle : ViewModifier {
    
    @Environment(\.colorScheme) var colorTheme
    
    func body(content: Content) -> some View {
        content
            .padding(7)
            .foregroundColor(Color.lightTextColor)
            .cornerRadius(7)
            .shadow(color:.black, radius: 5, x: 5, y: 5)
            
    }
}



