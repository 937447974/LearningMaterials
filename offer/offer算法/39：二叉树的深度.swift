//
//  39：二叉树的深度.swift
//  Offer
//
//  Created by 阳君 on 2017/3/26.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

import Foundation

// 1 输入一棵二叉树的根结点，求该数的深度。从根结点到叶结点依次经过的结点形成的树的一条路径，
// 最长路径的长度为树的深度。

class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
}

func treeDepth(treeNode: TreeNode?) -> Int {
    guard treeNode != nil else {
        return 0
    }
    let leftDepth = treeDepth(treeNode: treeNode!.left) + 1
    let rightDepth = treeDepth(treeNode: treeNode!.right) + 1
    return leftDepth >= rightDepth ? leftDepth : rightDepth
}


// 2 输入一棵二叉树的根结点，判断该树是不是平衡二叉树。
// 如果某二叉树种任意结点的左右子树的深度相差不超过1，那么它就是一颗平衡二叉树。

private func isBalancedBased(node: TreeNode?, height:Int) -> (minHeight: Int, maxHeight: Int) {
    guard node != nil else {
        return (height, height)
    }
    let cHeight = height + 1
    if node!.left == nil && node!.right == nil {
        return (cHeight, cHeight)
    }
    
    let left = isBalancedBased(node: node!.left, height:cHeight)
    let right = isBalancedBased(node: node!.right, height:cHeight)
    let minHeight = left.minHeight <= right.minHeight ? left.minHeight : right.minHeight
    let maxHeight = left.maxHeight >= right.maxHeight ? left.maxHeight : right.maxHeight
    return (minHeight, maxHeight)
}


func isBalanced(node: TreeNode) -> Bool {
    let height  = isBalancedBased(node: node, height:0)
    return height.maxHeight - height.minHeight <= 1
}


