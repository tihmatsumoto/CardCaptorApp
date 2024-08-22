//
//  CardDetailsViewController.swift
//  CardCaptor
//
//  Created by Tiemi Matsumoto on 21/08/2024.
//

import UIKit

class CardDetailsViewController: UIViewController {
    
    let cardDetailsImageView = UIImageView()
    var imageToDetail = UIImage(named: "ClowDark")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureCardImageView()
        cardDetailsImageView.image = imageToDetail
    }
    
    func configureCardImageView() {
        view.addSubview(cardDetailsImageView)
        cardDetailsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardDetailsImageView.widthAnchor.constraint(equalToConstant: 375),
            cardDetailsImageView.heightAnchor.constraint(equalToConstant: 750),
            cardDetailsImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardDetailsImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
