//
//  SelectedImageView.swift
//  projetAl1Instagram
//
//  Created by Developer on 18/06/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct SelectedImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    
    init(imageLoader:ImageLoader) {
        self.imageLoader = imageLoader
    }
    
    var body: some View {
        Image(uiImage: imageLoader.data != nil ? UIImage(data:imageLoader.data!)! : UIImage())
        .resizable()
        .aspectRatio(contentMode: .fit)
    }
}

