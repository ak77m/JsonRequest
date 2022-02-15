//
//  PictuteView.swift
//  myAP
//
//  Created by ak77m on 13.02.2022.
//

import SwiftUI

struct PictureView: View {
    @State var fullSizeImageUrl : String
    
    var body: some View {
        ZStack{
            // I use force unwrap because AsyncImage can return nil in result. It's not a mistake I think
            AsyncImage(url: URL(string: fullSizeImageUrl)!) { stage in
                if let image = stage.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    Image("loading")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            VStack{
                Spacer()
                Text(fullSizeImageUrl)
            }
        }
        
    }
}

struct PictureView_Previews: PreviewProvider {
    static var previews: some View {
        PictureView(fullSizeImageUrl: "wrong url")
    }
}
