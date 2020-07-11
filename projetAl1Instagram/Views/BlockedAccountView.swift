//
//  BlockedAccountView.swift
//  projetAl1Instagram
//
//  Created by Developer on 11/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct Account : Identifiable{
    let id: Int
    let name: String
    let email: String
}


struct BlockedAccountView: View {
    @State private var blockedAccountList:[Account] = [
        Account(id: 0,name:"Thom Soyer", email: "thom@soyer.com"),
        Account(id: 1,name:"Caroline Thygesen", email: "carolinemthygesen@armyspy.com"),
        Account(id: 2,name:"Piegon Ruuge", email: "pieg@ruuge.com"),
        Account(id: 3,name:"Tibo InFrom", email: "tib@from.com"),
        Account(id: 4,name:"Leo Pold", email: "leo@pold.com"),
        Account(id: 5,name:"Pote Heure", email: "pote@heure.com"),
        Account(id: 6,name:"Ric Olat", email: "ric@olat.com"),
        Account(id: 7,name:"Kevin Pompotte", email: "quiche@tomate.com"),
        Account(id: 8,name:"Cuisse Tot", email: "cuistot@gmail.com")
    ]
    
    var body: some View {
        VStack{
            List(blockedAccountList, id: \.name){ blockedAccount in
                HStack{
                    VStack(alignment: .leading){
                        Text(blockedAccount.name)
                        Text(blockedAccount.email)
                            .font(.system(size: 10))
                            .italic()
                    }
                    Spacer()
                    Image(systemName: "trash.fill")
                        .foregroundColor(.red)
                        .onTapGesture {
                            self.remove(id: blockedAccount.id)
                        }
                }
            }.onAppear {
               UITableView.appearance().separatorStyle = .none
               // can update any other property like tableFooterView etc
            }.onDisappear {
               //revert appearance so that it does not break other UI
               UITableView.appearance().separatorStyle = .singleLine
            }.navigationBarTitle("Blocked Account")
            
        }
        
    }
    
    func remove(id: Int){
        blockedAccountList.remove(at: id)
    }
    
    
}
