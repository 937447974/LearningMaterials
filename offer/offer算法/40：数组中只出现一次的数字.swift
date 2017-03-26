//
//  40：数组中只出现一次的数字.swift
//  Offer
//
//  Created by 阳君 on 2017/3/26.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 一个整型数组里除了两个数字之外，其他的数字都出现了两次。
// 请写程序找出这两个只出现一次的数字。要求时间复杂度O(n)，空间复杂度是O(1)。

import Foundation

func find0Once(array: Array<Int>) -> Bool {
    var count = 0
    for item in array {
        if item == 0 {
            count += 1
            if count == 2 {
                return false
            }
        }
    }
    return count == 1
}

func findNumsApperaOnce(array: Array<Int>) -> (one: Int?, two:Int?) {
    if array.count == 0 {
        return (nil, nil)
    } else if array.count == 1 {
        return (array.first, nil)
    } else if array.count == 2 {
        if array[0] == array[1] {
            return (nil, nil)
        }
        return (array[0], array[1])
    }
    
    var exclusiveOR = 0
    for item in array {
        exclusiveOR = exclusiveOR ^ item
    }
    
    guard exclusiveOR != 0 else {
        if find0Once(array: array) {
            return (0, nil)
        }
         return (nil, nil)
    }
    
    var flag = 1
    while flag & exclusiveOR == 0 {
        flag = flag << 1
    }
    
    var one = 0
    var two = 0
    for item in array {
        if flag & item == 0 {
            one = one ^ item
        } else {
            two = two ^ item
        }
    }
    
    if one == 0 && !find0Once(array: array) {
        return (two, nil)
    }
    return (one, two)
}


print("\(findNumsApperaOnce(array: []))")
print("\(findNumsApperaOnce(array: [2]))")
print("\(findNumsApperaOnce(array: [2,2]))")
print("\(findNumsApperaOnce(array: [2,2,0]))")
print("\(findNumsApperaOnce(array: [2,2,3]))")
print("\(findNumsApperaOnce(array: [2,4,3,6,3,2,5,5]))")


