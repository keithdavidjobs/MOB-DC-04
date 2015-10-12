// Playground - noun: a place where people can play
// Lesson 05


// Complete these, in order, writing code under each TODO statement. Each statement calls for a function to be written, write each of them and then immediately call it after the function definition.

// TODO: Write a function that prints out "Hello world!" 10 times
func printHello()
{
    for i in 0...9
    {
        print("Hello world!")
    }
}
printHello()

// TODO: Write a function that prints out "Hit this line {number of iterations of the loop} times!" 20 times
func hitLine()
{
    for i in 0...19
    {
        print("Hit this line \(i+1) times!")
    }
}
hitLine()

// TODO: Write a function that accepts a string as a parameter. Print "Hello {value of string}!"
func printString(strVal: String)
{
    print("Hello \(strVal)")
}
printString("keith")

// TODO: Write a function accepts a string optional. If the string optional exists, print "Hello {value of string}!". If it doesn't, print "Hello world!"
func printName(strVal: String?)
{
    if let name = strVal
    {
        print("Hello \(name)")
    }
    else
    {
        print("Hello world")
    }
}
printName(nil)

// TODO: Write a function that takes one parameter, n, and returns an integer, the nth series in the fibonacci
// sequence. The first fibonacci number is 0, the second is 1, the third is 1, the fourth is 2, fifth is 3, sixth is 5, etc. fibonacci numbers at sequence n are the sum of the n-1 and n-2 fibonacci number.
func getFib(val: Int) -> Int
{
    var firstVal = 0
    var secondVal = 1
    var finalVal = 0
    
    //if the value is greater than 2, do a calculation
    if val > 2
    {
        for i in 2..<val
        {
            finalVal = firstVal + secondVal
            firstVal = secondVal
            secondVal = finalVal
        }
    }
    else
    {
        //return the value
        finalVal = val - 1
    }
    return finalVal
}
var fibNum = getFib(6)
/*
1) 0
2) 1
3) 1
4) 2
5) 3
6) 5
7) 8


1) 0+1=1
2) 1+1=2
3) 1+2=3
4) 2+3=5
*/

// TODO: Write a function that calls the above function in order to print the sum of the first 20 fibonacci numbers.
func printFibSum(val: Int)
{
    var sum = 0
    for i in 1...val
    {
        sum = sum + getFib(i)
    }
    print(sum)
}

printFibSum(20)

// TODO: Write a function that takes in a number and prints out whether it is prime, composite or neither.
func testPrime(val: Int) -> String
{
    var isPrime = true
    if val == 0 || val == 1
    {
        //print("neither")
        return "neither"
    }
    else if val % 2 == 0 || (val % 3 == 0 && val > 3)
    {
        //its even so definitely not
        //print("composite")
        return "composite"
    }
    else if val == 3
    {
        //print("prime")
        return "prime"
    }
    else
    {
        //AKS algorithm
        var i = 5
        var w = 2
        while(i*i <= val)
        {
            if val % i == 0
            {
                //print("composite")
                isPrime = false
                break;
            }
            else
            {
                i = i + w
                w = 6 - 2
            }
        }
        if(isPrime)
        {
            //print("prime")
            return "prime"
        }
        else
        {
            //print("composite")
            return "composite"
        }
    }
}

testPrime(31)

// TODO: Write a function that prints out each of the first 20 fibonacci numbers and whether they are prime. (e.g. 0 is not prime or composite, 1 is prime, etc)
func printFibAndPrime(val: Int)
{
    for i in 1...val
    {
        var fibNum = getFib(i)
        //var isPrime = testPrime(fibNum)
        print("Fibonacci number (\(fibNum)) is \(testPrime(fibNum))")
    }
}
printFibAndPrime(20)

// TODO: Write a function that takes in two numbers, a bill amount and an optional tip percentage (represented as a float, e.g. .2 = 20% tip). Return a tuple with the total bill amount and the tip amount (if included).
func calcBill(bill: Float, percent: Float?) -> (total: Float, tip: Float)
{
    if let tipPercent = percent
    {
        //there is a tip
        var tipAmount = bill * (tipPercent)
        return (bill+tipAmount, tipAmount)
    }
    else
    {
        return (bill, 0)
    }
}
var myBill = calcBill(10, percent: 0.2)
print(myBill)

// TODO: Write a function that takes in a string and returns a string that is the reverse of the input. Append two strings using the + operator.
func reverseString(inputStr: String) -> String
{
    /*
    //The long way
    var tempString = ""
    for char in inputStr.characters
    {
        tempString = String(char) + tempString
    }
    return(tempString)
    */
    
    //the short way
    return inputStr + String(inputStr.characters.reverse())
}
reverseString("qwer")
print(reverseString("Keith"))


// BONUS TODO: Write a function that takes in an array of strings and a search term string. Return a boolean indicating whether the search term string exists in the array.
func searchForString(inputArr: [String], searchStr: String) -> Bool
{
    //something
    for search in inputArr
    {
        if search == searchStr
        {
            return true
        }
    }
    return false
}
let tempArr = ["asdf", "qwer", "lkjl", "ieieie", "stevie"]
var tempSearch = searchForString(tempArr, searchStr: "asdf")

// BONUS TODO: Write a function that accepts a string and returns a boolean indicating whether a string is a palindrome (reads the same backwards or forwards).
func testPal(inputStr: String) -> Bool
{
    let tempColl = inputStr.characters
    let tempCount = tempColl.count
    let reversed = inputStr.characters.reverse()
    for i in 0...tempCount/2
    {
        if tempColl[tempColl.startIndex.advancedBy(i)] != reversed[reversed.startIndex.advancedBy(i)]
        {
            return false
        }
    }
    return true
}
var isPal = testPal("asdffdsa")

// BONUS TODO: Write a function that takes in two strings and returns a boolean indicating whether the two strings are equal
func testStringsEqual(str1: String, str2: String) -> Bool
{
    return str1 == str2
}
var t1 = testStringsEqual("people", str2: "people")

// BONUS TODO: Write a function that accepts two parameters, a string and a function that accepts a string and returns a string. Print the result of passing the string into the function 10 times.
func returnString(inputStr: String) -> String
{
    return inputStr
}

func nestedFunc(inputStr: String, inputFunc: (String) -> String)
{
    for i in 0...9
    {
        print(inputFunc(inputStr))
    }
}

nestedFunc("test", inputFunc: returnString)