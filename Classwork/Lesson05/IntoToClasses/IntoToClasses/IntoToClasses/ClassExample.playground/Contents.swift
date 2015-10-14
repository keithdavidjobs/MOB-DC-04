//: Playground - noun: a place where people can play

import UIKit

/*
  Class best practices
- each class has its own file
- class names should always start with a capital letter and have the same name as the file
*/

class Car
{
    //class properties always defined at the top
    var doors: Int
    var engine: String
    var speed: Float
    var used: Bool
    var wheels: Int
    var milesDriven: Float
    var operational: Bool
    
    init(doors: Int, engine: String, speed: Float, used: Bool, wheels: Int, milesDriven: Float = 0, operational: Bool = true)
    {
        self.doors = doors
        self.engine = engine
        self.speed = speed
        self.used = used
        self.wheels = wheels
        self.milesDriven = milesDriven
        self.operational = operational
    }
    
    func upgradeSpeed(newSpeed: Float)
    {
        self.speed = newSpeed
        print("Your car's speed has been upgraded to \(newSpeed) mph")
    }
    
    func drive(distance: Float)
    {
        if(self.operational)
        {
            self.milesDriven += distance
        }
        else
        {
            print("You can't drive, your car is not operational!")
        }
    }
    
    func flatTire()
    {
        self.operational = false
    }
    
    func carStatus() -> String
    {
        let operationalStatement = self.operational ? "" : "not"
        return "Your car is \(operationalStatement) and has driven \(self.milesDriven) miles"
    }
}

class Lambo: Car
{
    var awesomeRating: String
    var turboMode: Bool
    
    init(turboMode: Bool = false, wheels: Int)
    {
        self.awesomeRating = "super awesome!!!"
        self.turboMode = turboMode
        
        super.init(doors: 2, engine: "8 cylinger", speed: 300, used: false, wheels: wheels)
    }
}

var diablo = Lambo(wheels: 5)

var keithsCar = Car(doors: 4, engine: "v8", speed: 0, used: false, wheels: 4)
keithsCar.speed
keithsCar.speed = 200
keithsCar.drive(10)
keithsCar.milesDriven

var keithsCarStatus = keithsCar.carStatus()

var patsCar = Car(doors: 4, engine: "4 cylinders", speed: 150, used: false, wheels: 4)
patsCar.upgradeSpeed(100)

//var myFirstArray = [2, 5, 10, 15]
//var myFirstArray: [Int] = [2, 5, 10, 15]
var myFirstArray: Array = [2, 5, 10, 15]
myFirstArray.count
myFirstArray.append(25)

myFirstArray[4]

var myEmptyArray: [String] = []

for i in myEmptyArray
{
    print("Current value is \(i)")
}