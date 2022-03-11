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
print("")

//MARK: Question 5: Compressor
//Given a string w/repeating characters, compress string to character followed by no. of occurences.
//If not shorter, retrn original string.

func compress(_ str: String) -> String {
    var compressed = ""
    var count = 0
    let charArray = Array(str)
    
    for i in 0..<str.count {
        count += 1
        if i + 1 >= str.count || charArray[i] != charArray[i + 1] { //loop until string ends or new character appears
            compressed.append(charArray[1])
            compressed.append(String(count))
            count = 0
        }
    }
    
    return compressed.count < str.count ? compressed : str //ternary operator
}

print(compress("aaabb"))
print(compress("aabb"))
print(compress("ab"))
print(compress("abc"))
print(compress("zzz"))
print(compress("aabbaabb"))
print("")

//MARK: Question 6: Remove duplicates from linked list

func printLinkedList(_ head: Node?) {
    if head == nil { return }
    
    var node = head
    print(node!.data)
    
    while node?.next != nil {
        print(node!.next!.data)
        node = node?.next
    }
}

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func removeDuplicates(_ head: Node?) {
    
    var uniqueNodes = Set<Int>()
    var previous: Node? = nil
    var current = head
    
    while current != nil {
        if uniqueNodes.contains(current!.data) {
            previous!.next = current!.next
        } else {
            uniqueNodes.insert(current!.data)
            previous = current
        }
        current = current!.next
    }
}

let node3 = Node(3)
let node2 = Node(2, node3)
let node1 = Node(1, node2)
node3.next = Node(1)
printLinkedList(node1)
print("----")
print(removeDuplicates(node1) as Any)
printLinkedList(node1)
print("")

//MARK: Question 7: Sub-trees
//determine if a smaller tree is a subtree of a larger tree

class TreeNode {
    var key: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ data: Int) {
        self.key = data
    }
}

func getOrder(_ root: TreeNode) -> String {
    var result = ""
    preOrderTraversal(root, &result)
    return result
}

func preOrderTraversal(_ node: TreeNode?, _ result: inout String) {
    guard let node = node else {
        return
    }
    result.append(String(node.key)) // root
    preOrderTraversal(node.left, &result)
    preOrderTraversal(node.right, &result)
}

let root = TreeNode(5)
root.left = TreeNode(3)
root.right = TreeNode(7)
root.left?.left = TreeNode(2)
root.left?.right = TreeNode(4)
root.right?.left = TreeNode(6)
root.right?.right = TreeNode(8)

let subTree = TreeNode(7)
subTree.left = TreeNode(6)
subTree.right = TreeNode(9)

func isSubTree(tree: TreeNode, _ subTree: TreeNode) -> Bool {
    let orderedRoot = getOrder(root)
    let orderedSubTree =  getOrder(subTree)
    
    return orderedRoot.contains(orderedSubTree)
}

print(isSubTree(tree: root, subTree))
print("")

//MARK: Question 8: Min Stack
//Design a stack which, in addition to push/pop, has a function 'min' that returns the minimum element.
//push, pop, and min should all be O(1)

//NOTE: see video for linked list solution!

struct Stack {
    private var items: [Int] = []
    private var minItem: [Int] = []
    
    mutating func pop() {
        let popItem = items.popLast()
        if let poppedElement = popItem, let minElementPop = minItem.last {
            if poppedElement == minElementPop {
                minItem.popLast()
            }
        }
    }
    
    mutating func push(_ item: Int) {
        items.append(item)
        if minItem.count == 0 {
            minItem.append(item)
        } else {
            if let minElement = minItem.last, let lastElement = items.last {
            if lastElement <= minElement {
            minItem.append(lastElement)
                print(minItem)
                }
            }
        }
        
    }
    
    mutating func min() -> Int? {
        
        return minItem.last
    }
}

var minStack = Stack()

minStack.push(9)
minStack.push(4)
minStack.push(7)
minStack.push(5)
minStack.push(8)
minStack.push(3)

print(minStack)

minStack.pop()
minStack.pop()
minStack.pop()

print(minStack.min() as Any)
print("")


//MARK: "Greatest hits"

//MARK: FizzBuzz
//Make a program that prints 1 to 100...
//For muliples of 3, print Fizz instead of #, and for multiples of 5, print "Buzz"
//For multiples of 5 AND 3, print FizzBuzz

func fizzBuzz() {
    
    for i in 1...100 {
        if i % 3 == 0 && i % 5 == 0 {
            print("FizzBuzz")
        } else if i % 5 == 0 {
            print("Buzz")
        } else if i % 3 == 0 {
            print("Fizz")
        } else {
        print(i)
        }
    }
    
}

fizzBuzz()

//MARK: Palindromes

//Built-in way
func isPalidrome(_ text: String) -> Bool {
    
    let textReversed = String(text.reversed())
    
    if textReversed == text {
        return true
    } else {
        return false
    }
}
    
//Demonstrable way
func isPalidromeTwo(_ text: String) -> Bool {
    let chars = Array(text)
    let length = chars.count
    
    for i in 0..<length / 2 { // just walk half the array and compare against end - 1
        if chars[i] != chars[length - i - 1] {
         return false
        }
    }
    
    return true
}


print(isPalidrome("mom"))
print(isPalidrome("kiwi"))
print(isPalidrome("bad"))
print(isPalidrome("egadabasetonedenotesabadage"))
print("------")
print(isPalidromeTwo("mom"))
print(isPalidromeTwo("kiwi"))
print(isPalidromeTwo("bad"))
print(isPalidromeTwo("egadabasetonedenotesabadage"))
print("")

//MARK: Ransom Note
//can a ransom note(1) be writtes from a "magazine" containing letters(2)

func ransomNote(note: String, letters: String) -> Bool {
    
    let noteMap = map(note.replacingOccurrences(of: " ", with: ""))
    let letterMap = map(letters.replacingOccurrences(of: " ", with: ""))
    
    //Compare  (loop through dictionary syntax [ note: "_" represents "value"; not needed in this case])
    for (key, _) in noteMap {
        if letterMap[key] == nil {
            return false
        }
        if noteMap[key]! > letterMap[key]! {
            return false
        }
    }
    return true
}

func map(_ text: String) -> [Character:Int] {
    var map = [Character:Int]()
    let chars = Array(text)
    
    for char in chars {
        if map[char] != nil {
            map[char] = map[char]! + 1
        } else {
            map[char] = 1
        }
    }
    return map
}

print(ransomNote(note: "Pay", letters: "yaP"))
print(ransomNote(note: "Pay", letters: "yaP a"))
print(ransomNote(note: "Pay me 1000$", letters: "yaPem0001$"))
print(ransomNote(note: "Pay", letters: "Pa"))


//MARK: Ceaser Cipher
//Basic encryption algo: take all letters in a message and shift them by a fixed amount
//NOTE DIRECTION OF SHIFT. encrypt or decrypt math based on shift direction

class CeaserCipher {
    
    let Alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    func encrypt(_ plainText: String, _ n: Int = 3) -> String {
        var result = ""
        let charsToEncrypt = Array(plainText)
        let lookupMap = Array(Alphabet)
        
        for char in charsToEncrypt {
            var encryptedChar: Character = " "
            if char != " " {
                let x = lookupMap.firstIndex(of: char)!
                let key = (n + x) % 26
                encryptedChar = lookupMap[key]
            }
            result.append(encryptedChar)
        }
        return result
    }
    
    func decrypt(_ plainText: String, _ n: Int = 3) -> String {
        var result = ""
        let charsToEncrypt = Array(plainText)
        let lookupMap = Array(Alphabet)
        
        for char in charsToEncrypt {
            var decryptedChar: Character = " "
            if char != " " {
                let x = lookupMap.firstIndex(of: char)!
                let key = (n - x) % 26
                decryptedChar = lookupMap[key]
            }
            result.append(decryptedChar)
        }
        return result
    }
    
}

let ceaserCipher = CeaserCipher()

print(ceaserCipher.encrypt("ABC"))
print(ceaserCipher.encrypt("BE SURE TO DRINK YOUR OVALTINE"))
print(ceaserCipher.encrypt("GOOD TIMES"))
print("")
      
//MARK: String Reversal

func reverse(_ text: String) -> String {
    var chars = Array(text)
    
    var left = 0
    var right = text.count - 1
    
    //loop through and swap until hit middle
    for _ in 0..<text.count / 2 {
        let tempChar = chars[left]
        chars[left] = chars[right]
        chars[right] = tempChar
        left += 1
        right -= 1
    }
    
    
    return String(chars)
}

print(reverse("Benjamin"))
print(reverse("nimajneB"))
print("")


//MARK: Integer Reversal (REVISIT THIS!)
//Note: handle negative integers by keeping dash in place

func reverseInt(_ x: Int) -> Int {
   var x = x
   let isNegative = x < 0
    
    if isNegative {
        x = abs(x)
    }
    
    var reverse = 0
    var lastDigit = 0
    
    while x >= 1 {
        lastDigit = x % 10
        reverse = reverse * 10 + lastDigit
        x = x / 10
    }
    
    return isNegative ? reverse * -1 : reverse
}

print(reverseInt(123))
print(reverseInt(-123))
print("")

//MARK: Anagram

func isAnagram (_ text: String, _ anagram: String) -> Bool {
    
    if text.count != anagram.count { return false }
    
    let text = Array(text).sorted()
    let anagram = Array(anagram).sorted()
    
    if text == anagram { return true }
    
    return false
    
}

print(isAnagram("abc", "cbb"))
print(isAnagram("night", "thing"))
print(isAnagram("bichon", "pug"))


//MARK: LEETCODE

//PALINDROME NUMBER

func isPalindrome(_ x: Int) -> Bool {
    let xString = String(x)
    var chars = Array(xString)
    
    var left = 0
    var right = chars.count - 1
    
    //loop through and swap until hit middle
    for _ in 0..<chars.count / 2 {
        let tempChar = chars[left]
        chars[left] = chars[right]
        chars[right] = tempChar
        left += 1
        right -= 1
    }
    
    if xString != String(chars) {
        return false
    }
    
    return true
}
    

print(isPalindrome(123))
print(isPalindrome(121))
print(isPalindrome(-121))
print("")

//ROMAN TO INTEGER

func romanToInt(_ s: String) -> Int {
    
    var output = 0
    var inputString = s
    let romanNumeral: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    let exception: [String: Int] = ["IV": 4, "IX": 9, "XL": 40, "XC": 90, "CD": 400, "CM": 900]
   
    for (key, value) in exception {
        if inputString.contains(key), let subRange = inputString.range(of: key) {
            output += value
            inputString.removeSubrange(subRange)
        }
    }
    
    for char in inputString {
        if let value = romanNumeral[char] {
            output += value
        }
    }

    return output
    
}

print(romanToInt("III"))
print(romanToInt("LVIII"))
print(romanToInt("MCMXCIV"))

//MERGE SORTED ARRAY

func mergeArrays(_ nums1: [Int], _ m: Int, _ nums2: [Int], _ n: Int) -> [Int] {
    
    var newArray: [Int] = []
    var count = 0
    
    for element in nums1 {
        if count < m {
        newArray.append(element)
           
        }
        count += 1
    }
    
    newArray.append(contentsOf: nums2)
    
    let finalArray = Array(newArray.sorted())
    
    
    
    return finalArray
}

print(mergeArrays([-1,0,0,3,3,3,0,0,0], 6, [1,2,2], 3))


//TWO SUMS

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    //create dictionary oto hold index, element
    var dictionary = [Int: Int]()
      
    //iterate through array
    for (i, element) in nums.enumerated() {
           let difference = target - element
           if let j = dictionary[difference] {
           return [j, i]
       }
       dictionary[element] = i
       }
       return []
}

print(twoSum([1,2,3,4], 6))

//ADD TWO NUMBERS (LINKED LISTS)
//note: no list in this app to pull data from

//func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        var node1 = l1
//        var node2 = l2
//
//        var resultNode = ListNode(0)
//        var head = resultNode
//
//        var carry = 0
//
//        while(node1 != nil || node2 != nil) {
//            var sum = carry
//
//            if(node1 != nil) {
//                sum = sum + node1!.val
//                node1 = node1!.next
//            }
//
//            if(node2 != nil) {
//                sum = sum + node2!.val
//                node2 = node2!.next
//            }
//
//            let remainder = sum % 10
//            carry = sum / 10
//
//            var newNode = ListNode(remainder)
//            resultNode.next = newNode
//            resultNode = resultNode.next!
//        }
//
//        //----
//
//        if(carry != 0) {
//            var newNode = ListNode(carry)
//            resultNode.next = newNode
//            resultNode = resultNode.next!
//        }
//
//        return head.next
//    }

//BUILD ARRAY FROM PERMUTATION
//Sort input array, pop off indices and capture them in second array

func buildArray(_ nums: [Int]) -> [Int] {
    var result = [Int]()
            for value in nums {
                let value = nums[value]
                result.append(value)
            }
            return result
}

print(buildArray([5,0,1,2,3,4]))
print("")

//GET CONCATENATION OF ARRAYS

func getConcatenation(_ nums: [Int]) -> [Int] {
    var nums2 = Array(nums)
    
    for num in nums {
        nums2.append(num)
    }
    
    return nums2
   }

print(getConcatenation([3,2,1,4]))
print("")

//RUNNING SUM OF 1D ARRAY

func runningSum(_ nums: [Int]) -> [Int] {
    var nums2: [Int] = []
    
    for i in 0..<nums.count {
        if i == 0 {
            nums2.append(nums[i])
        } else {
            nums2.append(nums2[i - 1] + nums[i])
        }
    }
    return nums2
}

print(runningSum([3,3,3,3]))
print("")


//REMOVE DUPLICATES
//remove duplicate values from array without adding any space complexity O(1) [no new array structure]

func removeDuplicates(_ nums: [Int]) -> Int {
    if nums.isEmpty {
        return 0
    }
    var nums = Array(nums) //cannot declare in leetcode version (inout function)
    
    var i = 1
    var j = 1
    
    while j < nums.endIndex {
        if nums[j] != nums[i - 1] {
            nums[i] = nums[j]
            i += 1
            j += 1
        } else {
            j += 1
        }
    }
    
    return i
   }

print(removeDuplicates([1,1,2,3,3,3,4,4,4]))
print("")

//REMOVE ELEMENT
//remove specified element in-place

func removeElement(_ nums: [Int], _ val: Int) -> Int {
    if nums.isEmpty { return 0 }
    var nums = Array(nums) //cannot declare in leetcode version (inout function)
    
    nums = nums.filter { (num) in num != val }
               return nums.count
}


print(removeElement([3,2,2,3], 3))
print("")

//SEARCH INSERT POSITION
//return index of value if it exists; if not, return index of where it would be if sorted

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    //beginning and end of array variables
    var start = 0
    var end = (nums.count - 1)
    
    //guard for number larger than array elements
    if target > nums.max()! { start = nums.count}
    if nums.count > 1 {
        if target <= nums[0] { return 0 }
        if target == nums[1] { return 1 }
    }
    
    
    //split the array in half O(log n)
    while start < end {
        let mid = start + ((end - start) / 2)
        if nums[mid] == target {
            return mid
        } else if nums[mid] > target {
            end = mid
        } else {
            start = mid + 1
        }
    }
    
    return start //default
}
print("---")
print(searchInsert([1,3,5,6], 5)) // 2
print(searchInsert([1,3,5,6], 2)) //1
print(searchInsert([1,3,5,6], 7)) // 4
print(searchInsert([1], 2)) // 1
print(searchInsert([1,2,4,6,7,8,9], 3)) //2
print(searchInsert([3,6,7,8,10], 5)) //1

