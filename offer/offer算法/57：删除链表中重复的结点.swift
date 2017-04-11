//
//  57：删除链表中重复的结点.swift
//  Offer
//
//  Created by 阳君 on 2017/3/27.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 在一个排序的链表中，如何删除重复的结点？
// 例如 [1,2,2,3,3,4,5]，删除后为 [1,4,5]

import Foundation

class LisNode: NSObject {
    var value = 0
    var next: LisNode?
}

private func deleteFirstDuplication(node: LisNode) -> LisNode? { //
    var node = node
    while node.next != nil && node.value == node.next!.value  {
        var result = node.next
        let value = node.value
        while result != nil && result!.value == value  {
            result = result!.next
        }
        guard result != nil else {
            return nil
        }
        node = result
    }
    return node
}

func deleteDuplication(node: LisNode) -> LisNode? {
    guard node.next != nil else {
        return node
    }
    // 去首重
    guard let result = deleteFirstDuplication(node: node) else {
        return nil
    }
    node = result
    // 去中间重
    var tempNode = node
    var currentNode = tempNode.next
    while currentNode != nil {
        let resultNode = deleteFirstDuplication(node: currentNode)
        tempNode.next = resultNode
        tempNode = resultNode
        if currentNode!.value == resultNode.value {
            currentNode = resultNode.next
        } else {
            currentNode = resultNode
        }
    }
    return node
}
