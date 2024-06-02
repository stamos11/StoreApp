//
//  ProductImageListView.swift
//  StoreApp
//
//  Created by stamoulis nikolaos on 2/6/24.
//

import SwiftUI

struct ProductImageListView: View {
    
    let images: [UIImage]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(images, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
            }
        }
        
    }
}

#Preview {
    ProductImageListView(images: [])
}
