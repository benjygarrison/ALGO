//
//  main.swift
//  ALGO
//
//  Created by Ben Garrison on 11/28/21.
//

import Foundation

//MARK: Favor building old-school arrays in interviews, but understand principles behind making stack/queues

print("Stacks:")

/*
 Stacks are literally "stacked."
 
 Follow principle of "last in, first out (LIFO)." Just like a stack of books: the tope book is the last book stacked, but the first removed. You "push" items onto a stack, and "pop" them off of it. Appending to an array or removing the last element would be push/pop operations (O(1)), as would adding to/removing from the head of a linked list.
 ex: forward/back in browser, undo/redo in word processing software
 */

//MARK: Create as a class (allows you to pass by reference):
class Stack<T> {
    private var array: [T] = []
    
    func push(_ item: T) {
        array.append(item)
    }
    
    func pop() -> T? {
        array.popLast()
    }
    
    func peek() -> T? {
        array.last
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var count: Int {
        array.count
    }
}

//MARK: Create as a struct (internal structure is mutated):
struct StackStruct<T> {
    fileprivate var array = [T]()
    
    mutating func push(_ item: T) {
        array.append(item)
    }
    
    mutating func pop() -> T? {
        array.popLast()
    }
    
    var peek: T? {
        array.last
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var count: Int {
        array.count
    }
}

//MARK: ----------------------------------------------------------

print("Queues:")

/*
 Queues line up just like real-world queues, and are "first in, first out (FIFO)." Whatever enters the queue first gets out first. You "enqueue" and "dequeue" items in a queue. An array can be enqueued by adding to the end (O(1)) and dequeuing from the front (O(n)), moving everything one space forward. The opposite applies to linked lists (add front, remove back).
 ex: printer queues, input processing
 */

class Queue<T> {
    private var array: [T] = []
    
    func enqueue(_ item: T) {
        array.append(item)
    }
    
    func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    func peek() -> T? {
        return array.first
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var count: Int {
        array.count
    }
}



//MARK: Questions:

/*
 Question 1: Cyclic Rotation
 
 Same as first array question:  rotate the array K times, but using a queue to do so.
 
 */

func solutionQueueRight(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else {
        return []
    }
    guard K > 0 else {
        return A
    }
    
    var result = A
    
    //treat like a queue that is enqueuing and dequeuing off the end
    for _ in 1...K {
        let last = result.last!
        result.insert(last, at: 0)
        result.remove(at: A.count)
    }
    
    return result
}

//Answers for first question
print("Rotating to the right K times [1, 2, 3, 4, 5]:")
print(solutionQueueRight(A: [1, 2, 3, 4, 5], K: 1))
print(solutionQueueRight(A: [1, 2, 3, 4, 5], K: 2))
print(solutionQueueRight(A: [1, 2, 3, 4, 5], K: 3))

//Question 2: Rotate left:

func solutionQueueLeft(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else {
        return []
    }
    guard K > 0 else {
        return A
    }
    
    var result = A
    
    //treat like queuing and dequeuing off the end
    for _ in 1...K {
        
    }
    
    return result
}

