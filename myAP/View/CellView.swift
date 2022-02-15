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
    
    var body: some View {
        ZStack {
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
                
                Spacer()
                
            }.padding([.top, .leading, .bottom])
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), Color.init(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading))
        .cornerRadius(15.0)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(imageLoader: ImageManager(url:  "default image"), postId: 1, postTitle: "Some text")
            .preferredColorScheme(.dark)
    }
}
