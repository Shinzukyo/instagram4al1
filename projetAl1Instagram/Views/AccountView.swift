//
//  AccountView.swift
//  projetAl1Instagram
//
//  Created by Developer on 11/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI


struct AccountView: View {
    @State private var isOnline = true
    @State private var wantEmail = true
    @State private var name: String = "Jean Bon"
    @State private var email: String = "jenbon@jemail.com"
    @State private var password: String = "LaTKnO43V3R"

    
    var body: some View {
        VStack{
            List{
                ProfileImageView(withURL:"https://img.icons8.com/dusk/2x/cat-profile.png")
                
                HStack{
                    Text("Name :")
                    TextField("Name",text:$name)
                }
                HStack{
                    Text("Email :")
                    TextField("Email", text:$email)
                }
                HStack{
                    Text("Password :")
                    SecureField("Password", text: $password)
                }
                Toggle(isOn: $isOnline){
                    Text("Appear online")
                }
                Toggle(isOn: $wantEmail){
                    Text("Receive email")
                }
            }.listStyle(PlainListStyle())
            .onAppear {
               UITableView.appearance().separatorStyle = .none
               // can update any other property like tableFooterView etc
            }.onDisappear {
               //revert appearance so that it does not break other UI
               UITableView.appearance().separatorStyle = .singleLine
            }.navigationBarTitle("Account")
        }
    }
}


struct ProfileImageView: View{
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }
    
    var body: some View {
        HStack{
            Spacer()
            Image(uiImage: imageLoader.data != nil ? UIImage(data:imageLoader.data!)! : UIImage())
                .resizable()
                .frame(width:200.0, height:200.0)
            Spacer()
        }
    }
}
