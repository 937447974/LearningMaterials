//
//  45：圆圈中最后剩下的数字.swift
//  Offer
//
//  Created by 阳君 on 2017/3/26.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 0,1....n-1 这 n 个数字排成一个圆圈，从数字 0 开始每次从这个圆圈里删除第 m 个数字。
// 求出这个圆圈里剩下的最后一个数字

import Foundation

func lastRemaining(n: Int, m: Int) -> Int {
    guard n > 1 && m > 1 else {
        return 0
    }
    var last = 0
    for index in 2...n {
        last = (last + m) % index
    }
    return last
}
