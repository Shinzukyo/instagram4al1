//
//  PostService.swift
//  projetAl1Instagram
//
//  Created by Developer on 17/06/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class PostAPIService {
    func getAll(completion: @escaping ([Post]) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "http://localhost:3000/posts")!) { (data, res, err) in
            DispatchQueue.main.sync {
                guard let d = data,
                    let json = try? JSONSerialization.jsonObject(with: d, options: .allowFragments) as? [[String: Any]] else {
                    completion([])
                    return
                }
                completion(self.convertJsonToPosts(json : json))
            }
        }.resume()
    }
    
    func convertJsonToPosts(json : [[String : Any]]) -> [Post]{
        
        return json.compactMap { (row) -> Post in
            Post(username: row["username"] as! String, pathImg: row["pathImg"] as! String, description: row["description"] as! String, date: row["date"] as! String, likes: row["likes"] as! Int, localisation: row["localisation"] as! String, id: row["id"] as! Int)
        }
    }
    
}
