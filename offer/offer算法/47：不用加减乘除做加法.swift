//
//  47：不用加减乘除做加法.swift
//  Offer
//
//  Created by 阳君 on 2017/3/26.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 写一个函数求两个整数之和，不得使用+、-、* 和 /

import Foundation

func add(one: Int, two: Int) -> Int {
    var one = one
    var two = two
    while two != 0 {
        let result = one ^ two // 
        two = (one & two) << 1 // 进位
        one = result
    }
    return one
}

print(add(one: 3, two: 4))
print(add(one: 2, two: 8))
print(add(one: 2, two: 3))
print(add(one: 5, two: 6))
