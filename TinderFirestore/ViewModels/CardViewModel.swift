//
//  CardViewModel.swift
//  TinderFirestore
//
//  Created by Frank Ferreira on 23/04/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import UIKit

protocol ProducesCardViewModel {
    func toCardViewModel() -> CardViewModel
}

struct CardViewModel {
    let imageName: String
    let attributedString: NSAttributedString
    let textAlignment: NSTextAlignment
}

