//
//  13：在O(1)时间删除链表结点.swift
//  Offer
//
//  Created by 阳君 on 2017/3/23.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 给定单向链表的头指针和一个结点指针，定义一个函数在 O(1) 时间删除结点。

import Foundation

class ListNode: NSObject {
    var key: Int?
    var next: ListNode?
}

func deleteNode(listNode: ListNode, deleteNode: ListNode) {
    if deleteNode.next == nil {
        var temp = listNode
        while temp.next?.next != nil {
            temp = temp.next!
        }
        if temp.next == deleteNode {
            temp.next = nil
        }
    } else {
        let temp = deleteNode.next!
        deleteNode.key = temp.key
        deleteNode.next = temp.next
    }
}


let node1 = ListNode()
node1.key = 1
let node2 = ListNode()
node2.key = 2
node2.next = node1
let node3 = ListNode()
node3.key = 3
node3.next = node2
let listNode = ListNode()
listNode.key = 4
listNode.next = node3

deleteNode(listNode: listNode, deleteNode: node1)
deleteNode(listNode: listNode, deleteNode: node3)
deleteNode(listNode: listNode, deleteNode: listNode)
print("\(listNode.key)")

