//
//  AddProductViewController.swift
//  StoreApp
//
//  Created by stamoulis nikolaos on 27/5/24.
//

import Foundation
import UIKit
import SwiftUI

class AddProductViewController: UIViewController {
    
    private var selectedCategory: Category?
    
    lazy var titleTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Enter Title"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.borderStyle = .roundedRect
        return textField
    }()
    lazy var priceTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Enter Price (Numbers Only)"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    lazy var imageURLTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name url"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.borderStyle = .roundedRect
        return textField
    }()
    lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.backgroundColor = .lightGray
        return textView
    }()
    lazy var categoryPickerView: CategoryPickerView = {
        let pickerView = CategoryPickerView { [weak self] category in
            print(category)
            self?.selectedCategory = category
        }
        return pickerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    private func setupUI() {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        
        stackView.addArrangedSubview(titleTextField)
        stackView.addArrangedSubview(priceTextField)
        stackView.addArrangedSubview(descriptionTextView)
        
        let hostingController = UIHostingController(rootView: categoryPickerView)
        stackView.addArrangedSubview(hostingController.view)
        addChild(hostingController)
        hostingController.didMove(toParent: self)
        stackView.addArrangedSubview(imageURLTextField)
        view.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
    }
}
#Preview {
    AddProductViewController()
}
