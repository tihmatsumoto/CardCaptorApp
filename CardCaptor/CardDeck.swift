//
//  CardDeck.swift
//  CardCaptor
//
//  Created by Tiemi Matsumoto on 21/08/2024.
//

import UIKit

import Foundation

struct CardDeck {
    
    let clowCards: UIImage
    let sakuraCards: UIImage
    
    init(clowCards: UIImage, sakuraCards: UIImage) {
        self.clowCards = clowCards
        self.sakuraCards = sakuraCards
    }
}
