//
//  11：数值的整数次方.swift
//  Offer
//
//  Created by 阳君 on 2017/3/23.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 实现函数求base的expontent次方（无需考虑大数问题）

import Foundation

func power(base: Double, exponent: Int) -> Double {
    if base == 0 {
        return 0
    } else if exponent == 0 {
        return 1
    }
    // 负次方
    var exponent = exponent
    var positive = true
    if exponent < 0 {
        positive = false
        exponent = -exponent
    }
    // 1次方
    if exponent == 1 {
        return positive ? base : 1.0 / base
    }
    var result = power(base: base, exponent: exponent >> 1)
    result *= result
    if exponent & 1 == 1 {
        result *= base
    }
    return positive ? result : 1.0 / result
    
}
