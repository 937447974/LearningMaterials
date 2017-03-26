//
//  44：扑克牌的顺子.swift
//  Offer
//
//  Created by 阳君 on 2017/3/26.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 从扑克牌随机抽5张牌，判断是不是一个顺子，即这5张牌是不是连续的。
// A=1, J=11, Q=12, K=13, 而大、小王=0可以看成任意数字。

import Foundation

func isContinuous(numbers: Array<Int>) -> Bool {
    guard numbers.count >= 5 && numbers.count <= 13 else {
        return false
    }
    var zeroCount = 0
    var repeatSet = Set<Int>()
    for number in numbers {
        if number == 0 {
            zeroCount += 1
        } else if !repeatSet.insert(number).inserted { // 是否有重复数字
            return false
        }
    }
    guard zeroCount <= 2 else { // 最多2个王
        return false
    }
    let sortList = repeatSet.sorted()
    if sortList.count - (sortList.last! - sortList.first! + 1) + zeroCount >= 0 { // 小到大连续
        return true
    }
    zeroCount = zeroCount - (sortList.first! - 1) - (13 - sortList.last!)
    if zeroCount >= 0 { // 有..13、1..连续可能
        var min = sortList.first!
        var max = sortList.last!
        var minIndex = 1
        var maxIndex = sortList.count - 2
        while minIndex < maxIndex {
            while minIndex < maxIndex && min + 1 == sortList[minIndex] {
                min = sortList[minIndex]
                minIndex += 1
            }
            while minIndex < maxIndex && max - 1 == sortList[maxIndex] {
                max = sortList[maxIndex]
                maxIndex -= 1
            }
            if minIndex < maxIndex {
                if sortList[minIndex] - min < max - sortList[maxIndex] {
                    zeroCount = zeroCount - (sortList[minIndex] - min - 1 )
                    min = sortList[minIndex]
                    minIndex += 1
                } else {
                    zeroCount = zeroCount - (max - sortList[maxIndex] - 1)
                    max = sortList[maxIndex]
                    maxIndex -= 1
                }
            }
        }
        if sortList[minIndex] - min < max - sortList[maxIndex] {
            zeroCount = zeroCount - (sortList[minIndex] - min - 1 )
        } else {
            zeroCount = zeroCount - (max - sortList[maxIndex] - 1)
        }        
        if zeroCount >= 0 {
            return true
        }
    }
    return false
}


print(isContinuous(numbers: []))
print(isContinuous(numbers: [1,2,3,3,5]))
print(isContinuous(numbers: [1,2,3,4,5]))
print(isContinuous(numbers: [1,2,3,4,13]))
print(isContinuous(numbers: [1,0,3,0,13]))
print(isContinuous(numbers: [2,0,4,0,12]))

