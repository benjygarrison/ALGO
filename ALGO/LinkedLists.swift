//
//  LinkedLists.swift
//  ALGO
//
//  Created by Ben Garrison on 1/2/22.
//

import Foundation

//MARK: Linked List algos:

/*
 linked lists are super fast at loading to the front and take up little space (shrink and grow dynamically), compared to arrays
 
 used in stacks and queues
 
 O(1) vs array O(n)!
 
 disadvantage: no random access, get/set = O(n)
 
 like a train [(Head)|"A"]--[(Node(s))|"Linked"]--[(Tail)|"List"]--> nil
 */

//MARK: know for interview!!

/*
 Anything on the front = O(1)
    - addFront/getFirst/deleteFirst
 
 If you have to walk = O(n)
    - addBack/getBack/deleteLast
 
 Always the right size
 
 No random access
 */


//sample code:

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedListSample {
    private var head: Node?
    
    func addFront(_ data: Int) {
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }
    
    func getFirst() -> Int? {
        if head == nil {
            return nil
        }
        return head!.data
    }
    
    func addBack(_ data: Int) {   // "while" loops --> O(n)
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head!
        while(node.next != nil) {
            node = node.next!
        }
        node.next = newNode
    }
    
    func getLast() -> Int? {

        if head == nil {
            return nil
        }
        
        var node = head!
        while(node.next != nil) {
            node = node.next!
        }
        
        return node.data
        
    }
    
    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
        
        let newNode = Node(data)
        var currentNode = head
        
        for _ in 0..<position - 1 {
            currentNode = currentNode?.next!
        }
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
    
    func deleteFirst() {
        head = head?.next
    }
    
    func deleteLast() {
        var nextNode = head
        var previousNode: Node?
        
        while(nextNode?.next != nil) {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nil
    }
    
    func delete(at position: Int) {
        if position == 0 {
            self.deleteFirst()
            return
        }
        
        var nextNode = head
        var previousNode: Node?
        for _ in 0..<position {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nextNode?.next
    }
    
    var isEmpty: Bool {
        if head != nil {
        return false
        } else {
            return true
        }
    }
    
    func clear() {
        head = nil
    }

    func printLinkedList() {
        if head == nil { return }
    
        var result = [Int]()
        var node = head
        result.append(node!.data)
    
        while node?.next != nil {
            result.append(node!.next!.data)
            node = node?.next
        }
     
        print(result)
        
    }
}


let linkedListSample = LinkedListSample()

linkedListSample.addFront(3)
linkedListSample.addFront(2)
linkedListSample.addFront(1)
linkedListSample.addFront(4)

linkedListSample.printLinkedList()

linkedListSample.addBack(5)

linkedListSample.insert(position: 3, data: 6)
 
linkedListSample.printLinkedList()

print(linkedListSample.getFirst()!)
print(linkedListSample.getLast()!)

linkedListSample.printLinkedList()

linkedListSample.deleteFirst()
linkedListSample.deleteLast()
linkedListSample.delete(at: 2)

linkedListSample.printLinkedList()

print("List is empty = \(linkedListSample.isEmpty)")

linkedListSample.clear()

print("List is empty = \(linkedListSample.isEmpty)")


//MARK: linked list algos:

//Question 1: write a funtion to return length of any linked list

//MARK: My solution

class TestNode {
    var data: Int
    var next: TestNode?
    
    init(_ data: Int, _ next: TestNode? = nil) {
        self.data = data
        self.next = next
    }
}

func listLength(_ head: TestNode?) -> Int {
    if head == nil {
        return 0
    }
    
    var length = [Int]()
    
    var node = head
    while(node?.next != nil) {
        length.append(node!.next!.data)
        node = node?.next!
    }
    
    
    return length.count + 1
}

func otherGuysListLength(_ head: TestNode?) -> Int {
    if head == nil {
        return 0
    }
    
    var length = 0
    var current = head
    
    while current != nil {
        length += 1
        current = current?.next
    }
    
    return length
}

//Note: this is wasteful (O(n)) in real world. Just add a size function that tracks list length at all times, as it grows/shrinks, and call that size function


/*
 MARK: Question 2: Merge 2 linked lists.
 Given pointers to the head nodes of 2 linked lists that merge together at some point, find the node where the two lists merge. The merge point is where both lists point to the same node, i.e. they reference the same memory location. It is guaranteed that the 2 nodes will be different, and neither will ne NULL. If the lists share a common node, return that node's value.
 After the merge point, both lists will share the same node pointers.
 
 MARK: visualize by imagining 2 train lines, and the first section at which they overlap, i.e. MacArthur Station for Richmond/Pittsburg lines
 
 */

//Brute force O(n^2):
func findMergeFirstSolution(headA: TestNode?, headB: TestNode?) -> Int? { // O(m*n) -> O(n^2)
    let lengthA = otherGuysListLength(headA) // O(m)
    let lengthB = otherGuysListLength(headB) // O(n)
    
    var currentLengthA = headA
    
    for _ in 0...lengthA-1 { //O(m)
        var currentLengthB = headB
        for _ in 0...lengthB-1 { //O(n)
        let A = currentLengthA?.data
        let B = currentLengthB?.data
        //print("A: \(A ?? 0) B: \(B ?? 0)")
            if A == B {
                return A
            }
        currentLengthB = currentLengthB?.next
        }
        currentLengthA = currentLengthA?.next
    }
    return nil
}

//Trade time for space using a Dictionary:

func findMergeSecondSolution(headA: TestNode?, headB: TestNode?) -> Int? { //reduces to O(n)
    let lengthA = otherGuysListLength(headA) // O(m)
    let lengthB = otherGuysListLength(headB) // O(n)
    
    var dictionary = [Int?: Bool]()
    var currentB = headB
    
    for _ in 0...lengthB-1 { // O(n)
        let B = currentB?.data
        dictionary[B] = true
        currentB = currentB?.next
    }
    
    var currentA = headA
    
    for _ in 0...lengthA-1 { // O(m)
        let A = currentA?.data
        if dictionary[A] == true {
            return A
        }
        currentA = currentA?.next
    }
    return nil
}

func findMergeThirdSolution(headA: TestNode?, headB: TestNode?) -> Int? { // O(n)
    let lengthA = otherGuysListLength(headA)
    let lengthB = otherGuysListLength(headB)
    
    var currentA = headA
    var currentB = headB
    
    if lengthB > lengthA { //swap variables if lengthB is longer
        let temp = currentA
        currentA = currentB
        currentB = temp
    }
    
    let difference = abs(lengthA - lengthB) //could return negative, so make it absolute -> "abs()"
    
    for _ in 1...difference {
        currentA = currentA?.next
    }
    
    for _ in 0...lengthB-1 {
        let A = currentA?.data
        let B = currentB?.data
        if  A == B {
            return A
        }
        currentA = currentA?.next
        currentB = currentB?.next
    }
    
    return nil
}


let testNode6 = TestNode(6)
let testNode5 = TestNode(5, testNode6)
let testNode4 = TestNode(4, testNode5)
let testNode3 = TestNode(3, testNode4)
let testNode2 = TestNode(2, testNode3)
let testNode1 = TestNode(1, testNode2)

let testNode11 = TestNode(11, testNode4)
let testNode10 = TestNode(10, testNode11)

//Functions for first question:

print("First Linked List functions:")
print(listLength(testNode1))
print(otherGuysListLength(testNode1))
print(listLength(nil))

//Functions for second question:
print("Second Linked List functions:")

print(findMergeFirstSolution(headA: testNode1, headB: testNode10) ?? 0)
print(findMergeSecondSolution(headA: testNode1, headB: testNode10) ?? 0)
print(findMergeThirdSolution(headA: testNode10, headB: testNode1) ?? 0)


//MARK: question 3 detect a cycle
/*
 
 https://www.hackerrank.com/challenges/ctci-linked-list-cycle/problem
 https://en.wikipedia.org/wiki/Cycle_detection#Floyd's_Tortoise_and_Hare
 
 A linked list is said to contain a cycle if any node is visited more than once while traversing the list. For example, in the following graph, there is a cycle formed when node 5 points back to node 3.
        4
      /   \
 1 2 3     5
     \_____/
 
        ^
        |
(This is bad, as it leaks memory when 5 and 3 keep pointing at each other indefinitely.)
 
*/

class CycleNode {
    var data: Int
    weak var next: CycleNode?
    
    init(_ data: Int, _ next: CycleNode? = nil) {
        self.data = data
        self.next = next
    }
}


func hasCycle(first: CycleNode) -> Bool {
    var slow: CycleNode? = first //tortoise
    var fast: CycleNode? = first //hare
    
    while fast != nil && fast!.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow?.data == fast?.data {
            return true
        }
    }
    
    
    return false
}


let cycleNode5 = CycleNode(5)
let cycleNode4 = CycleNode(4)
let cycleNode3 = CycleNode(3)
let cycleNode2 = CycleNode(2)
let cycleHead = CycleNode(1)

cycleHead.next = cycleNode2
cycleNode2.next = cycleNode3
cycleNode3.next = cycleNode4
cycleNode4.next = cycleNode5
cycleNode5.next = cycleNode3

print("Third Link List functions:")
print(hasCycle(first: cycleHead))
