//
//  52：构建乘积数组.swift
//  Offer
//
//  Created by 阳君 on 2017/3/27.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 给定一个数组 A[0,1...n-1]，请构建数组 B[0,1...n-1]。
// 其中B中的元素B[i] = A[0] * ... * A[i-1] * A[i+1] ... A[n-1]

// 解题思路
// C[i] = A[0] * ... * A[i-1] = C[i-1] * A[i-1]
// D[i] = A[i+1] ... A[n-1] = A[i+1] * D[i+1]
// B[i] = C[i] * D[i]

import Foundation

private func getCArray(aArray: Array<Int>) -> Array<Int> {
    var cArray = Array<Int>(repeating: 1, count: aArray.count)
    for index in 1 ..< aArray.count {
        cArray[index] = cArray[index - 1] * aArray[index - 1]
    }
    return cArray
}

private func getDArray(aArray: Array<Int>) -> Array<Int> {
    var dArray = Array<Int>(repeating: 1, count: aArray.count)
    for index in (0 ..< aArray.count - 1).reversed() {
        dArray[index] = dArray[index + 1] * aArray[index + 1]
    }
    return dArray
}

private func getBArray(cArray: Array<Int>, dArray: Array<Int>) -> Array<Int> {
    var bArray = Array<Int>()
    for index in 0 ..< cArray.count {
        bArray.append(cArray[index] * dArray[index])
    }
    return bArray
}

func multiply(aArray: Array<Int>) -> Array<Int> {
    guard aArray.count >= 2 else {
        return aArray
    }
    let cArray = getCArray(aArray: aArray)
    let dArray = getDArray(aArray: aArray)
    return getBArray(cArray: cArray, dArray: dArray)
}


print(multiply(aArray: []))
print(multiply(aArray: [1]))
print(multiply(aArray: [1,2]))
print(multiply(aArray: [1,2,3]))
print(multiply(aArray: [1,2,3,4]))


