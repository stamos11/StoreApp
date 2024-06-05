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

enum HttpMethod {
    case get([URLQueryItem])
    case post(Data?)
    case delete
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        }
    }
}
struct Resource<T: Codable> {
    let url: URL
    var headers: [String: String] = [:]
    var method: HttpMethod = .get([])
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
    func createProduct(productRequest: CreateProductRequest) async throws -> Product {
        
        var request = URLRequest(url: URL.createProduct)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(productRequest)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 201 else {
            throw NetworkError.InvalidServerResponse
        }
        guard let product =  try? JSONDecoder().decode(Product.self, from: data) else {
            throw NetworkError.DecodingError
        }
        return product
    }
    func deleteProduct(productId: Int) async throws -> Bool {
        
        var request = URLRequest(url: URL.deleteProduct(productId))
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            throw NetworkError.InvalidServerResponse
        }
        
        let isDeleted = try JSONDecoder().decode(Bool.self, from: data)
        return isDeleted
        
    }
}
