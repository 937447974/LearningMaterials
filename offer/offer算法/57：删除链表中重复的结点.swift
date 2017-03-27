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

private func deleteFirstDuplication(node: LisNode?) -> LisNode? { // 去首重
    guard node != nil && node!.next != nil && node!.value == node!.next!.value else {
        return node
    }
    let duplication = node!.value
    var result = node!.next!.next
    while result != nil && result?.value == duplication {
        result = result!.next
    }
    return deleteFirstDuplication(node: result)
}

func deleteDuplication(node: LisNode) -> LisNode? {
    guard let result = deleteFirstDuplication(node: node) else {
        return nil
    }
    var tempNode = result
    var currentNode = tempNode.next
    var currentNextNode = currentNode?.next
    while currentNode != nil && currentNextNode != nil {
        if currentNode!.value == currentNextNode!.value {
            let duplication = currentNode!.value
            currentNode = currentNextNode?.next
            tempNode.next = currentNode
            while currentNode != nil && currentNode!.value == duplication {
                currentNode = currentNode?.next
                tempNode.next = currentNode
            }
        } else {
            tempNode = currentNode!
        }
        currentNode = tempNode.next
        currentNextNode = currentNode?.next
    }
    return result
}
