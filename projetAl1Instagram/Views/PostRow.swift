//
//  PostRow.swift
//  projetAl1Instagram
//
//  Created by Developer on 17/06/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation
import SwiftUI

struct PostRow: View {
    var post:Post
    
    init(post: Post){
        self.post = post
    }
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Image(systemName:  "person")
                VStack{
                    Text(self.post.username)
                        .font(Font.system(size: 13.5))
                    Text(self.post.localisation)
                        .font(Font.system(size: 11.5))
                }
                Spacer()
                Image(systemName: "ellipsis")
            }.frame(minWidth: 0, maxWidth: .infinity)
            
            // Post
            VStack {
                ImageView(withURL: post.pathImg)
            }.frame(minWidth: 0, maxWidth: .infinity)
            
            // Barre horizontale
            HStack(alignment: .center) {
                
                Image(systemName: "heart")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(5)
                
                Image(systemName: "message")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(5)
                
                Image(systemName: "paperplane")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(5)
                
                Spacer()
                
                Image(systemName: "bookmark")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            }
              
            VStack(alignment: .leading){
                Text("Liked by leeviahq and 123 others")
              .font(Font.system(size: 13.5))
            }
            
            
            // La description
            Text(self.post.description)
                            .lineLimit(4)
                            .font(Font.system(size: 12.5))
                            .foregroundColor(.init(white: 0.2))
        }.frame(minWidth: 0, maxWidth: .infinity)
    }
}
