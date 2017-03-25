//
//  27：二叉搜索树与双向链表.swift
//  Offer
//
//  Created by 阳君 on 2017/3/25.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 输入一棵二叉搜索树，将该二叉搜索树转换成一个排序的双向链表

import Foundation

class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
}

// left 表示是否返回链表最左结点
func convert(node: TreeNode, left: Bool) -> TreeNode {
    if node.left != nil {
        node.left = convert(node: node.left!, left: false)
        node.left!.right = node
    }
    if node.right != nil {
        node.right = convert(node: node.right!, left: true)
        node.right!.left = node
    }
    var result = node
    if left {
        while result.left != nil {
            result = result.left!
        }
    } else {
        while result.right != nil {
            result = result.right!
        }
    }
    return result
}

