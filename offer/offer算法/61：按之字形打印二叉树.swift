//
//  61：按之字形打印二叉树.swift
//  Offer
//
//  Created by 阳君 on 2017/3/27.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 之字形打印二叉树，即第一行从左到右，第二行从右到左，第三行从左到右。。。

// 1
// 3 2
// 4 5 6 7

import Foundation

class TreeNode: NSObject {
    var value = 0
    var left: TreeNode?
    var right: TreeNode?
}

private func printTree(nodeArray: Array<TreeNode>, single: Bool) -> Array<TreeNode> {
    var row = Array<Int>()
    var nextArray = Array<TreeNode>()
    for node in nodeArray {
        row.append(node.value)
        if single {
            if let left = node.left {
                nextArray.insert(left, at: 0)
            }
            if let right = node.right {
                nextArray.insert(right, at: 0)
            }
        } else {
            if let right = node.right {
                nextArray.insert(right, at: 0)
            }
            if let left = node.left {
                nextArray.insert(left, at: 0)
            }
        }
    }
    print(row)
    return nextArray
}

func printTree(treeNode: TreeNode) {
    var nodeArray = [treeNode]
    while nodeArray.count != 0 {
        nodeArray = printTree(nodeArray: nodeArray, single: true) // 单行
        nodeArray = printTree(nodeArray: nodeArray, single: false) // 双行
    }
}
