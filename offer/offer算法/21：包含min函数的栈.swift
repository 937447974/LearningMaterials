//
//  21：包含min函数的栈.swift
//  Offer
//
//  Created by 阳君 on 2017/3/24.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 定义栈的数据结构，请在该类型中实现一个能够得到栈的最小元素的 min 函数。
// 在该栈中，调用 min、push 及 pop 的时间复杂度都是 O(1)。

import Foundation

class Stack {
    
    private var array = Array<Int>()
    private var minArray = Array<Int>()
    
    func push(_ k: Int) {
        var minItem = k
        if self.array.count != 0  {
            minItem = self.array.last!
            minItem = minItem < k ? minItem : k
        }
        self.array.append(k)
        self.minArray.append(minItem)
    }
    
    func min() -> Int? {
        return self.minArray.last
    }
    
    func pop() -> Int? {
        guard self.array.count != 0 else {
            return nil
        }
        self.minArray.removeLast()
        return self.array.removeLast()
    }
    
}

stack.push(3)
print("min: \(stack.min())")
stack.push(4)
print("min: \(stack.min())")
stack.push(2)
print("min: \(stack.min())")
stack.push(1)
print("min: \(stack.min())")
print("pop:\(stack.pop()); min: \(stack.min())")
print("pop:\(stack.pop()); min: \(stack.min())")
stack.push(0)
print("min: \(stack.min())")
print("pop:\(stack.pop()); min: \(stack.min())")
print("pop:\(stack.pop()); min: \(stack.min())")
print("pop:\(stack.pop()); min: \(stack.min())")
