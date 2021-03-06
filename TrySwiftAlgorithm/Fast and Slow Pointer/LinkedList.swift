//
//  LinkedList.swift
//  TrySwiftAlgorithm
//
//  Created by BaekSungwook on 2/16/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation

class LLNode<T: Comparable> {
    var key: T?
    var next: LLNode<T>?
    var prev: LLNode<T>?
    
    init() {
        
    }
    convenience init(element key: T) {
        self.init()
        self.key = key
    }
}

func hasCycle<T: Comparable>(head: LLNode<T>) -> Bool {
    guard head.key != nil else {
        return false
    }
    var slow: LLNode<T>? = head
    var fast: LLNode<T>? = head
    var hasCycle = false
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
        if slow === fast {
            hasCycle = true
            break
        }
    }
    return hasCycle
}

func findCycleLength<T: Comparable>(head: LLNode<T>) -> Int {
    guard head.key != nil else {
        return 0
    }
    var slow: LLNode<T>? = head
    var fast: LLNode<T>? = head
    var cycleCount = 0
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
        if slow === fast {
            let cycleStart = slow
            slow = slow?.next
            cycleCount = 1
            while cycleStart !== slow {
                slow = slow?.next
                cycleCount += 1
            }
            break
        }
    }
    return cycleCount
}

func findCycleStartNode<T: Comparable>(head: LLNode<T>) -> LLNode<T>? {
    guard head.key != nil else {
        return nil
    }
    var startCycleNode: LLNode<T>? = head
    var slow: LLNode<T>? = head
    var fast: LLNode<T>? = head
    var cycleCount = 0
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
        if slow === fast {
            cycleCount = findCycleLength(head: head)
            var startNode: LLNode<T>? = head
            while cycleCount > 0 {
                startCycleNode = startCycleNode?.next
                cycleCount -= 1
            }
            while startNode !== startCycleNode {
                startNode = startNode?.next
                startCycleNode = startCycleNode?.next
            }
            break
        }
    }
    return startCycleNode
}

func middleNode<T: Comparable>(head: LLNode<T>) -> LLNode<T>? {
    guard head.key != nil else {
        return nil
    }
    var slow: LLNode<T>? = head
    var fast: LLNode<T>? = head
    //fast is always twice the nodes ahead of the slow pointer
    while fast != nil, fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    return slow
}

class LinkedList<T: Comparable> {
    private var head = LLNode<T>()
    var count: Int {
        if head.key == nil {
            return 0
        }
        else {
            var current = head
            var counter: Int = 1
            while current.next != nil {
                current = current.next!
                counter += 1
            }
            return counter
        }
    }
    
    func append(element key: T) {
        guard head.key != nil else {
            head.key = key
            return
        }
        var current: LLNode<T>? = head
        while current != nil {
            if current?.next == nil {
                let elementNode = LLNode<T>()
                elementNode.key = key
                elementNode.prev = current
                current?.next = elementNode
                break
            }
            else {
                current = current?.next!
            }
        }
    }
    
    func remove(at index: Int) {
        guard index > 0 || index < count - 1 || head.key != nil else {
            return
        }
        var current: LLNode<T>? = head
        var trail: LLNode<T>?
        var listIndex = 0
        
        if index == 0 {
            current = current?.next
            head = current!
            return
        }
        while current != nil {
            if listIndex == index {
                trail?.next = current?.next
                current = nil
                break
            }
            trail = current
            current = current?.next
            listIndex += 1
        }
    }
    
    func hasCycle() -> Bool {
        return false
    }
    
    func printAllKeys() {
        var current: LLNode<T>? = head
        while current != nil {
            print("link item is: \(current!.key!)")
            current = current?.next
        }
    }
}

