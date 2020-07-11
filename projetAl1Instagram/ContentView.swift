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
    @State var openCreateForm = false
    
    var body: some View {
        UINavigationBar.appearance().backgroundColor = .white;
        return TabView {
            NavigationView{
                List(postRows.posts) { post in
                    PostRow(post : post)
                        .onAppear {
                            if post.id == self.postRows.posts.first?.id {
                                self.postRows.getPosts()
                            }	
                    }
                }
                .navigationBarTitle("")
                .navigationBarItems(
                    leading: Text("Selfish").font(.largeTitle).bold(),
                    trailing: Button(action: {
                        self.openCreateForm.toggle()
                    }) {
                        Image(systemName: "plus.circle")
                    }.sheet(isPresented: $openCreateForm) {
                        AddPicture(postRows: self.postRows)
                    }
                )
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
