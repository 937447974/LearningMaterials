//
//  24：二叉搜索树的后序遍历序列.swift
//  Offer
//
//  Created by 阳君 on 2017/3/24.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历的结果。如果是则返回true，否则返回false。
// 假设输入的数组的任意两个数字都互不相同。
// 例如[5,7,6,9,11,10,8]则是后序数组

import Foundation

func isSufOrder(array: Array<Int>) -> Bool {
    if array.count == 0 {
        return true
    }
    var prefix = true
    var treeArray = array
    let root = treeArray.removeLast()
    var leftArray = Array<Int>()
    var rightArray = Array<Int>()
    for item in treeArray {
        if prefix && item < root  {
            leftArray.append(item)
        } else {
            guard item > root else {
                return false
            }
            prefix = false
            rightArray.append(item)
        }
    }
    return isSufOrder(array: leftArray) && isSufOrder(array: rightArray)
}


print(isSufOrder(array: [5,7,6,9,11,10,8]))
print(isSufOrder(array: [5,7,9,6,11,10,8]))
