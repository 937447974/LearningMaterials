//
//  23：从上到下打印二叉树.swift
//  Offer
//
//  Created by 阳君 on 2017/3/24.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 从上到下打印出二叉树的每个结点，同一层的结点按照从左到右的顺序打印。
//    8
//  6    10
// 5 7  9  11
// 打印顺序为[8, 6, 10, 5, 7, 9, 11]

import Foundation

class TreeNode<Element> {
    var value: Element?
    var left: TreeNode?
    var right: TreeNode?
}

func printFromTopToButtom<Element>(node: TreeNode<Element>) {
    var array = [node]
    while array.count != 0 {
        let item = array.removeFirst()
        if let left = item.left {
            array.append(left)
        }
        if let right = item.right {
            array.append(right)
        }
        print("\(item.value)")
    }
}

