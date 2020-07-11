//
//  ImageView.swift
//  projetAl1Instagram
//
//  Created by Developer on 17/06/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation
import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    @State var showingDetail = false
    

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {
        ZStack {
            Image(uiImage: imageLoader.data != nil ? UIImage(data:imageLoader.data!)! : UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)
                .clipped()
                .onTapGesture {
                    self.showingDetail.toggle()
            }.sheet(isPresented: $showingDetail) {
                SelectedImageView(imageLoader: self.imageLoader)
            }
        }
    }
}
