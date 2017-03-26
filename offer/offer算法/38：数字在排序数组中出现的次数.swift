//
//  38：数字在排序数组中出现的次数.swift
//  Offer
//
//  Created by 阳君 on 2017/3/26.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 统计一个数字在排序数组中出现的次数。
// 例如输入排序数组[1,2,3,3,3,3,4,5]和数字3，则返回3出现的次数4。

import Foundation

private func getNumberIndex(array: Array<Int>, k: Int, start: Int, end: Int) -> (start: Int, end: Int) {
    var start = start
    var end = end
    if start == end {
        return array[start] == k ? (start, start) : (-1, -1)
    } else if start + 1 == end {
        if array[start] == k && array[end] == k {
            return (start, end)
        } else if array[start] == k {
            return (start, start)
        } else if array[end] == k {
            return (end, end)
        }
        return (-1, -1)
    }
    
    let middle = (start + end) / 2
    if k == array[middle] {
        start = getNumberIndex(array: array, k: k, start: start, end: middle).start
        end = getNumberIndex(array: array, k: k, start: middle, end: end).end
        return (start, end)
    } else if k < array[middle] {
        return getNumberIndex(array: array, k: k, start: start, end: middle)
    } else {
        return getNumberIndex(array: array, k: k, start: middle, end: end)
    }
}

func getNmuber(array: Array<Int>, k: Int) -> Int {
    guard array.count != 0 else {
        return 0
    }
    let index = getNumberIndex(array: array, k: k, start: 0, end: array.count-1)
    guard index.start != -1 else {
        return 0
    }
    return index.end - index.start + 1
}

//print("\(getNmuber(array:[], k: 2))")
//print("\(getNmuber(array:[2], k: 2))")
//print("\(getNmuber(array:[2,2,3,4], k: 2))")
//print("\(getNmuber(array:[2,2,2,2], k: 2))")
