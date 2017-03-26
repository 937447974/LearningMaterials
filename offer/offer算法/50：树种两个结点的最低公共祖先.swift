//
//  50：树中两个结点的最低公共祖先.swift
//  Offer
//
//  Created by 阳君 on 2017/3/26.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

import Foundation

class TreeNode: NSObject {
    var left: TreeNode?
    var right: TreeNode?
}

private func findPath(root:TreeNode?, node: TreeNode, path: Array<TreeNode>) -> Array<TreeNode>? {
    guard let root = root else {
        return nil
    }
    var path = path
    path.append(root)
    if root == node {
        return path
    }
    return findPath(root: root.left, node: node, path: path) ?? findPath(root: root.right, node: node, path: path)
}

private func findFather(path1: Array<TreeNode>?, path2: Array<TreeNode>?) -> TreeNode? {
    guard let path1 = path1 else {
        return nil
    }
    guard let path2 = path2 else {
        return nil
    }
    let count = path1.count > path2.count ? path1.count : path2.count
    var result: TreeNode?
    for index in 0 ..< count {
        if path1[index] == path2[index] {
            result = path1[index]
        } else {
            return result
        }
    }
    return nil
}

func findFather(root:TreeNode, node1: TreeNode, node2: TreeNode) -> TreeNode? {
    let path1 = findPath(root: root, node: node1, path: [])
    let path2 = findPath(root: root, node: node2, path: [])
    return findFather(path1: path1, path2: path2)
}


