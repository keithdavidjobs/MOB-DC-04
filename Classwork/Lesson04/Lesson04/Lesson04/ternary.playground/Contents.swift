//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var name: String?

name = "keith"

if name != nil
{
    print("your name is \(name!)", terminator: "")
}
else
{
    print("I don't know your \" name yet")
}


let age = 45

name
age
//print("your name is \(name)")

if let myname = name
{
    print("your name is \(myname)")
}


func getArea(width: Double, height: Double)
{
//    let area = width * height
//    print("Area of rectangle is \(area)")
    print("Area of rectangle is \(width * height)")
}

getArea(10, height:12)
