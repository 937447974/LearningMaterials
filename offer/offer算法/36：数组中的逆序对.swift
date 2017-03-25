//
//  36：数组中的逆序对.swift
//  Offer
//
//  Created by 阳君 on 2017/3/25.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 在数组中的两个数字如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。
// 输入一个数组，求出这个数组中的逆序对的总数。

import Foundation

private func inversePairsCore(array: inout Array<Int>, item: Int) -> Int {
    if array.count == 0 || item >= array.last! {
        array.append(item)
        return 0
    }
    var index = 0
    if item >= array.first! {
        var start = 0
        var end = array.count
        while start != end && start + 1 != end {
            index = (end + start) >> 1
            if array[index] > item {
                end = index
            } else {
                start = index
            }
        }
        if start != end && item >= array[start] {
            index = end
        }
    }
    array.insert(item, at: index)
    return array.count - 1 - index
}

func inversePairs(array: Array<Int>) -> Int {
    var tempArray = Array<Int>()
    var result = 0
    for item in array {
        result += inversePairsCore(array: &tempArray, item: item)
    }
    return result
}

print(inversePairs(array: []))
print(inversePairs(array: [2]))
print(inversePairs(array: [7,5,6,4]))

