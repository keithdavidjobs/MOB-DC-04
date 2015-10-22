//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol Animal
{
    var name: String { get }
    var fur: Bool { get }
    func makeNoise() -> String
}

protocol Hunter
{
    var vegetarian: Bool { get }
    var hasClaws: Bool { get }
}

extension Animal where Self: Hunter
{
    var hasClaws: Bool { return true }
    var vegetarian: Bool { return false }
    func makeNoise() -> String
    {
        return "RAAAAWR"
    }
}

struct Tiger: Animal, Hunter
{
    var name: String
    var fur: Bool = true
}


var simba = Tiger(name: "Simba", fur: true)

var simba2 = Tiger(name: "Simba2", fur: true)

simba2.vegetarian
simba.vegetarian
simba.makeNoise()


//-------------------------------------------------------------
//-------------------------------------------------------------
//-------------------------------------------------------------
//-------------------------------------------------------------

protocol Bird
{
    var type: String { get }
    var beak: Bool { get }
}

protocol CanFly
{
    var hasWings: Bool { get }
    func fly() -> String
}

extension Bird where Self: CanFly
{
    var hasWings: Bool { return true }
    func fly() -> String
    {
        return "I'm flying dude. Now I'm gonna shit on yo head!!"
    }
}

struct Pigeon: Bird, CanFly
{
    var type: String
    var beak: Bool
}

var genericBird = Pigeon(type: "ugly", beak: true)