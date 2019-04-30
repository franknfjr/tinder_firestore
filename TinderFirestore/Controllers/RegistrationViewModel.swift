//
//  RegistrationViewModel.swift
//  TinderFirestore
//
//  Created by Frank Ferreira on 26/04/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import UIKit

class RegistrationViewModel {
    
    var bindableImage = Bindable<UIImage>()
    
    var fullName: String? {
        didSet {
            checkFormValidity()
        }
    }
    var email: String? { didSet { checkFormValidity() }}
    var password: String? { didSet { checkFormValidity() }}
    
    fileprivate func checkFormValidity() {
        let ifFormValid = fullName?.isEmpty == false && email?.isEmpty == false && password?.isEmpty == false
        
        bindableisFormValid.value = ifFormValid
    }
    
    //Reactive programming
    var bindableisFormValid = Bindable<Bool>()
    
}
