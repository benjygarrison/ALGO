//
//  main.swift
//  ALGO
//
//  Created by Ben Garrison on 11/28/21.
//

import Foundation


//MARK: variables

let newArray = [1,2,3,4,5]
let target = 6
//print(newArray.firstIndex(of: 4))
if let i = newArray.firstIndex(of: 2) {
    let j = i
    print (j)
}
let doubleTarget = Double(target)
print(doubleTarget * 10)
print(String(target) + " = " + "6")

var tuple: (firstValue: Int, secondValue: String) = (1, "one")
print(tuple.firstValue)
print(tuple.secondValue)
tuple.firstValue = 2
tuple.secondValue = "two"
print(tuple.firstValue, tuple.secondValue)


//MARK: basic functions

//arrow indicates return type of function
//functions can have external and internal names for same variables. they can both be listed in main function argument, i.e. func myFunc(testStringExtern testStringIntern: String) -> {}, or remove external argument altogether by replacing with underscore, i.e. (_ testStringIntern: String). Add question mark for optional, etc.

func practiceFunction(a: String, b: Int) -> String {
    
    //this function could return int or string dependent on choice after arrow
    
    let testString: String = "\(a), \(b)"
    print(testString)
    return testString
}

// call function: practiceFunction(a: "foo", b: 30)

//assign entire function to variable:

let funcVariable = practiceFunction(a: "test", b: 100)


for i in 0...5 {
    print(i)
}

//use underscore when you don't car about returning the value of the variable (i.e. "i above")

for _ in 0..<5 {
    print("loop")
}

var x = 0

while x < 5 {
    print(x)
        x += 1
}

var y = 0
repeat {
    print(y)
    y += 1
} while y < 5
            
let testSwitch = 101

switch testSwitch {
case _ where testSwitch < 1 || testSwitch > 100:
    print("testSwitch is 0 or less, or greater than 100")
case 2..<50:
    print("testSwitch from 2 to 49")
default:
    print("testSwitch is \(testSwitch)")
}

let testSwitchString = "YOU"

switch testSwitchString.lowercased() {
case "you":
    print("you")
case "them":
    print("them")
default:
    print("nobody at all")
}

let testBool: Bool = true

switch testBool {
case true:
    print("true")
case false:
    print("false")
}

// "passing by reference" = inout functions

func inoutTest(inoutIntTest: inout Int) {
    inoutIntTest = inoutIntTest * 5
}

var inoutIntTest = 5
inoutTest(inoutIntTest: &inoutIntTest)
print("inoutTest = \(inoutIntTest)")

//MARK: return types

//returning a tuple

func returnTuple(tupleName: String) -> (firstTupleName: String, secondTupleName: String) {
    
    let firstTupleName = "first name"
    let secondTupleName = "last name"
    return (firstTupleName, secondTupleName)
    
}

let tupleFunctionTestReturn = returnTuple(tupleName: "default")
print(tupleFunctionTestReturn)
print("\(tupleFunctionTestReturn.secondTupleName), \(tupleFunctionTestReturn.firstTupleName)")

//return an optional, no argument; need IF statement

func returnOptionalFunction() -> String? {
    return "completely optional"
}

if let a = returnOptionalFunction(){
    print(a)
}

//MARK: generics

//can declare a single generic for multiple data types

func swapVariables<genericTest>(_ aGen: inout genericTest, _ bGen: inout genericTest){
    let genTest = aGen
    aGen = bGen
    bGen = genTest
}

//variables below can be declared as any data type, not required to be Int (can even be tuples!)

var aGen = 55
var bGen = 100

print(aGen)
print(bGen)

swapVariables(&aGen, &bGen)

print(aGen, bGen)

//MARK: optionals

//optional expresses the abscence of a value: i.e. one that takes input. nil = nothing. regular optionals use ?

var optionalOne: Int? = 100

if optionalOne == nil {
    print("nothing to see here")
} else {
    print("someone's inside")
}

//optional binding

if let optionalOne = optionalOne {
    print("optionalOne = \(optionalOne)")
}

var optionalString: String? = "kiwi"

if let optionalString = optionalString {
    print("optionalString = \(optionalString)")
}

//implicit optionals use ! (xCode thinks it's risky), cannot be used like regular variable if it is nil (the program will crash)

var optionalTwo: Int! = nil

optionalTwo = optionalOne!

var optionalThree = optionalTwo + 3
print(optionalThree)


//MARK: native collections

//creating/accessing arrays

let firstArray = [2, 3, 4]

print("firstArray multiplied: \(firstArray[1] * 2)")

//call prefix or suffix from array:

print("first array prefix and suffix: \(firstArray.prefix(2)) , \(firstArray.suffix(2))")

//search array:

print("firstArray contains 2: \(firstArray.contains(2))")

//equality operator:

print("first array is equal to [2,3,4]: \(firstArray == [2,3,4])")

//possible ways of declaring arrays: var a: [Int] = [1,2,3], var a = Array<Int>([1, 2, 3]), var a = [Int]([1,2,3])

//operations that can be performed:
//change value: a[2] = 9
//append: a.append(23)
//insert: a.insert(3, at: 1)
//concatenate: let b = a + [99, 45] -> values will be appended, apparently

//loop through array:

for n in firstArray {
    print("looping first array: \(n)")
}
//can also swap n for _ and not use a specific value, i.e. just return an unrelated string or input base don number of items in loop






