//
//  62：序列化二叉树.swift
//  Offer
//
//  Created by 阳君 on 2017/3/27.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 请实现两个函数，分别用来序列化和反序列化

import Foundation

class TreeNode: NSObject {
    var value = 0
    var left: TreeNode?
    var right: TreeNode?
}

private func serializeCore(node: TreeNode?, array: inout Array<String>) {
    guard let node = node else {
        array.append("")
        return
    }
    array.append("\(node.value)")
    serializeCore(node: node.left, array:&array)
    serializeCore(node: node.right, array:&array)
}

func serialize(node: TreeNode) -> Array<String> {
    var array = Array<String>()
    serializeCore(node: node, array:&array)
    return array
}

private func deserializeCore(array: inout Array<String>) -> TreeNode? {
    guard let value = array.first else {
        return nil
    }
    array.removeFirst()
    guard value != "" else {
        return nil
    }
    let node = TreeNode()
    node.value = Int(value) ?? 0
    node.left = deserializeCore(array: &array)
    node.right = deserializeCore(array: &array)
    return node
}

func deserialize(array: Array<String>) -> TreeNode? {
    var array = array
    return deserializeCore(array: &array)
}



