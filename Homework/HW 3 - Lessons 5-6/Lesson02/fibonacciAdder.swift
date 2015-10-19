//
//  fibonacciAdder.swift
//  Lesson02
//
//  Created by Shalev on 10/18/15.
//  Copyright © 2015 General Assembly. All rights reserved.
//

import Foundation

class FibonacciAdder
{
    var seqNum: Int
    var firstNum: Int
    var secondNum: Int
    var finalNum: Int
    
    init()
    {
        self.seqNum = 0
        self.firstNum = 0
        self.secondNum = 1
        self.finalNum = 1
    }
    
    init(seq: Int)
    {
        self.seqNum = seq
        self.firstNum = 0
        self.secondNum = 1
        self.finalNum = 1
    }
    
    func fibonacciNumberAtIndex(seq: Int) -> Int
    {
        if(seq == 1)
        {
            return self.firstNum
        }
        else if seq == 2
        {
            return self.secondNum
        }
        else
        {
            for i in 3...seq
            {
                self.finalNum = self.firstNum + self.secondNum
                self.firstNum = self.secondNum
                self.secondNum = self.finalNum
            }
        }
        return self.finalNum
    }
    
}