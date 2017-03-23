//
//  9：斐波那契数列.swift
//  Offer
//
//  Created by 阳君 on 2017/3/23.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 写一个函数，输入n，求斐波那契数列的第n项。
//                0          n = 0
//  f(n) =        1          n = 1
//         f(n-1) + f(n-2)   n > 1

// 同理变形题：一只青蛙一次可以跳上1级台阶，也可以跳上2级。求该青蛙跳上一个n级的台阶总共有多少种跳法。

import Foundation

func fibonacci(n: Int) -> Int {
    if n <= 0 {
        return 0
    } else if n == 1 {
        return 1
    }
    var f0 = 0
    var f1 = 1
    var fn = 0
    for _ in 2...n {
        fn = f1 + f0
        f0 = f1
        f1 = fn
    }
    return fn
}


print("\(fibonacci(n: -1))")
print("\(fibonacci(n: 0))")
print("\(fibonacci(n: 1))")
print("\(fibonacci(n: 2))")
print("\(fibonacci(n: 3))")
print("\(fibonacci(n: 4))")
