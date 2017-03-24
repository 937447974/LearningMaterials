//
//  20：顺时针打印矩阵.swift
//  Offer
//
//  Created by 阳君 on 2017/3/23.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。

import Foundation

private func printMatrixClockwisely(array: Array<Array<Int>>, start: Int, row: Int, colum: Int) {
    // 上左到上右
    for i in start ..< colum {
        print(array[start][i])
    }
    // 上右到下右
    if start + 1 < row {
        for i in start + 1 ..< row {
            print(array[i][colum - 1])
        }
    }
    // 下右到下左
    if start + 1 < row && start < colum - 1 {
        for i in (start ..< colum - 1).reversed() {
            print(array[row - 1][i])
        }
    }
    // 下左到上左
    if start + 1 < row - 1 && start < colum - 1 {
        for i in (start + 1 ..< row - 1).reversed() {
            print(array[i][start])
        }
    }
}

func printMatrixClockwisely(array: Array<Array<Int>>) {
    guard array.count != 0 else {
        return
    }
    let colums = array.first!.count
    guard colums != 0 else {
        return
    }
    for row in array {
        guard colums == row.count else {
            return
        }
    }
    var start = 0
    while start * 2 < array.count && start * 2 < colums  {
        printMatrixClockwisely(array: array, start: start, row: array.count - start, colum: colums - start)
        start += 1
    }
}


printMatrixClockwisely(array: [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16], [17,18,19,20]])
//printMatrixClockwisely(array: [[1,2,3,4], [5,6,7,8], [9,10,11,12]])
