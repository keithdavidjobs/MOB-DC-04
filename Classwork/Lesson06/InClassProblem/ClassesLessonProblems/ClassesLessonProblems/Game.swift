//
//  Game.swift
//  ClassesLessonProblems
//
//  Created by Shalev on 10/14/15.
//  Copyright © 2015 Tedi Konda. All rights reserved.
//

import Foundation

class Game
{
    //var player1 = Player(name: "", age: 0, weight: 0, gender: "", height: 0)
    //var player2 = Player(name: "", age: 0, weight: 0, gender: "", height: 0)
    var player1: Player
    var player2: Player
    
    init()
    {
        player1 = Player(name: "", age: 0, weight: 0, gender: "", height: 0)
        player2 = Player(name: "", age: 0, weight: 0, gender: "", height: 0)
    }
    
    init(p1: Player, p2: Player)
    {
        player1 = p1
        player2 = p2
    }
    
    func determineWinner() -> String
    {
        if self.player1.age > self.player2.age
        {
            return "\(self.player1.name) wins!"
        }
        else if self.player1.age < self.player2.age
        {
            return "\(self.player2.name) wins!"
        }
        return "Game is a tie"
    }
    
    func isDataFilledOut() -> Bool
    {
        return false
    }
}