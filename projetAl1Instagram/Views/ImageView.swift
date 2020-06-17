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

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {
        VStack {
            Image(uiImage: imageLoader.data != nil ? UIImage(data:imageLoader.data!)! : UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .padding(.leading, -20)
                .padding(.trailing, -20)
                // .frame(width:350, height:400)
        }
    }

}
