//
//  CellView.swift
//  myAP
//
//  Created by ak77m on 13.02.2022.
//

import SwiftUI

struct CellView: View {
    @StateObject var imageLoader : ImageManager
    @State var postId : Int
    @State var postTitle : String
    
    @Environment(\.colorScheme) var colorTheme
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(
                    Color(UIColor(named: "BackgroundColor") ?? .white))
                .shadow(color:.white
                            .opacity(colorTheme == .dark ? 0.2 : 1.0 )
                        , radius: 3, x: -5, y: -5)
                .shadow(color:.black
                            .opacity(colorTheme == .light ? 0.2 : 1.0 )
                        , radius: 3, x: 5, y: 5)
                
            
            HStack(spacing: 10.0){
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .customStyle()
                } else {
                    Image("loading")
                        .customStyle()
                }
                
                VStack(alignment: .leading) {
                    Text("\(postId)")
                    Text(postTitle)
                        .font(.body)
                }
                .foregroundColor(.gray)
                
                Spacer()
                
            }.padding([.top, .leading, .bottom])
            
          
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(imageLoader: ImageManager(url:  "default image"), postId: 1, postTitle: "Some text")
            .preferredColorScheme(.dark)
    }
}
