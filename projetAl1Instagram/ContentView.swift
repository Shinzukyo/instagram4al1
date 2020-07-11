//
//  ContentView.swift
//  projetAl1Instagram
//
//  Created by Developer on 17/06/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var postRows : PostRows = PostRows()
    
    var body: some View {
                
        TabView {
            NavigationView{
                List(postRows.posts) { post in
                    PostRow(post : post)
                }
                .navigationBarTitle("Instagrammation")
            }.tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
