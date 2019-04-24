//
//  User.swift
//  TinderFirestore
//
//  Created by Frank Ferreira on 22/04/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import UIKit

struct User: ProducesCardViewModel {
    // defining our properties for our model layer
    let name: String
    let age: Int
    let profession: String
    let imageNames: [String]
    
    func toCardViewModel() -> CardViewModel {
        let attributedText = NSMutableAttributedString(string: name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
        
        attributedText.append(NSMutableAttributedString(string: "  \(age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .light)]))
        
        attributedText.append(NSMutableAttributedString(string: "\n\(profession)", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .light)]))
        
        return  CardViewModel(imageNames: imageNames, attributedString: attributedText, textAlignment: .left)
    }
}
