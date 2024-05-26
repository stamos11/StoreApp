//
//  URL+Extensions.swift
//  StoreApp
//
//  Created by stamoulis nikolaos on 26/5/24.
//

import Foundation

extension URL {
    
    static var development: URL {
    URL(string: "https://api.escuelajs.co")!
    }
    static var production: URL {
        URL(string: "https://production.api.escuelajs.co")!
    }
    
    static var `default`: URL {
        #if DEBUG
        return development
        #else
        return production
        #endif
    }
    static var allCategories: URL {
        URL(string: "api/v1/categories", relativeTo: Self.default)!
    }
}
