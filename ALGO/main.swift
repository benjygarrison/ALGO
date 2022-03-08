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

//print(minStack)
