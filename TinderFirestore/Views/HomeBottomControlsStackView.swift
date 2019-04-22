//
//  HomeBottomControlsStackView.swift
//  TinderFirestore
//
//  Created by Frank Ferreira on 22/04/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import UIKit

class HomeBottomControlsStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        let buttomSubViews = [UIColor.red, .green, .blue, .yellow, .purple].map { (color) -> UIView in
            let v = UIView()
            v.backgroundColor = color
            return v
        }
        
        buttomSubViews.forEach {
            (v) in
            addArrangedSubview(v)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
