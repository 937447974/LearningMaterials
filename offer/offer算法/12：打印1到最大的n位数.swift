//
//  12：打印1到最大的n位数.swift
//  Offer
//
//  Created by 阳君 on 2017/3/23.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 输入数字n，按顺序打印出从1到最大的n位十进制数。比如输入3，则打印出1，2，3...999

import Foundation

private func printToMax(number: String, n: Int) {
    guard n > 0 else {
        print("\(number)")
        return
    }
    let nextN = n - 1
    if number == "" {
        printToMax(number: "", n: nextN)
    } else {
        printToMax(number: number + "0", n: nextN)
    }
    for i in 1...9 {
        printToMax(number: number + "\(i)", n: nextN)
    }
}

func printToMax(n: Int) {
    printToMax(number: "", n: n)
}

printToMax(n: -1)
printToMax(n: 0)
printToMax(n: 1)
printToMax(n: 2)
