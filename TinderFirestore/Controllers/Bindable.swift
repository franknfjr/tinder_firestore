//
//  Bindable.swift
//  TinderFirestore
//
//  Created by Frank Ferreira on 30/04/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?) -> ())?
    
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
}
