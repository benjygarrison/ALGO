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

//MARK: dictionaries (i.e. hash values)

//Dictionary<Key, Value>()

var firstDictionary = Dictionary<String,Int>() //longhand
var secondDictionary = [String: Int]() // shorthand -> preferred
var thirdDictionary: [Int: String] = [
    1: "ben",
    2: "hana"
] // declare empty dictionary -> need colon in empty brackets

//add new value:
thirdDictionary[3] = "kiwi"

//overwrite value:
thirdDictionary[3] = "ringo"

if let dictionaryValue = thirdDictionary[2] {
    print("\(dictionaryValue) exists!")
}

if let _ = thirdDictionary[2] {
    print("yep, it's there")
} else {
    print("nope, it's not")
}

for dictionaryTuple in thirdDictionary {
    print(dictionaryTuple)
}
    for(key, value) in thirdDictionary {
        print("\(key), \(value)")
    }

//accessing values:


//MARK: arrays

//creating/accessing arrays

let firstArray = [2, 3, 4]

print("firstArray multiplied: \(firstArray[1] * 2)")

//call prefix or suffix from array:

print("first array prefix and suffix: \(firstArray.prefix(2)) , \(firstArray.suffix(2))")

//search array:

print("firstArray contains 2: \(firstArray.contains(2))")

//equality operator:

print("first array is equal to [2,3,4]: \(firstArray == [2,3,4])")

//iterate array and return index and value:

for (index, n) in firstArray.enumerated() {
    print("first array values -> \(index): \(n)")
}

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


//MARK: set

//an unordered collection. will only show UNIQUE elements; duplicates will not be collected

var fullSet = Set<Int>([1,2,3,4])

var isInSet = true

if fullSet.contains(1){
    print("fullSet contains desired number = \(isInSet)")
} else {
    print("fullSet contains desired number = false")
}

//convert array to set:

var emptySet = Set(firstArray)

print("emptySet = \(emptySet)")

//intersection operation to compare sets (try this on arrays later!)

print(emptySet.intersection(fullSet))

//union operation

print(emptySet.union(fullSet))



//MARK: custom types -> Struct is preferred over Class, generally. Should be used for immutable objects

//Struct -> a group of values with a "proper" definition; basically a "class". Swift types begin with uppercase letters.

struct Me {
    var firstName: String
    var middleName: String?
    var lastName: String
    var age: Int
}

var actualMe = Me(firstName: "Ben", middleName: "Jarod", lastName: "Garrison", age: 41)

print(actualMe.firstName, actualMe.age)

//Class, best used for mutable objects

class RealMe {
    var realFirstName: String
    var realMiddleName: String?
    var realLastName: String
    var realAge: Int
    
    init(realFirstName: String,
         realMiddleName: String?,
         realLastName: String,
         realAge: Int)
    {
        self.realFirstName = realFirstName
        self.realMiddleName = realMiddleName
        self.realLastName = realLastName
        self.realAge = realAge
    }
}

let thisIsMe = RealMe(realFirstName: "realBen", realMiddleName: "realJarod", realLastName: "realGarrison", realAge: 41)

print("realMe: \(thisIsMe.realLastName)")

//convenience initializers -> can create another init inside class. forego middle name in example below


class SuperRealMe {
    var superRealFirstName: String
    var superRealMiddleName: String?
    var superRealLastName: String
    var superRealAge: Int
    
    init(superRealFirstName: String,
         superRealMiddleName: String?,
         superRealLastName: String,
         superRealAge: Int)
    {
        self.superRealFirstName = superRealFirstName
        self.superRealMiddleName = superRealMiddleName
        self.superRealLastName = superRealLastName
        self.superRealAge = superRealAge
    }
    
    convenience init(superRealFirstName: String,
                     superRealLastName: String,
                     superRealAge: Int
    )
    {
        self.init(superRealFirstName: superRealFirstName,
                  superRealMiddleName: nil,
                  superRealLastName: superRealLastName,
                  superRealAge: superRealAge)
    }
}

let hyperRealMe = SuperRealMe(superRealFirstName: "hyperBen", superRealLastName: "hyperGarrison", superRealAge: 41)

print("hyperRealMe: \(hyperRealMe.superRealLastName)")

//mutable class properties: just use var instead of let inside/outside class

//class inheritance -> add favorite show to existing class:

class Ben: SuperRealMe {
    var favoriteShow: String
    
    init(favoriteShow: String){
        self.favoriteShow = favoriteShow
        super.init(superRealFirstName: "",
                   superRealMiddleName: "",
                   superRealLastName: "",
                   superRealAge: 41)
    }
}

var iAmBen = Ben.init(favoriteShow: "has not been decided")

print("Ben' favorite show: \(iAmBen.favoriteShow)")

let classTestInt = 101

if classTestInt == 100 {
    iAmBen.favoriteShow = "Bob's Burgers"
} else {
    iAmBen.favoriteShow = "something else"
}

print(iAmBen.favoriteShow)


//MARK: protocols

//getters and setters are used in protocols -> get and set = readable/writeable, set = readable
// protocols themselves become Types, which can then be used like generic types
//note: protocols can be extended
//sometimes need to add "mutating" to func in order to implement setters

//MARK: clean up syntax later!!

protocol ProtocolBen {
    var protocolFirstName: String {get set}
    var protocolLastName: String {get set}
    var protocolAge: Int {get set}
    mutating func changeAge()
}

struct StudentBen: ProtocolBen {
    var protocolFirstName: String
    var protocolAge: Int
    var protocolLastName: String
    var protocolCourse: String
    
    mutating func changeAge() {
        protocolAge += 1
    }
}

class TeacherBen: ProtocolBen {
    var protocolFirstName: String
    var protocolAge: Int
    var protocolLastName: String
    
    init(protocolFirstName: String,
         protocolAge: Int,
         protocolLastName: String)
    {
        self.protocolFirstName = protocolFirstName
        self.protocolAge = protocolAge
        self.protocolLastName = protocolLastName
    }
    func changeAge() {
        protocolAge += 2
    }
}

var benStudent = StudentBen(protocolFirstName: "Ben", protocolAge: 41, protocolLastName: "Garrison", protocolCourse: "CompSci")

var benTeacher = TeacherBen(protocolFirstName: "Benjamin", protocolAge: 41, protocolLastName: "Garrison")

benTeacher.protocolFirstName = "Benji"

func fullName(forProtocolBen protocolBen: ProtocolBen) -> String {
    return "\(protocolBen.protocolFirstName) \(protocolBen.protocolLastName)"
}

print(fullName(forProtocolBen: benStudent))
print(fullName(forProtocolBen: benTeacher))

//generic function

func genericFullName<T: ProtocolBen>(forSecondProtocolBen secondProtocolBen: T) -> String {
    return "\(secondProtocolBen.protocolFirstName) \(secondProtocolBen.protocolLastName)"
}

print(genericFullName(forSecondProtocolBen: benStudent))
print(genericFullName(forSecondProtocolBen: benTeacher))

benTeacher.changeAge()
benStudent.changeAge()

print(benTeacher.protocolAge, benStudent.protocolAge)



//MARK: closures AKA lambdas, blocks -> are a Type

//style: let closureName: (Parameter 1, Parameter 2) -> ReturnType
// used for short blocks of reusable code, especially if reused often

let joinStrings: (String, String) -> String = {(leftHandString, rightHandString) in
    return leftHandString + rightHandString
}

//using Swift auto-naming conventions (using indexes of unnamed items in the list of "String, String"):

let automaticJoinStrings: (String, String) -> String = {
    return $0 + $1 //even use of "return is optional here"
}

let ultraSimpleJoinStrings: (String, String) -> String = {$0 + $1}

let megaUltraSimpleJoinStrings: (String, String) -> String = (+) //state operator in parantheses; no funcion, so no need for curly braces

//closure that returns nothing (Void), and performs a range-based For loop:

func basicForLoop(numberOfLoops: Int, closure: () -> Void) {
    for _ in 0..<numberOfLoops {
        closure()
    }
}

basicForLoop(numberOfLoops: 5, closure: {
    print("looping all day")
})

//note: if using a closure in a function, make it the last argument

//simple form:
basicForLoop(numberOfLoops: 5) {print("still looping")}

//function with predefined for loop

func fixedBasicLoop(closure: () -> Void) {
    for _ in 0..<3 {
        closure()
    }
}

fixedBasicLoop {print("fixed number looping")}

//capturing a value in a closure:

let closureCapture = "you've been caught!"

basicForLoop(numberOfLoops: 3) {
    print(closureCapture)
}

//modifying a variable

var modifiedClosureCapture = "oh, really?"

basicForLoop(numberOfLoops: 2) {
    print(modifiedClosureCapture)
    modifiedClosureCapture = "yes, really"
}

//the above variable has been fully modified by the internal argument in the closure, much like an inout function. Proof:

print(modifiedClosureCapture)

//closures are bult into the native Swift library, to simplify things.

//example of looping through an array using a "forEach closure". works for all collection types

let closureArray = [3,2,1,4]

closureArray.forEach{print($0)}

let sortedArray = closureArray.sorted {$0 < $1}

print(sortedArray)

//using enum to loop through weekdays:

enum weekDays: Int {
    case Sunday = 0, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
}

protocol typeOfWeekDay {
    var isTheWeekend: Bool {get}
    var isAWeekDay: Bool {get}
}

extension weekDays: typeOfWeekDay {
    var isTheWeekend: Bool {
        switch self {
        case .Sunday, .Saturday:
            return true
        default:
            return false
        }
    }
    
    var isAWeekDay: Bool {
        return !isTheWeekend
    }
}

print(weekDays.Monday.isTheWeekend)
print(weekDays.Monday.isAWeekDay)


extension weekDays {
    var dayAfter: weekDays {
       return weekDays(rawValue: (rawValue + 1) % 7)!
    }
}

print(weekDays.Sunday.dayAfter)


//MARK: ALGO AND DATA STRUCTURE INTERVIEW QUESTIONS!:

/* Cyclical array rotation

 For example, given
 
 A = [3, 8, 9, 7, 6]
K = 3
 
 the function should return: [9, 7, 6, 3, 8] (three rotations)
*/

//MARK: brute force O(n)2:

func rotateArrayFinal(A: [Int], K: Int) -> [Int] {
    var result = A
    
    for _ in 1...K {
        result = rotateArrayOnce(A: result)
    }
    
    return result
}

var arrayA = [3, 8, 9, 7, 6]
let numberOfTimes = 3

func rotateArrayOnce(A: [Int]) -> [Int] {

    var newArray = Array<Int>(repeating: 0, count: A.count)
    
    for i in 0..<A.count - 1 {
        newArray[i + 1] = A[i]
    }
    newArray[0] = A.last!
    
    return newArray
}

var finalResult = rotateArrayFinal(A: [1, 2, 3, 4, 5], K: 3)

print(finalResult)

//MARK: TODO -> reverse this algo

//phone number array:

/*
 reformat string with numbers and spaces to have dashes every three characters. end of string can be 2 characters i.e. "-xx"
 */
 
func phoneNumberSolution(phoneString: String) -> String {
     
    let originalPhoneString = phoneString
    
    var newPhoneArray =  Array<Character>()
    
    for letter in originalPhoneString {
        if letter == "1" || letter == "2" || letter == "3" || letter == "4" || letter == "5" || letter == "6" || letter == "7" || letter == "8" || letter == "9" || letter == "0" {
            newPhoneArray.append(letter)
        }
    }
    for (i, _) in zip(newPhoneArray.indices, newPhoneArray){
        if i % 3 == 0 && i != 0 {
            newPhoneArray.insert("-", at: i)
        }
    }

    
    
    let phoneStringSolution = String(newPhoneArray)
    return phoneStringSolution
}

var firstPhoneNumber = "123  b  456789 10 11"
var secondPhoneNumber = "1234567899012"
var thirdPhoneNumber = "1--2 345-  6789 - 1013"

print(phoneNumberSolution(phoneString: firstPhoneNumber))
print(phoneNumberSolution(phoneString: secondPhoneNumber))
print(phoneNumberSolution(phoneString: thirdPhoneNumber))
