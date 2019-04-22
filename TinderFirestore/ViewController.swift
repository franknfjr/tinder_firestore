//
//  ViewController.swift
//  TinderFirestore
//
//  Created by Frank Ferreira on 21/04/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topStackView = TopNavigationStackView()
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let buttonStackView = HomeBottomControlsStackView()
        
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, blueView, buttonStackView])
        overallStackView.axis = .vertical
        
        view.addSubview(overallStackView)
        
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    
}

