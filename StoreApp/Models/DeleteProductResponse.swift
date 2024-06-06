//
//  DeleteProductResponse.swift
//  StoreApp
//
//  Created by stamoulis nikolaos on 4/6/24.
//

import Foundation


struct DeleteProductResponse: Codable {
    
    var rta: Bool?
    var statusCode: Int?
    var message: String?
    var error: String?
}
