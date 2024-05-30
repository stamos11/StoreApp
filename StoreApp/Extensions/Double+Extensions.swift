//
//  Double+Extensions.swift
//  StoreApp
//
//  Created by stamoulis nikolaos on 30/5/24.
//

import Foundation


extension Double {
    
    func formatAsCurrency() -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? "0.00"
    }
}
