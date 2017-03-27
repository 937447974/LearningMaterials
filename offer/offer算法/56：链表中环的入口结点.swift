//
//  56：链表中环的入口结点.swift
//  Offer
//
//  Created by 阳君 on 2017/3/27.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 一个链表中包含环，如何找出环的入口结点？

import Foundation

class LisNode: NSObject {
    var next: LisNode?
}

func meetingNode(node: LisNode) -> LisNode? {
    var set = Set<LisNode>()
    var node = node
    while node.next != nil { // 如果是环这里应该死循环，否则返回 nil
        if !set.insert(node).inserted {
            return node
        }
        node = node.next!
    }
    return nil
}
