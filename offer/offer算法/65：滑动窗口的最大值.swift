//
//  65：滑动窗口的最大值.swift
//  Offer
//
//  Created by 阳君 on 2017/3/27.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 给定一个数组和滑动窗口的大小，请找出所有滑动窗口里的最大值。
// 如果输入数组 [2,3,4,2,6,2,5,1] 及滑动窗口的大小 3，
// 那么一共存在6个滑动窗口，它们的最大值分别为[4,4,6,6,6,5]

import Foundation

func maxInWindows(array: Array<Int>, size: Int) {
    guard array.count >= size else {
        return
    }
    
    var windows = Array<Int>()
    for index in 0 ..< size {
        windows.append(array[index])
    }
    var max = windows.max()!
    
    var result = [max]
    for index in size ..< array.count {
        let first = windows.removeFirst()
        let current = array[index]
        if max <= current {
            max = current
        } else if max == first {
            max = windows.max()!
        }
        windows.append(current)
        result.append(max)
    }
    print(result)
}


maxInWindows(array: [2,3,4,2,6,2,5,1], size: 3)

