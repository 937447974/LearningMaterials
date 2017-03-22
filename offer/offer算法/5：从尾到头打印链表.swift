//
//  5：从尾到头打印链表.swift
//  Offer
//
//  Created by 阳君 on 2017/3/22.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 输入一个链表的头结点，从尾到头反过来打印出每个结点的值。

import Foundation

class ListNode : NSObject {
    var key: Int = 0
    var next: ListNode?
}


func printListReversingly(node: ListNode) {
    if let next = node.next {
        printListReversingly(node: next)
    }
    print("\(node.key)")
}


let root = ListNode()
var node = ListNode()
root.next = node
for key in 1 ..< 10 {
    node.key = key
    node.next = ListNode()
    node = node.next!
}
printListReversingly(node: root)
