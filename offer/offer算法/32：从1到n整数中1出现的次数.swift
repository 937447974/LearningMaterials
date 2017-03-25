//
//  32：从1到n整数中1出现的次数.swift
//  Offer
//
//  Created by 阳君 on 2017/3/25.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 输入一个整数n,求从1到n这n个整数的十进制中1出现的次数。
// 例如输入12，从1到12含1的整数有1、10、11和12，1一共出现了5次。

import Foundation

func powerBase10(_ n: Int) -> Int {
    var result = 1
    while result * 10 <= n {
        result *= 10
    }
    return result
}

func numberOf1Between1AndN(n: Int, cache: inout Dictionary<Int, Int>) -> Int{
    if let count = cache[n] {
        return count
    }
    guard n >= 1 else {
        return 0
    }
    guard n >= 10 else {
        cache[n] = 1
        return 1
    }
    let power = powerBase10(n)
    let divisor = n / power
    var count = divisor == 1 ? 1 : power
    count += divisor * numberOf1Between1AndN(n: power-1, cache: &cache)
    count += numberOf1Between1AndN(n: n % power, cache: &cache)
    cache[n] = count
    return count
}


var cache = Dictionary<Int, Int>()
print(numberOf1Between1AndN(n: 0, cache: &cache))
print(numberOf1Between1AndN(n: 1, cache: &cache))
print(numberOf1Between1AndN(n: 9, cache: &cache))
print(numberOf1Between1AndN(n: 10, cache: &cache))
print(numberOf1Between1AndN(n: 12, cache: &cache))
print(numberOf1Between1AndN(n: 20, cache: &cache))
print(numberOf1Between1AndN(n: 22, cache: &cache))
