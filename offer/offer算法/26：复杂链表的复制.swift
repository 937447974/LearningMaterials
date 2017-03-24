//
//  26：复杂链表的复制.swift
//  Offer
//
//  Created by 阳君 on 2017/3/24.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 请实现一个函数复制一个复杂链表。

import Foundation

class ListNode<Element>: NSObject {
    var value: Element?
    var next: ListNode?
    var sibling: ListNode? // 指向任何结点
}

func cloneNode<Element>(node: ListNode<Element>) -> ListNode<Element> {
    var cloneDict = Dictionary<ListNode<Element>, ListNode<Element>>()
    var siblingSet = Set<ListNode<Element>>()
    var rootNode: ListNode<Element>!
    var temp: ListNode? = node
    while temp != nil {
        if temp!.sibling != nil {
            siblingSet.insert(temp!)
        }
        let cloneNode = ListNode<Element>()
        cloneNode.value = temp!.value
        cloneDict[temp!] = cloneNode
        temp = temp!.next
        if rootNode == nil {
            rootNode = cloneNode
        }
    }
    for item in siblingSet {
        cloneDict[item]?.sibling = cloneDict[item.sibling!]
    }
    return rootNode
}


