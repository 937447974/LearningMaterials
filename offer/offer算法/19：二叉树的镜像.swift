//
//  19：二叉树的镜像.swift
//  Offer
//
//  Created by 阳君 on 2017/3/23.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

import Foundation

// 请完成一个函数，输入一个二叉树，该函数输出它的镜像。

class TreeNode {
    var value = 0
    var left: TreeNode?
    var right: TreeNode?
}

func mirrorRecursively(node: TreeNode?) -> TreeNode? {
    if let root = node  {
        let left = root.left
        root.left = mirrorRecursively(node: root.right)
        root.right = mirrorRecursively(node: left)
    }
    return node
}


let node = TreeNode()
node.value = 0
let node1 = TreeNode()
node1.value = 1
let node2 = TreeNode()
node2.value = 2
let node3 = TreeNode()
node3.value = 3

node.left = node1
node.right = node2
node2.right = node3

let result = mirrorRecursively(node: node)
