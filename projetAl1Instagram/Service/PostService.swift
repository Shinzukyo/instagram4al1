//
//  PostService.swift
//  projetAl1Instagram
//
//  Created by Developer on 17/06/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class PostAPIService {
    final var url = "http://localhost:3000"
    func getAll(completion: @escaping ([Post]) -> Void) {
        URLSession.shared.dataTask(with: URL(string: url + "/posts?_sort=id&_order=desc")!) { (data, res, err) in
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
    
    func addPost(username: String, location: String, imagePath: String, description: String) {
        let urlAddPost = URL(string: url + "/posts")
        guard let requestUrl = urlAddPost else {fatalError()}
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "username=" + username + "&pathImg=" + imagePath + "&description=" + description + "&localisation=" + location
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request)
        task.resume()
    }
    
    func convertJsonToPosts(json : [[String : Any]]) -> [Post]{
        
        return json.compactMap { (row) -> Post in
            Post(username: row["username"] as! String, pathImg: row["pathImg"] as! String, description: row["description"] as! String, localisation: row["localisation"] as! String, id: row["id"] as! Int)
        }
    }
    
}
