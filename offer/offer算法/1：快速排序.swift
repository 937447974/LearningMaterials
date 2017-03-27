//
//  1：快速排序.swift
//  Offer
//
//  Created by 阳君 on 2017/3/27.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

import Foundation

private func exchange(array: inout Array<Int>, one: Int, two: Int) {
    guard one != two else {
        return
    }
    let temp = array[one]
    array[one] = array[two]
    array[two] = temp
}

private func partition(array: inout Array<Int>, start: Int, end: Int) -> Int {
    var index = start
    let last = array[end]
    for i in start ..< end {
        if array[i] <= last {
            exchange(array: &array, one: index, two: i)
            index += 1
        }
    }
    exchange(array: &array, one: index, two: end)
    return index
}

private func quickSort(array: inout Array<Int>, start: Int, end: Int) {
    guard end > start else {
        return
    }
    let index = partition(array: &array, start: start, end: end)
    quickSort(array: &array, start: start, end: index - 1)
    quickSort(array: &array, start: index + 1, end: end)
}

func quickSort(array: Array<Int>) -> Array<Int> {
    guard array.count >= 1 else {
        return array
    }
    var result = array
    quickSort(array: &result, start: 0, end: array.count - 1)
    return result
}

