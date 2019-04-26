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
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 270).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    let fullNameTextField: CustomTextField = {
        let tf = CustomTextField(padding: 24)
        tf.placeholder = "Enter full name"
        tf.backgroundColor = .white
        
        return tf
    }()
    
    let emailTextField: CustomTextField = {
        let tf = CustomTextField(padding: 24)
        tf.placeholder = "Enter email"
        tf.keyboardType = .emailAddress
        tf.backgroundColor = .white
        
        return tf
    }()
    let passwordextField: CustomTextField = {
        let tf = CustomTextField(padding: 24)
        tf.placeholder = "Enter password"
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let stackView = UIStackView(arrangedSubviews: [selectPhotoButton, fullNameTextField, emailTextField, passwordextField])
        
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 8
        
        stackView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 50, bottom: 0, right: 50))
        
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
