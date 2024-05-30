//
//  String+Extensions.swift
//  StoreApp
//
//  Created by stamoulis nikolaos on 30/5/24.
//

import Foundation

extension String {
    
    var isNumeric: Bool {
        Double(self) != nil
    }
}
