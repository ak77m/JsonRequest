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
            .cornerRadius(15)
            .shadow(color: Color(uiColor: UIColor(named: "ShadowColor") ?? .black), radius: 2, x: 3, y: 3)
    }
}


// MARK: - Custom Color (for future)
extension Color {
    static let lightBackgroundColor = Color.init(#colorLiteral(red: 0.968627451, green: 0.9843137255, blue: 0.9882352941, alpha: 1))
    static let lightTextColor = Color.init(#colorLiteral(red: 0.968627451, green: 0.9843137255, blue: 0.9882352941, alpha: 1))
    static let darkBackgroundColor = Color.init(#colorLiteral(red: 0.8392156863, green: 0.9019607843, blue: 0.9490196078, alpha: 1))
    static let darkTextColor = Color.init(#colorLiteral(red: 0.7254901961, green: 0.8431372549, blue: 0.9176470588, alpha: 1))
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



