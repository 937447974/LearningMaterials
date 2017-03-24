//
//  18：树的子结构.swift
//  Offer
//
//  Created by 阳君 on 2017/3/23.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 输入两棵二叉树 A 和 B, 判断B是不是A的子结构。

import Foundation

class TreeNode {
    var value = 0
    var left: TreeNode?
    var right: TreeNode?
}

private func hasSubtreeCore(root: TreeNode?, subtree: TreeNode?) -> Bool {
    guard subtree != nil else {
        return true
    }
    guard root != nil else {
        return false
    }
    guard root!.value == subtree!.value else {
        return false
    }
    return hasSubtreeCore(root: root!.left, subtree: subtree!.left) && hasSubtreeCore(root: root!.right, subtree: subtree!.right)
}

func hasSubtree(root: TreeNode?, subtree: TreeNode?) -> Bool {
    guard root != nil && subtree != nil else {
        return false
    }
    var result = false
    if root?.value == subtree?.value {
        result = hasSubtreeCore(root: root, subtree: subtree)
    }
    if !result {
        result = hasSubtree(root: root!.left, subtree: subtree!.left)
    }
    if !result {
        result = hasSubtree(root: root!.right, subtree: subtree!.right)
    }
    return result
}





