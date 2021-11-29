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

for i in 0...5 {
    print(i)
}

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



