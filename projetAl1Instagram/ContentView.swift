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
                
        VStack{
            Text("Instagrammation")
            
            List(postRows.posts) { post in
                PostRow(post : post)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
