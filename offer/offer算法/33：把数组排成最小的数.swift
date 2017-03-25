//
//  33：把数组排成最小的数.swift
//  Offer
//
//  Created by 阳君 on 2017/3/25.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 输入一个正整数数组，把数组里所有数字拼接起来排成一个数，打印能拼接出的所有数字中最小的一个。
// 例如输入["3","32","321"],则打印出最小数字321323

import Foundation

func printMinNumber(numbers: Array<String>) {
    let result = numbers.sorted { (str1: String, str2: String) -> Bool in
        var str1 = str1
        var str2 = str2
        let str1L = (str1 as NSString).length
        let str2L = (str2 as NSString).length
        if str1L < str2L {
            let index = str2.index(str2.startIndex, offsetBy: str2L - str1L)
            str1 += str2.substring(to: index)
        } else if str1L > str2L {
            let index = str1.index(str1.startIndex, offsetBy: str1L - str2L)
            str2 += str1.substring(to: index)
        }
        return str1 < str2
    }
    print(result.joined())
}

printMinNumber(numbers: ["3","32","321"])
