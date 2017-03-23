//
//  6：重建二叉树.swift
//  Offer
//
//  Created by 阳君 on 2017/3/22.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 输入某二叉树的前序遍历和中序遍历的结果，请重建出该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。
// 例如输入前序遍历[1,2,4,7,3,5,6,8]和中序遍历序列为[4,7,2,1,5,3,8,6]。则原树为
//        1
//    2   |   3
//  4 |     5 | 6
//  |7         8|
// 后序左右根为[7,4,2,5,8,6,3,1]

import Foundation

class TreeNode: NSObject {
    var key = 0
    var left: TreeNode?
    var right: TreeNode?
}

// 前序+中序
func construct(preOrder: Array<Int>, inOrder: Array<Int>) -> TreeNode? {
    guard preOrder.count > 0 && preOrder.count == inOrder.count else {
        return nil
    }
    let node = TreeNode()
    node.key = preOrder[0]
    
    var addLeft = true
    var leftPreOrder = Array<Int>()
    var leftInOrder = Array<Int>()
    var rightPreOrder = Array<Int>()
    var rightInOrder = Array<Int>()
    for index in 0 ..< inOrder.count {
        if inOrder[index] == node.key {
           addLeft = false
        } else if addLeft { // left
            leftPreOrder.append(preOrder[index+1])
            leftInOrder.append(inOrder[index])
        } else { // rigth
            rightPreOrder.append(preOrder[index])
            rightInOrder.append(inOrder[index])
        }
    }
    
    node.left = construct(preOrder: leftPreOrder, inOrder: leftInOrder)
    node.right = construct(preOrder: rightPreOrder, inOrder: rightInOrder)
    
    return node
}

// 中序+后序
func construct(inOrder: Array<Int>, sufOrder: Array<Int>) -> TreeNode? {
    // [4,7,2,1,5,3,8,6] [7,4,2,5,8,6,3,1]
    guard sufOrder.count > 0 && sufOrder.count == inOrder.count else {
        return nil
    }
    let node = TreeNode()
    node.key = sufOrder.last!
    
    var addLeft = true
    var leftInOrder = Array<Int>()
    var leftSufOrder = Array<Int>()
    var rightInOrder = Array<Int>()
    var rightSufOrder = Array<Int>()
    for index in 0 ..< inOrder.count {
        if inOrder[index] == node.key {
            addLeft = false
        } else if addLeft { // left
            leftSufOrder.append(sufOrder[index])
            leftInOrder.append(inOrder[index])
        } else { // rigth
            rightSufOrder.append(sufOrder[index-1])
            rightInOrder.append(inOrder[index])
        }
    }
    
    node.left = construct(inOrder: leftInOrder, sufOrder:leftSufOrder)
    node.right = construct(inOrder: rightInOrder, sufOrder:rightSufOrder)
    
    return node
}

