//
//  60：把二叉树打印成多行.swift
//  Offer
//
//  Created by 阳君 on 2017/3/27.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 从上到下按层打印二叉树，同一层的结点从左到右的顺序打印，每一层打印到一行。

// 8
// 6 10
// 5 7  9 11

import Foundation

class TreeNode: NSObject {
    var value = 0
    var left: TreeNode?
    var right: TreeNode?
}

func printTree(treeNode: TreeNode) {
    var nodeArray = [treeNode]
    var row = Array<Int>()
    var tempArray = Array<TreeNode>()
    while nodeArray.count != 0 {
        for node in nodeArray {
            row.append(node.value)
            if let left = node.left {
                tempArray.append(left)
            }
            if let right = node.right {
                tempArray.append(right)
            }
        }
        print(row)
        row.removeAll()
        nodeArray = tempArray
        tempArray.removeAll()
    }
}
