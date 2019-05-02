//
//  RegistrationViewModel.swift
//  TinderFirestore
//
//  Created by Frank Ferreira on 26/04/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import UIKit
import Firebase

class RegistrationViewModel {
    
    var bindableIsRegistering = Bindable<Bool>()
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
    
    func performRegistration(completion: @escaping (Error?) -> ()) {
        guard let email = email, let password = password else { return }
        bindableIsRegistering.value = true
        Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
            
            if let err = err {
                print(err)
                completion(err)
                return
            }
            
            print("Successfully registered user:", res?.user.uid ?? "")
            
            self.saveImageToFirebase(completion: completion)
        }
    }
    
    //Reactive programming
    var bindableisFormValid = Bindable<Bool>()
    
    fileprivate func saveImageToFirebase(completion: @escaping (Error?) -> ()) {
        let filename = UUID().uuidString
        let ref_image = Storage.storage().reference(withPath: "/images/\(filename)")
        let imageData = self.bindableImage.value?.jpegData(compressionQuality: 0.75) ?? Data()
        
        ref_image.putData(imageData, metadata: nil, completion: { (_, err) in
            if let err = err {
                completion(err)
                return
            }
            
            print("Finished uploading image to Storage")
            
            ref_image.downloadURL(completion: { (url, err) in
                if let err = err {
                    completion(err)
                    return
                }
                
                self.bindableIsRegistering.value = false
                print("Download url of our image is:", url?.absoluteString ?? "")
                
            })
        })
    }
}
