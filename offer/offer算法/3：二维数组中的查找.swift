//
//  3：二维数组中的查找.swift
//  Demo
//
//  Created by 阳君 on 2017/3/22.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。
// 请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

// 如 1 2 8 9
//    2 4 9 12
//    4 7 10 13
//    6 8 11 15
// 查找 7 返回 true，查找 5 返回false

import Foundation

func find(number: Int, inArray array: Array<Array<Int>>) -> Bool {
    guard array.count != 0 && array.first?.count != 0 else {
        return false
    }
    var row = 0
    var column = array.first!.count - 1
    var section = array[row]
    while column > 0 {
        if section[column] == number {
            return true
        } else if section[column] < number {
            row += 1
            guard row < array.count else {
                return false
            }
            section = array[row]
            if column >= section.count {
                column = section.count - 1
            }
        } else {
            column -= 1
        }
    }
    return false
}

print("\(find(number: 2, inArray: []))")
let array = [[1, 2, 8, 9], [2, 4, 9, 12], [4, 7, 10, 13], [6, 8, 11, 15]]
print("\(find(number: 7, inArray: array))")
print("\(find(number: 5, inArray: array))")
print("\(find(number: 20, inArray: array))")
