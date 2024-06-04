//
//  UIViewController+Extensions.swift
//  StoreApp
//
//  Created by stamoulis nikolaos on 4/6/24.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertVC,animated: true)
    }
}
