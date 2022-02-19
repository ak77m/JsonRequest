//
//  ContentView.swift
//  myAP
//
//  Created by ak77m on 02.02.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var result = RequestManager()
    let myColor = UIColor(named: "BackgroundColor") ?? .black
    init(){
        UITableView.appearance().backgroundColor = myColor
    }
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(result.myData, id: \.id){ item in
                    NavigationLink {
                        PictureView(pictureUrl: item.url, downloadDate: item.date?.formattedString() ?? Date().formattedString())
                    } label: {
                        CellView(imageLoader: CacheImageManager.shared.loadFrom(url: item.url), postId: item.id, postTitle: item.title)
                    }
                    
                }
                .listRowSeparator(.hidden)
                .padding(.bottom, 8.0)
                .listRowBackground(Color(myColor))
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("List")
            }
            .navigationBarItems(
                leading:
                    Button(action: {
                    UserDefaults.standard.removeObject(forKey: "cache")
                    
                }) {
                    Image(systemName: "clear")
                },
                trailing: Button(action: {result.url = result.url }) {
                    Image(systemName: "arrow.clockwise.icloud")
                })
                
                
            
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
