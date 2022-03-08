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


//MARK: Question 3: URLify
//-Replace all blank space with ASCII symbol %20

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
        finalURLArray.append(char)
    }
    
    return String(finalURLArray)
}

print(urlify("My Home Page    ", length: 50))
print(urlify("My Home Page    ", length: 75))
print(urlify("My Home Page    ", length: 100))
