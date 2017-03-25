//
//  29：数组中出现次数超过一半的数字.swift
//  Offer
//
//  Created by 阳君 on 2017/3/25.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。
// 例如输入数组[1,2,3,2,2]。其超过一半的数字为2。

import Foundation

func moroThanHalfNum(numbers: Array<Int>) -> Int? {
    guard numbers.count >= 2 else {
        return numbers.first
    }
    var result = 0
    var count = 0
    for number in numbers {
        if count == 0 {
            count = 1
            result = number
        } else {
            count = result == number ? count + 1 : count - 1
        }
    }
    guard count != 0 else {
        return nil
    }
    // 保证过两次
    count = 0
    for number in numbers {
        if result == number {
            count += 1
            if count == 2 {
                return result
            }
        }
    }
    return nil
}


print("\(moroThanHalfNum(numbers: []))")
print("\(moroThanHalfNum(numbers: [1]))")
print("\(moroThanHalfNum(numbers: [1,1,3]))")
print("\(moroThanHalfNum(numbers: [1,2,3]))")
print("\(moroThanHalfNum(numbers: [1,2,3,2,2]))")

