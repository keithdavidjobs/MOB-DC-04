//: Playground - noun: a place where people can play

import UIKit

var mobClassDC = ["location": "DC", "classTime": "evening", "day1": "Monday", "day2": "Wednesday"]
var mobClassNY = ["location": "NY", "classTime": "morning", "day1": "Tues", "day2": "Thurs"]


mobClassNY.keys

mobClassDC["classTime"]
mobClassDC.count

var myEmptyDict = [String: String]()

var myOtherDictionary = Dictionary<String, String>()

for i in mobClassDC.keys
{
    print(i)
}

mobClassNY["newKey"] = "new value"
print(mobClassNY.keys)
mobClassNY.removeValueForKey("newKey")
print(mobClassNY.keys)
print(mobClassNY)
