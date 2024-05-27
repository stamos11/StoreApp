//
//  Locale+Extensions.swift
//  StoreApp
//
//  Created by stamoulis nikolaos on 27/5/24.
//

import Foundation

extension Locale {
    static var currencyCode: String {
        Locale.current.currency?.identifier ?? "USD"
    }
}
