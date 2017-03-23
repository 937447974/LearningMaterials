//
//  14：调整数组顺序使奇数位于偶数前面.swift
//  Offer
//
//  Created by 阳君 on 2017/3/23.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有奇数位于数组的前半部分，所有偶数位于数组的后半部分。

import Foundation


func reorderOddEvend(array: inout Array<Int>) {
    guard array.count != 0 else {
        return
    }
    var start = 0
    var end = array.count - 1
    while start < end {
        while start < end && array[start] & 1 == 1 {
            start += 1
        }
        while start < end && array[end] & 1 == 0 {
            end -= 1
        }
        if start < end {
            let temp = array[start]
            array[start] = array[end]
            array[end] = temp
        }
    }
}


var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
reorderOddEvend(array: &array)
print("\(array)")
