//
//  Factbook.swift
//  FactGenerator
//
//  Created by Shalev on 10/14/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import Foundation

struct Factbook
{
    var factsArray = [
        "People are mammals",
        "The sky is blue",
        "Ants stretch when they wake up in the morning",
        "It's always darkest before it's completely black",
        "The sun will be explode one day",
        "e=mC2",
        "On average it takes 66 days to form a new habbit",
        "The state of Florida is bigger than England",
        "The fastest animal is the cheetah",
        "Birds are faster then cheetas",
        "Tupac is alive"
    ]
    
    func getRandomFact() -> String
    {
        let arrayCount = self.factsArray.count
        //let randNum = Int(rand()) % arrayCount
        let randNum = Int(arc4random_uniform(UInt32(arrayCount)))
        //let randNum = Int(rand(UInt32(arrayCount)))
        print(randNum)
        return self.factsArray[randNum]
    }
}