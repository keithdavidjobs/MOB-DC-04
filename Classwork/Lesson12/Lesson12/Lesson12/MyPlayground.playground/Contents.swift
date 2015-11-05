//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var animal = "dogie"

switch animal
{
    case "dog", "wolf":
        print("You belong to the canine class")
    case "cat", "tiger":
        print("You belong to the feline class")
    case "human":
        print("You belong to the homosapien class")
        break
    default:
        print("I dont know what you are")
}


enum GACampus
{
    case DC
    case NY
    case SF
    case LA
    case HK
    case TX
}

var myCampus = GACampus.DC

switch myCampus
{
    case .NY:
        print("You go to NY")
    case .DC:
        print("You are teh best mobile class ever")
    default:
        print("I don't know what you are")
}