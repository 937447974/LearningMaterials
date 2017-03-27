//
//  59：对称的二叉树.swift
//  Offer
//
//  Created by 阳君 on 2017/3/27.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

import Foundation

// 请实现一个函数，用来判断一棵二叉树是不是对称的。

class TreeNode: NSObject {
    var value = 0
    var left: TreeNode?
    var right: TreeNode?
}

private func isSymmetrical(leftTree: TreeNode?, rightTree: TreeNode?) -> Bool {
    if leftTree == nil && rightTree == nil {
        return true
    }
    guard let leftTree = leftTree else {
        return false
    }
    guard let rightTree = rightTree else {
        return false
    }
    return leftTree.value == rightTree.value && isSymmetrical(leftTree: leftTree.left, rightTree: rightTree.right) && isSymmetrical(leftTree: leftTree.right, rightTree: rightTree.left)
}

func isSymmetrical(node: TreeNode) -> Bool {
    return isSymmetrical(leftTree: node.left, rightTree: node.right)
}
