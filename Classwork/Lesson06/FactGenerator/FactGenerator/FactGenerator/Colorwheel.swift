//
//  Colorwheel.swift
//  FactGenerator
//
//  Created by Shalev on 10/14/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import Foundation
import UIKit

struct Colorwheel
{
    var redColor: Float
    var greenColor: Float
    var blueColor: Float
    
    func getRandomColor() -> (redColor: CGFloat, greenColor: CGFloat, blueColor: CGFloat)
    {
        let redNum = CGFloat(arc4random_uniform(10)) / 10
        let greenNum = CGFloat(arc4random_uniform(10)) / 10
        let blueNum = CGFloat(arc4random_uniform(10)) / 10
        print("red: \(redNum), green: \(greenNum), blue: \(blueNum)")
        return (redColor: redNum, greenColor: greenNum, blueColor: blueNum)
    }
}