//
//  main.swift
//  ALGO
//
//  Created by Ben Garrison on 11/28/21.
//

import Foundation

//MARK: Question One: Unique Characters
//-Given a string, see if you can detect whether it contains unique characters

func isUnique(_ text: String) -> Bool {
    let charArray = Array(text)
    var uniqueCharCounter = [Character:Bool]()
    
    for char in charArray {
        if uniqueCharCounter[char] != nil {
            return false
        }
        uniqueCharCounter[char] = true
    }
    return true
}
print(isUnique("abc"))
print(isUnique("abcdefhjkloiuy"))
print(isUnique("abcccccc"))
print(isUnique("abcdeghijklmnopp"))
print("")



//MARK: Question 2: Permutations
//-Given two strings, check if one is a permutation of the other

func isPermutated(_ text: String, _ perm: String) -> Bool {
    if text.count != perm.count {
        return false
    }
    
    return text.sorted() == perm.sorted()
}

print(isPermutated("abd", "dab"))
print(isPermutated("doggy", "godgy"))
print(isPermutated("kiwi", "apple"))
print("")


//MARK: Question 3: URLify
//-Replace all blank space with ASCII symbol %20

//MY  SOLUTION

func urlify(_ url: String, length: Int) -> String {
    let originalURLString = url
    
    var finalURLString = originalURLString.replacingOccurrences(of: " ", with: "%20")
    var finalURLArray = [Character]()
    
    for _ in finalURLString {
        if finalURLString.count < length {
            finalURLString.append("%20")
        }
    }
    
    for char in finalURLString {
        if finalURLArray.count < length {
        finalURLArray.append(char)
        }
    }
    
    return String(finalURLArray)
}

print(urlify("My Home Page   ", length: 100))
print(String(repeating: "a", count: 100))
print(urlify("My Home Page            ", length: 75))
print(String(repeating: "a", count: 75))
print(urlify("My Home Page     ", length: 50))
print(String(repeating: "a", count: 50))
print("")


//Course Solution (doesn't work?)

func urlify2(_ url: String, length: Int) -> String {
    var result = Array<Character>(repeating: " ", count: length)
    
    let url = url.trimmingCharacters(in: .whitespacesAndNewlines)
    
    let urlChars = Array(url)
    
    var pointer = 0
    
    for i in 0..<urlChars.count {
        if urlChars[i] != " " {
            result[pointer] = urlChars[i]
            pointer += 1
        } else {
            result[pointer] = "%"
            result[pointer] = "2"
            result[pointer] = "0"
            pointer = pointer + 3
        }
    }
    
    return String(result)
}

//print(urlify2("My Home Page   ", length: 100))
//print(String(repeating: "a", count: 100))
//print(urlify2("My Home Page            ", length: 75))
//print(String(repeating: "a", count: 75))
//print(urlify2("My Home Page     ", length: 50))
//print(String(repeating: "a", count: 50))



//MARK: Question 4: One away
//Given 2 strings, write a function to see if they are more than one or 0 edits away
//edits include inserting, removing, or replacing a character

func oneAway(_ first: String, _ second: String) -> Bool {
    var i = 0
    var j = 0
    
    let firstStringChars = Array(first)
    let secondStringChars = Array(second)
    
    if first.count - second.count > 1 || second.count - first.count > 1 {
        return false
    } else {
        while i < first.count && j < second.count {
            if firstStringChars[i] != secondStringChars[j] {
                if i != j {
                    return false
                }
                j += 1
            } else {
                i += 1
                j += 1
            }
        }
    }
    
    return true
}

print(oneAway("ben", "bean"))
print(oneAway("ben", "beanie baby"))
print(oneAway("ben", "be"))
print(oneAway("ben", "ben"))
print(oneAway("ben", "bonjour"))
