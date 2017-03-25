//
//  37：两个链表的第一个公共结点.swift
//  Offer
//
//  Created by 阳君 on 2017/3/25.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

class ListNode: NSObject {
    var next: ListNode?
}

import Foundation

func findFirstCommonNode(node1: ListNode, node2: ListNode) -> ListNode? {
    var tempNode1: ListNode? = node1
    var tempNode2: ListNode? = node2
    var count = 0 // 长度距离
    while tempNode1 != nil {
        count += 1
        tempNode1 = tempNode1!.next
    }
    while tempNode2 != nil {
        count -= 1
        tempNode2 = tempNode2!.next
    }
    tempNode1 = node1
    tempNode2 = node2
    // 先行
    while count != 0 {
        if count > 0 {
            count -= 1
            tempNode1 = tempNode1!.next
        } else {
            count += 1
            tempNode2 = tempNode2!.next
        }
    }
    // 找n结点
    while tempNode1 != nil {
        if tempNode1 == tempNode2 {
            return tempNode1
        }
        tempNode1 = tempNode1!.next
        tempNode2 = tempNode2!.next
    }
    return nil
}
