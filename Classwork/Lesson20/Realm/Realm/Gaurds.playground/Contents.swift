//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func info(name: String?, age: Int) -> String
{
    guard let name1 = name
    else
    {
        return "I don't know your name, but you are \(age) years old"
    }
    
    return "Your name is \(name1) and you are \(age) years old"
//    //if let method
//    if let name = name
//    {
//        return "Your name is \(name) and you are \(age) years old"
//    }
//    else
//    {
//        return "I don't know your name, but you are \(age) years old"
//    }
}

print(info(nil, age: 29))

print(info("Keith", age:32))

extension String
{
    func isValidEmail() -> String
    {
        
        return self.uppercaseString
    }
}


let email = "blah@asdf.com"

let isValid = email.isValidEmail()
print(isValid)