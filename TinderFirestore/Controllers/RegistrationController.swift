//
//  RegistrationControllerViewController.swift
//  TinderFirestore
//
//  Created by Frank Ferreira on 25/04/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {
    
    let selectPhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select Photo", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        return button
    }()
    
    let fullNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter full name"
        return tf
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter email"
        tf.keyboardType = .emailAddress
        return tf
    }()
    let passwordextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter password"
        tf.isSecureTextEntry = true
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let stackView = UIStackView(arrangedSubviews: [selectPhotoButton, fullNameTextField, emailTextField, passwordextField])
        
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 8
        
        stackView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 32, bottom: 0, right: 32))
        
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
