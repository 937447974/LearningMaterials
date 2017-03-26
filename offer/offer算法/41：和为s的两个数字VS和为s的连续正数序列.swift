//
//  41：和为s的两个数字VS和为s的连续正数序列.swift
//  Offer
//
//  Created by 阳君 on 2017/3/26.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 1 输入一个递增排序的数组和一个数字 s,在数组中查找两个数，使得它们的和正好是s。
// 如果有多对数字的和等于 s，输出任意一对即可。

import Foundation

func findNumbersWithSum(array: Array<Int>, sum: Int) {
    guard array.count >= 2 else {
        return
    }
    var start = 0
    var end = array.count - 1
    var currentSum = 0
    while start != end {
        currentSum = array[start] + array[end]
        if currentSum == sum {
            print("\(sum) = \(array[start]) + \(array[end])")
            return
        } else if currentSum < sum {
            start += 1
        } else {
            end -= 1
        }
    }
}


findNumbersWithSum(array: [1], sum: 15)
findNumbersWithSum(array: [1,2,4,7,11,15], sum: 15)



// 2 输入一个正数 s，打印出所有和为 s 的连续正数序列。
// 例如输入 15，则打印 [1,2,3,4,5]，[4,5,6] 和 [7,8]。

func findContinuousSequence(sum: Int) {
    guard sum >= 3 else {
        return
    }
    var result = Array<Int>()
    var currentSum = 0
    let count = sum / 2 + sum % 2
    for item in 1 ... count  {
        result.append(item)
        currentSum += item
        while currentSum > sum {
            currentSum -= result.removeFirst()
        }
        if currentSum == sum {
            print("\(result)")
        }
    }
}


findContinuousSequence(sum: 2)
findContinuousSequence(sum: 3)
findContinuousSequence(sum: 15)



