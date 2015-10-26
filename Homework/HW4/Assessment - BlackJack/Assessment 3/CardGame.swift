//
//  CardGame.swift
//  Assessment 3
//
//  Created by Tedi Konda on 1/23/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import Foundation
protocol BlackJack {
    // Require a deal method
    // Require a first hand method
    func deal(toDealer: Bool)
    func firstHand()
    func startGame()
}

class CardGame: BlackJack {

    var human = Human(isDealer: false, cardScore: 0, visibleCards: [], name: "Keith", money: 100)
    var dealer = Dealer(isDealer: true, cardScore: 0, visibleCards: [], invisibleCard: 0, name: "Dealer")
    

    func startGame()
    {
        //start the game
        firstHand()
    }
    
    func deal(toDealer: Bool)
    {
        //get a random card between 1 and 13 (any card above a 10 is worth 10, an Ace is represented by the number 1)
        let random_card = Int(arc4random_uniform(13)) + 1
        if toDealer == true
        {
            //deal the card to dealer
            if self.dealer.invisibleCard == 0 && self.dealer.visibleCards.count < 2
            {
                self.dealer.invisibleCard = random_card
            }
            else
            {
                self.dealer.visibleCards.append(random_card)
            }
        }
        else
        {
            //deal the card to human
            self.human.visibleCards.append(random_card)
        }
    }
    
    func firstHand() {
        self.human.visibleCards = []
        self.dealer.visibleCards = []
        self.dealer.invisibleCard = 0
        for _ in 0...1
        {
            //deal card to Human
            deal(false)
            //deal card to Dealer
            deal(true)
        }
    }
}