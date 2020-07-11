//
//  AddPicture.swift
//  projetAl1Instagram
//
//  Created by Developer on 11/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct AddPicture: View {
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    @State var username: String = ""
    @State var link: String = ""
    @State var location: String = ""
    @State var description: String = ""
    @State var postService = PostAPIService()
    @Environment(\.presentationMode) private var presentationMode
    @State private var postRows:PostRows? = nil
    
    init(postRows: PostRows){
        self.postRows = postRows
    }

    var body: some View {

        VStack () {
            TextField("Username", text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            TextField("Location", text: $location)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            TextField("Link", text: $link)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            TextField("description", text: $description)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            Button(action: {
                self.postService.addPost(username: self.username, location: self.location, imagePath: self.link, description: self.description)
                self.postRows?.getPosts()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Ajouter")
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.green)
                    .cornerRadius(15.0)
            }
            Spacer()
            }.padding()
    }
}
