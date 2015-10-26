//
//  Player.swift
//  Assessment 3
//
//  Created by Tedi Konda on 1/23/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import Foundation

protocol Player
{
    var isDealer: Bool { get }
    var visibleCards: [Int] { get set }
    var name: String { get }
    var cardScore: Int { get set }
}

struct Dealer: Player
{
    var isDealer: Bool = true
    var cardScore: Int = 0
    var visibleCards: [Int]
    var invisibleCard: Int
    var name: String = "Dealer"
    
}

struct Human: Player
{
    var isDealer: Bool = false
    var cardScore: Int = 0
    var visibleCards: [Int]
    var name: String
    var money: Int
}