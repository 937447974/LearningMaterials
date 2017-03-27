//
//  63：二叉搜索树的第K个结点.swift
//  Offer
//
//  Created by 阳君 on 2017/3/27.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 给定一棵二叉搜索树，请找出其中第k大的结点。

// 标准二叉搜索树 左 < 根 < 右

import Foundation

class TreeNode: NSObject {
    var value = 0
    var left: TreeNode?
    var right: TreeNode?
}

private func kthNodeCore(node: TreeNode, k: inout Int) -> TreeNode? {
    guard k > 1 else {
        return node
    }
    if let left = node.left {
        if let result = kthNodeCore(node: left, k: &k) {
            return result
        }
    }
    guard k > 1 else {
        return node
    }
    k -= 1
    if let right = node.right {
        if let result = kthNodeCore(node: right, k: &k) {
            return result
        }
    }
    return nil
}

func kthNode(node: TreeNode, k: Int) -> TreeNode? {
    var k = k
    return kthNodeCore(node: node, k: &k)
}
