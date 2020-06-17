
//
//  Post.swift
//  projetAl1Instagram
//
//  Created by Developer on 17/06/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation


struct Post : Codable, Identifiable{
    var username : String
    var pathImg : String
    var description : String
    var date : String
    var likes : Int
    var localisation : String
    var id : Int
    
    
    init(username :String, pathImg :String, description :String, date :String, likes :Int, localisation :String, id :Int){
        self.username = username
        self.pathImg = pathImg
        self.description = description
        self.date = date
        self.likes = likes
        self.localisation = localisation
        self.id = id
    }
}
