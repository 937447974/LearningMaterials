//
//  25：二叉树中和为某一个值得路径.swift
//  Offer
//
//  Created by 阳君 on 2017/3/24.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

import Foundation

// 输入一课二叉树和一个整数，打印出二叉树中结点值的和为输入整数的所有路径。
// 从树的根结点开始往下一直到叶结点所经过的结点形成一条路径。

class TreeNode {
    var value = 0
    var left: TreeNode?
    var right: TreeNode?
}

private func findPath(node: TreeNode, sum: Int, path: Array<Int>) {
    let currentSum = sum - node.value
    guard currentSum >= 0 else {
        return
    }
    var currentPath = path
    currentPath.append(node.value)
    if node.left == nil && node.right == nil && currentSum == 0 {
        print(path)
        return
    }
    if let left = node.left {
        findPath(node: left, sum: currentSum, path: currentPath)
    }
    if let right = node.right {
        findPath(node: right, sum: currentSum, path: currentPath)
    }
}

func findPath(node: TreeNode, sum: Int) {
    findPath(node: node, sum: sum, path: Array<Int>())
}
