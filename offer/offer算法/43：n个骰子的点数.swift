//
//  43：n个骰子的点数.swift
//  Offer
//
//  Created by 阳君 on 2017/3/26.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 把 n 个骰子仍在地上，所有骰子朝上一面的点数之后为 s。
// 输入 n,打印出s的所有可能的值出现的概率

import Foundation

// n的次数为上一次n-1...n-6次数之和

func printProbability(n: Int) {
    guard n >= 2 else {
        if n == 1 {
            let probability = 1.0 / 6
            print(Array(repeating:probability, count:6))
        }
        return
    }
    var resultList = Array<Double>(repeating:0, count:6 * n + 1) // 脚标为显示的点数
    for index in 1...6 {
        resultList[index] = 1
    }
    var tempList =  resultList
    for index in 2 ... n {
        for points in index * 1 ... index * 6 {
            var sum = 0.0
            let start = points - 6 > 1 ? points - 6 : 1
            for onIndex in start..<points {
                sum += resultList[onIndex]
            }
            tempList[points] = sum
        }
        resultList = tempList
    }
    var sum = 0.0
    for index in n * 1 ... n * 6 {
        sum = sum + resultList[index]
    }
    var probabilityList = Array<Double>()
    for index in n * 1 ... n * 6 {
        print(resultList[index])
        probabilityList.append(resultList[index] / sum)
    }
    print(probabilityList)
}


printProbability(n: 2)


