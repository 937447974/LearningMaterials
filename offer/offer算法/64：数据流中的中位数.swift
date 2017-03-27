//
//  64：数据流中的中位数.swift
//  Offer
//
//  Created by 阳君 on 2017/3/27.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 如何得到一个数据流中的中位数？如果从数据流中读出齐数个数值，那么中位数就是所有数值排序之后位于中间的数值。
// 如果从数据流中读出偶数个数值，那么中位数就是所有数值排序之后中间两个数的平均值。

import Foundation

private func partition(array: Array<Double>, item: Double, start: Int, end: Int) -> Int {
    guard array.count != 0 else {
        return 0
    }
    if item <= array[start] {
        return start
    } else if item > array[end] {
        return end + 1
    }
    
    let middle = (start + end) >> 1
    if item == array[middle] {
        return middle
    } else if item < array[middle] {
        return partition(array: array, item:item, start:start, end:middle - 1)
    }
    return partition(array: array, item:item, start:middle + 1, end:end)
}

func middle(array: Array<Double>) -> Double {
    guard array.count > 0 else {
        return 0
    }
    var middleStream = Array<Double>()
    for item in array {
        let index = partition(array: middleStream, item:item, start:0, end:middleStream.count - 1)
        middleStream.insert(item, at: index)
    }
    let middle = middleStream.count / 2
    if array.count % 2 != 0 {
        return middleStream[middle]
    }
    return (middleStream[middle-1] + middleStream[middle]) / 2.0
}

print(middle(array: [5, 4, 3, 2, 1]))
print(middle(array: [5, 4, 3, 2]))
print(middle(array: [5, 4, 3]))
print(middle(array: [5, 4]))
print(middle(array: [5]))
print(middle(array: []))

