//
//  Product.swift
//  StoreApp
//
//  Created by stamoulis nikolaos on 26/5/24.
//

import Foundation

struct Product: Codable {
    
    var id: Int?
    let title: String
    let price: Double
    let description: String
    let images: [URL]?
    let category: Category
}
