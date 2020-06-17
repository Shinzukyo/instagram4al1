//
//  ImageLoader.swift
//  projetAl1Instagram
//
//  Created by Developer on 17/06/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Combine
import Foundation

class ImageLoader: ObservableObject {
    @Published var data:Data?

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
