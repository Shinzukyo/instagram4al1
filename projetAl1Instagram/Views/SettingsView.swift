//
//  Settings.swift
//  projetAl1Instagram
//
//  Created by Developer on 11/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI


struct SettingsView: View {
    
    var body: some View {
        List{
            NavigationLink(destination: AccountView()){
                Text("Account")
            }
            NavigationLink(destination: PrivacyView()){
                Text("Privacy")
            }
        }.onAppear {
           UITableView.appearance().separatorStyle = .none
           // can update any other property like tableFooterView etc
        }.onDisappear {
           //revert appearance so that it does not break other UI
           UITableView.appearance().separatorStyle = .singleLine
        }.navigationBarTitle("Settings")
        
    }
}
