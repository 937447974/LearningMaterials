//
//  31：连续子数组的最大和.swift
//  Offer
//
//  Created by 阳君 on 2017/3/25.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 输入一个整型数组，数组里有正数也有负数。数组中一个或连续的多个数组组成一个子数组。
// 求所有子数组和的最大值。要求时间复杂度为O(n)。
// 例如[1,-2,3,4,-5,6]，最大子数组和为8

import Foundation

func findSubArrayMaxSum(array:Array<Int>) -> Int {
    var maxSum = 0
    var currentSum = 0
    for item in array {
        currentSum += item
        if currentSum < 0 {
            currentSum = 0
        } else if maxSum < currentSum {
           maxSum = currentSum
        }
    }
    return maxSum
}


print(findSubArrayMaxSum(array: []))
print(findSubArrayMaxSum(array: [-1,-2,-3]))
print(findSubArrayMaxSum(array: [-1,-2,3]))
print(findSubArrayMaxSum(array: [1,-2,3,4,-5,6]))
