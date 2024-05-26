//
//  StoreHTTPClient.swift
//  StoreApp
//
//  Created by stamoulis nikolaos on 26/5/24.
//

import Foundation

enum NetworkError: Error {
    case InvalidUrl
    case InvalidServerResponse
    case DecodingError
}
class StoreHTTPClient {
    
    func getAllCategories() async throws -> [Category] {
        
        
        let (data, response) = try await URLSession.shared.data(from: URL.allCategories)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            throw NetworkError.InvalidServerResponse
        }
        guard let categories = try? JSONDecoder().decode([Category].self, from: data) else {
            throw NetworkError.DecodingError
        }
        
        return categories
    }
    func getProductsByCategory(categoryId: Int) async throws -> [Product] {
        
        let (data, response) = try await URLSession.shared.data(from: URL.productsByCategory(categoryId))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            throw NetworkError.InvalidServerResponse
        }
        guard let products =  try? JSONDecoder().decode([Product].self, from: data) else {
            throw NetworkError.DecodingError
        }
        return products
    }
}
