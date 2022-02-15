//
//  ContentView.swift
//  myAP
//
//  Created by ak77m on 02.02.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var result = RequestManager()
    
    var body: some View {
        
        NavigationView{
                List(result.myData, id: \.id){ item in
                    NavigationLink (
                        destination: PictureView(fullSizeImageUrl: item.url),
                        label: {
                            CellView(imageLoader: ImageManager(url: item.thumbnailUrl) , postId: item.id, postTitle: item.title)
                        })
                        .navigationTitle("List")
                }
            
        }
        .onAppear{
            // old style request
            //posts.standartRequest()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
