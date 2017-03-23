//
//  17：合并两个排序的链表.swift
//  Offer
//
//  Created by 阳君 on 2017/3/23.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

import Foundation

// 输入两个递增排序的链表，合并这两个链表并使新链表中的结点仍然是按照递增排序的。
// 表1： 1 3 5 7
// 表2： 2 4 6 8
// 合表：1 2 3 4 5 6 7 8

class ListNode : NSObject {
    var key: Int = 0
    var next: ListNode?
}

func merge(node1: ListNode, node2: ListNode) -> ListNode {
    var vNode1: ListNode? = node1
    var vNode2: ListNode? = node2
    var result: ListNode!
    if node1.key <= node2.key {
        result = node1
        vNode1 = node1.next
    } else {
        result = node2
        vNode2 = node2.next
    }
    
    var temp = result!
    while vNode1 != nil && vNode2 != nil {
        if vNode1!.key <= vNode2!.key {
            temp.next = vNode1
            vNode1 = vNode1!.next
        } else {
            temp.next = vNode2
            vNode2 = vNode2!.next
        }
        temp = temp.next!
    }
    
    temp.next = vNode1 != nil ? vNode1 : vNode2
    
    return result
}


var node1 = ListNode()
var node2 = ListNode()
let tNode1 = node1
let tNode2 = node2
for key in 0 ..< 5 {
    node1.next = ListNode()
    node1 = node1.next!
    node1.key = 2 * key
    node2.next = ListNode()
    node2 = node2.next!
    node2.key = 2 * key + 1
}
node1 = tNode1.next!
node2 = tNode2.next!
let node = merge(node1: node1, node2: node2)
print("\(node.key)")
