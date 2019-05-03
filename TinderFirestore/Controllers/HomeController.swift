//
//  ViewController.swift
//  TinderFirestore
//
//  Created by Frank Ferreira on 21/04/19.
//  Copyright © 2019 Frank Ferreira. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UIViewController {
    
    let topStackView = TopNavigationStackView()
    let cardsDeckView = UIView()
    let buttonStackView = HomeBottomControlsStackView()
    
//    let cardViewModels: [CardViewModel] = {
//        let producers = [
//            User(name: "Kelly", age: 23, profession: "Music DJ", imageNames: ["kelly1","kelly2","kelly3"]),
//            User(name: "Jane", age: 18, profession: "Teacher", imageNames: ["jane1","jane2","jane3"]),
//            Advertiser(title: "Avengers End Game", brandName: "Marvel", posterPhotoName: "avengers_endgame")
//        ] as [ProducesCardViewModel]
//
//        let viewModels = producers.map({return $0.toCardViewModel()})
//        return viewModels
//    }()
    
    var cardViewModels = [CardViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topStackView.settingsButton.addTarget(self, action: #selector(handleSettings), for: .touchUpInside)
        setupLayout()
        
        setupDummyCards()
        
        fetchUsersFromFirestore()
    }
    
    //MARK:- Fileprivate
    
    fileprivate func fetchUsersFromFirestore() {
        Firestore.firestore().collection("users").getDocuments { (snapshot, err) in
            if let err = err {
                print("Faild to fetch users:", err)
                return
            }
            
            snapshot?.documents.forEach({ (documentSnapshot) in
                let userDictionary = documentSnapshot.data()
                let user = User(dictionary: userDictionary)
                self.cardViewModels.append(user.toCardViewModel())
            })
            
            self.setupDummyCards()
        }
    }
    
    @objc fileprivate func handleSettings() {
        let registrationController = RegistrationController()
        
        present(registrationController, animated: true)
    }
    
    fileprivate func setupLayout() {
        view.backgroundColor = .white
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, buttonStackView])
        overallStackView.axis = .vertical
        
        view.addSubview(overallStackView)
        
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        
        overallStackView.bringSubviewToFront(cardsDeckView)
        
    }
    
    fileprivate func setupDummyCards() {
        cardViewModels.forEach { (cardVM) in
            let cardView = CardView(frame: .zero)
            
            cardView.cardViewModel = cardVM
            cardsDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }
    }
}

