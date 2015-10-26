//
//  ViewController.swift
//  Assessment 3
//
//  Created by Tedi Konda on 1/22/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // BlackJack game: Create a a game of Blackjack
    // ************* Baseline requirements:
    // ** Set up Player class and CardGame class in their respective provided files. Follow the protocol rules for the CardGame class.
    // When card game first starts, a new player is generated and handed out 2 cards (between 1 and 11). Hint: generate 2 random numbers and add them together
    // A value for the CPU is also generated between 12 and 21 (random Int)
    // When the green view is double tapped (tap gesture recognizer), generate a new card (between 1 and 11) for the player, and add it to their score
    // If the total adds up to over 21, change the label text to "Game over, you lose!" and remove the ability for the player to keep tapping for cards
    // If the player wishes to not get dealt any more cards, the player can swipe right to end game (swipe gesture recognizer)
    // When the player ends the game, present the CPU score and present winner determined from compre comparison
    
    // Bonus: Create a button to play a new game.
    // Bonus 2: Player can start with a pool of money (selected through a text field) and make bets for each game (through a text field again). If player reaches <= 0, don't allow them to play any more games.
    // Bonus 3: When handing out cards, display the actual value to the user. If the card is an Ace, let the user select either 1 or 11.
    
    var newGame = CardGame()
    var allowBet: Bool = true
    var roundOver: Bool = false
    var dealersTurn: Bool = false
    
    
    @IBOutlet weak var redBox: UIView!
    @IBOutlet weak var humanCards: UILabel!
    @IBOutlet weak var dealerCards: UILabel!
    @IBOutlet weak var bankAmount: UILabel!
    @IBOutlet weak var humanScore: UILabel!
    @IBOutlet weak var dealerScore: UILabel!
    @IBOutlet weak var potAmount: UILabel!
    @IBOutlet weak var betAmount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        //default bet amount
        self.betAmount.text = "5"
    }
    
    func startNewRound()
    {
        self.view.backgroundColor = UIColor.whiteColor()
        self.roundOver = false
        self.newGame.startGame()
        self.bankAmount.text = String(self.newGame.human.money)
        updateCardsDisplayed()
        self.allowBet = true
    }
    
    func placeBet() -> Bool
    {
        var betPlaced = !self.allowBet
        if betPlaced
        {
            //the bet has been placed, do nothing
        }
        else if let tempBet = Int(self.betAmount.text!)
        {
            if self.allowBet
            {
                self.bankAmount.text = String(Int(self.bankAmount.text!)! - Int(tempBet))
                self.potAmount.text = String(tempBet)
                self.allowBet = false
                self.newGame.human.money -= Int(tempBet)
                betPlaced = true
            }
        }
        else
        {
            let newAlert = UIAlertController(title: "Error", message: "You must enter a valid bet amount", preferredStyle: UIAlertControllerStyle.Alert)
            newAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: nil))
            self.presentViewController(newAlert, animated: true, completion: nil)
        }
        return betPlaced
    }
    
    func updateCardsDisplayed()
    {
        self.humanCards.text = ""
        self.dealerCards.text = ""
        var tempScoreCount = 0
        
        //count and display the cards for the human player
        for i in 0..<self.newGame.human.visibleCards.count
        {
            self.humanCards.text! += String(self.newGame.human.visibleCards[i]) + ", "
        }
        tempScoreCount = countScore(self.newGame.human.visibleCards)
        self.humanScore.text = String(tempScoreCount)
        //if the score is over 21, the player busts
        if tempScoreCount > 21
        {
            self.humanScore.text! += "\n You lose"
            self.roundOver = true
            displayWinner()
        }
        
        
        //count and display the cards for the dealer
        print(self.newGame.dealer)
        if self.newGame.dealer.invisibleCard != 0
        {
            self.dealerCards.text = "?, "
        }
        
        for i in 0..<self.newGame.dealer.visibleCards.count
        {
            self.dealerCards.text! += String(self.newGame.dealer.visibleCards[i]) + ", "
        }
        self.dealerScore.text = String(countScore(self.newGame.dealer.visibleCards))
    }
    
    func countScore(cards: [Int]) -> Int
    {
        var tempAceCount = 0
        var tempScoreCount = 0
        for i in cards
        {
            if i == 1
            {
                tempAceCount++
                tempScoreCount += 11
            }
            else if i > 10
            {
                tempScoreCount += 10
            }
            else
            {
                tempScoreCount += i
            }
        }
        
        //check to see if over 21 and there are aces, if yes try to reduce score
        if tempScoreCount > 21 && tempAceCount > 0
        {
            for _ in 0..<tempAceCount
            {
                //change an Ace from 11 to 1
                tempScoreCount -= 10
                if tempScoreCount <= 21
                {
                    break
                }
            }
        }
        return tempScoreCount
    }
    
    func playOutDealer()
    {
        self.newGame.dealer.visibleCards.insert(self.newGame.dealer.invisibleCard, atIndex: 0)
        self.newGame.dealer.invisibleCard = 0
        updateCardsDisplayed()
        while countScore(self.newGame.dealer.visibleCards) < 17
        {
            self.newGame.deal(true)
            updateCardsDisplayed()
        }
        self.dealersTurn = false
        displayWinner()
    }
    
    func displayWinner()
    {
        var scoreWinner = ""
        self.roundOver = true
        let humanScore = countScore(self.newGame.human.visibleCards)
        let dealerScore = countScore(self.newGame.dealer.visibleCards)
        if humanScore > 21
        {
            scoreWinner = self.newGame.dealer.name
        }
        else if dealerScore > 21
        {
            scoreWinner = self.newGame.human.name
            self.newGame.human.money += 2 * Int(self.potAmount.text!)!
        }
        else if humanScore > dealerScore
        {
            scoreWinner = self.newGame.human.name
            self.newGame.human.money += 2 * Int(self.potAmount.text!)!
        }
        else
        {
            scoreWinner = self.newGame.dealer.name
        }
        let newAlert = UIAlertController(title: "Game Over", message: "\(scoreWinner) wins!", preferredStyle: UIAlertControllerStyle.Alert)
            newAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: { action in
            self.doFinal()
            }))
            self.presentViewController(newAlert, animated: true, completion: { () -> Void in
            })
    }
    
    func doFinal()
    {
        self.view.backgroundColor = UIColor.redColor()
        self.bankAmount.text = String(self.newGame.human.money)
        self.potAmount.text = "0"
    }


    @IBAction func doubleTap(sender: AnyObject) {
        if self.roundOver == true
        {
            let newAlert = UIAlertController(title: "Game Over", message: "You lost.\nPlay again?", preferredStyle: UIAlertControllerStyle.Alert)
            newAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: {action in
                self.doFinal()
                //self.startNewRound()
            }))
            
            self.presentViewController(newAlert, animated: true, completion: { () -> Void in
            })

        }
        else
        {
            if self.dealersTurn == false
            {
                if self.placeBet()
                {
                    self.newGame.deal(false)
                    updateCardsDisplayed()
                }
            }
            print("double tap")
        }
        
        
    }
    
    //Player stays, passes to Dealer
    @IBAction func swipeRight(sender: AnyObject) {
        print("swipe right")
        self.placeBet()
        self.dealersTurn = true
        playOutDealer()
    }
    
    @IBAction func dealAgain(sender: AnyObject)
    {
        if self.roundOver
        {
            if self.newGame.human.money <= 0
            {
                //the user is out of money, no more playing
                let newAlert = UIAlertController(title: "Money Issues", message: "Sorry, you cannot play anymore. You are out of money. Please come back when you have more money to spend.\n\nAlso, you should probably consider going to Gamblers Anonymous. You have a problem.\n\nSeriously. What's up with that?", preferredStyle: .Alert)
                newAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: nil))
            }
            else
            {
                self.startNewRound()
            }
        }
    }
}

