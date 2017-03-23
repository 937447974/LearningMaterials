//
//  10：二进制中1的个数.swift
//  Offer
//
//  Created by 阳君 on 2017/3/23.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 请实现一个函数，输入一个整数，输出该数二进制表示中1的个数。
// 例如把9表示成二进制是1001，有2位是1。因此输出2。

import Foundation

func numberOf1(n: Int) -> Int {
    var count = 0
    var n = n
    while n > 0 {
        count += 1
        n = (n - 1) & n
    }
    return count
}


print("\(numberOf1(n: -1))")
print("\(numberOf1(n: 0))")
print("\(numberOf1(n: 1))")
print("\(numberOf1(n: 9))")
