//
//  15：链表中倒数第K个结点.swift
//  Offer
//
//  Created by 阳君 on 2017/3/23.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 输入一个链表，输出该链表中倒数第k个结点。
// 如[1,2,3,4,5,6]，倒数第3个结点为3

import Foundation

class ListNode : NSObject {
    var key: Int = 0
    var next: ListNode?
}

func find(node: ListNode, tail k: Int) -> ListNode? {
    guard k > 0 else {
        return nil
    }
    
    var k = k
    var lastNode: ListNode? = node
    while k > 0 && lastNode != nil {
        k -= 1
        lastNode = lastNode?.next
    }
    guard k == 0 else {
        return nil
    }
    
    var result: ListNode = node
    while lastNode != nil {
        lastNode = lastNode!.next
        result = result.next!
    }
    return result
}



var node = ListNode()
let root = node
for key in 1 ..< 10 {
    node.next = ListNode()
    node = node.next!
    node.key = key
}
node = root.next!
print("\(find(node: node, tail: 2)?.key)")
print("\(find(node: node, tail: 0)?.key)")
print("\(find(node: node, tail: 11)?.key)")
