//
//  CardSelectorViewController.swift
//  CardCaptor
//
//  Created by Tiemi Matsumoto on 21/08/2024.
//

import UIKit

class CardSelectorViewController: UIViewController {
    
    let cardImageView = UIImageView()
    let randomCardButton = CSButton(backgroundColor: .systemPink, title: "Go for random card")
    let transformCardButton = CSButton(backgroundColor: .systemPink, title: "Transform card")
    
    var cards = Cards.allValues
    var currentCardArray: CardDeck = CardDeck(clowCards: UIImage(named: "ClowDark")!, sakuraCards: UIImage(named: "SakuraCardDark")!)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureUI()
    }
    
    func configureUI() {
        configureCardImageView()
        configureRandomCardButton()
        configureTransformCardButton()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "ClowDark")
        cardImageView.isUserInteractionEnabled = true
        cardImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageTap)))
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 500),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureRandomCardButton() {
        view.addSubview(randomCardButton)
        randomCardButton.addTarget(self, action: #selector(showRandomCard), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            randomCardButton.widthAnchor.constraint(equalToConstant: 250),
            randomCardButton.heightAnchor.constraint(equalToConstant: 50),
            randomCardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            randomCardButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 40)
        ])
    }
    
    func configureTransformCardButton() {
        view.addSubview(transformCardButton)
        transformCardButton.addTarget(self, action: #selector(transformCard), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            transformCardButton.widthAnchor.constraint(equalToConstant: 250),
            transformCardButton.heightAnchor.constraint(equalToConstant: 50),
            transformCardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            transformCardButton.topAnchor.constraint(equalTo: randomCardButton.bottomAnchor, constant: 30)
        ])
    }
    
    @objc func imageTap() {
        let detailsVC = CardDetailsViewController()
        detailsVC.imageToDetail = cardImageView.image
        self.present(detailsVC, animated: true)
    }
    
    @objc func showRandomCard() {
        currentCardArray = cards.randomElement()!
        cardImageView.image = currentCardArray.clowCards
    }
    
    @objc func transformCard() {
        UIView.animate(withDuration: 1.5, delay: 0, options: [.transitionCrossDissolve]) {
            self.cardImageView.alpha = 0
            self.cardImageView.image = self.currentCardArray.sakuraCards
            self.cardImageView.alpha = 1
        }
    }
}

