//
//  7：用两个栈实现队列.swift
//  Offer
//
//  Created by 阳君 on 2017/3/23.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead,
// 分别完成在队列尾部插入结点和在队列头部删除结点的功能。

import Foundation

class Stack<Element>: NSObject {
    
    private var array = Array<Element>()
    
    func size() -> Int {
        return self.array.count
    }
    
    func push(_ k: Element) {
        self.array.append(k)
    }
    
    func pop() -> Element? {
        guard self.size() != 0 else {
            return nil
        }
        return self.array.removeLast()
    }
    
}

class Queue<Element>: NSObject {
    
    private let popStack = Stack<Element>()
    private let pushStack = Stack<Element>()
    
    func appendTail(_ k: Element) {
        self.push(popStack: popStack, toPushStack: pushStack)
        self.pushStack.push(k)
    }
    
    func deleteHead() -> Element? {
        self.push(popStack: pushStack, toPushStack: popStack)
        return self.popStack.pop()
    }
    
    private func push(popStack: Stack<Element>, toPushStack pushStack: Stack<Element>) {
        while popStack.size() != 0 {
            pushStack.push(popStack.pop()!)
        }
    }
    
}


let queue = Queue<String>()
queue.appendTail("a")
queue.appendTail("b")
queue.appendTail("c")
print("\(queue.deleteHead())")
print("\(queue.deleteHead())")
queue.appendTail("d")
print("\(queue.deleteHead())")
print("\(queue.deleteHead())")
print("\(queue.deleteHead())")


