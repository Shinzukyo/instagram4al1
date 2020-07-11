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


    
    var body: some View {
        VStack{
            Text("Account")
            List{
                HStack{
                    Text("Name")
                    TextField("Name",text:$name)
                }
                HStack{
                    Text("Email")
                    TextField("Email", text:$email)
                }
                Toggle(isOn: $isOnline){
                    Text("Appear online")
                }.padding()
                Toggle(isOn: $wantEmail){
                    Text("Receive email")
                }.padding()
            }
        }
    }
}
