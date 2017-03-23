//
//  16：反转链表.swift
//  Offer
//
//  Created by 阳君 on 2017/3/23.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

import Foundation

// 定义一个函数,输入一个链表的头结点，反转该链表并输出反转后链表的头结点。

class ListNode : NSObject {
    var key: Int = 0
    var next: ListNode?
}

func reverseList(node: ListNode) -> ListNode {
    var result = node
    var temp = node.next
    result.next = nil
    while temp != nil {
        let next = temp?.next
        temp?.next = result
        result = temp!
        temp = next
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
print("\(node.key)")
node = reverseList(node: node)
print("\(node.key)")
node = reverseList(node: node)
print("\(node.key)")
