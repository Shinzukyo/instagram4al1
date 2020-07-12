//
//  PostRows.swift
//  projetAl1Instagram
//
//  Created by Developer on 17/06/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation
import SwiftUI

class PostRows : ObservableObject {
    @Published var posts : [Post] = []
    
    
    init() {
        getPosts()
    }
    
    func getPosts(){
        let postApiService : PostAPIService = PostAPIService()
        postApiService.getAll { (postArray) in
            self.posts = postArray
        }
    }

}
