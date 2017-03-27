//
//  51：数组中重复的数字.swift
//  Offer
//
//  Created by 阳君 on 2017/3/27.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 在一个长度为n的数组里所有数字都在0到n-1的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。
// 请找出数组中任意一个重复的数字。例如，如果长度为7的数组[2,3,1,0,2,5,3]，那么对应的数组是重复的数字 2 或者 3。

import Foundation

func duplicate1(array: Array<Int>) {
    var set = Set<Int>()
    for item in array {
        if !set.insert(item).inserted {
            print(item)
            return
        }
    }
}

func duplicate2(array: Array<Int>) {
    // 数字范围为0到n-1。可用脚标取
    var tempArray = Array<Int>(repeating: -1, count: array.count)
    for index in 0 ..< array.count {
        let number = array[index]
        if tempArray[number] != -1 {
            print(number)
            return
        }
        tempArray[number] = number
    }
}


duplicate1(array: [2,3,1,0,2,5,3])
duplicate2(array: [2,3,1,0,2,5,3])
