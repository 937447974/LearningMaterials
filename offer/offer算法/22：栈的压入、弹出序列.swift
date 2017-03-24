//
//  22：栈的压入、弹出序列.swift
//  Offer
//
//  Created by 阳君 on 2017/3/24.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 

import Foundation

// 输入两个整数序列，第一个序列表示找的压入顺序，请判断第二个序列是否为该栈的弹出顺序。
// 假设压入栈的所有数字均不想等。
// 例如压入顺序是 [1,2,3,4,5]，其弹出序列可以是 [4,5,3,2,1]，不能是[4, 3, 5, 1, 2]。

func isPopOrder(pushArray: Array<Int>, popArray: Array<Int>) -> Bool {
    var popStack = popArray
    var pushStack = Array<Int>()
    for item in pushArray {
        if item == popStack.first {
            popStack.removeFirst()
            while pushStack.last != nil && pushStack.last == popStack.first {
                pushStack.removeLast()
                popStack.removeFirst()
            }
        } else {
            pushStack.append(item)
        }
    }
    return pushStack.count == 0 && popStack.count == 0
}


print(isPopOrder(pushArray: [1,2,3,4,5], popArray: [4,5,3,2,1]))
print(isPopOrder(pushArray: [1,2,3,4,5], popArray: [4,3,5,1,2]))
