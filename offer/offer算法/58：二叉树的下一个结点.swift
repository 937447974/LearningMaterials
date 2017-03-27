//
//  58：二叉树的下一个结点.swift
//  Offer
//
//  Created by 阳君 on 2017/3/27.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 给定一棵二叉树和其中的一个结点，如何找出中序遍历顺序的下一个结点。

class TreeNode: NSObject {
    var fataher: TreeNode?
    var left: TreeNode?
    var right: TreeNode?
}

import Foundation

func getNextInNode(node: TreeNode) -> TreeNode? {
    if node.right != nil {
        return node.right
    }
    if node.left == nil && node.right == nil && node == node.fataher?.right {
        return node.fataher!.fataher
    }
    return node.fataher
}
