//
//  8：旋转数组的最小数字.swift
//  Offer
//
//  Created by 阳君 on 2017/3/23.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。
// 输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。
// 例如数组 [3,4,5,1,2] 为 [1,2,3,4,5] 的一个旋转，该数组的最小值为 1。

import Foundation

func min(array: Array<Int>) -> Int? {
    guard array.count != 0 else {
        return nil
    }
    var index1 = 0
    var index2 = array.count - 1
    var indexMid = index1
    while array[index1] >= array[index2] {
        if index1 == index2 || index1 + 1 == index2 {
            return array[index2]
        }
        indexMid = (index1 + index2) >> 1
        if array[index1] <= array[indexMid] {
            index1 = indexMid
        } else if array[indexMid] <= array[index2] {
            index2 = indexMid
        }
    }
    return array[indexMid]
}


print("\(min(array: []))")
print("\(min(array: [3]))")
print("\(min(array: [3,3]))")
print("\(min(array: [3,3,3,3,3]))")
print("\(min(array: [3,4,5,1,2]))")
print("\(min(array: [1,2,3]))")
