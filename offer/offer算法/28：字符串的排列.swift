//
//  28：字符串的排列.swift
//  Offer
//
//  Created by 阳君 on 2017/3/25.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 输入一个字符串，打印出该字符串中的所有排列。
// 例如输入字符串abc,则打印出字符a、b、c所能排列出来的所有字符串abc、acb、bac、bca、cab 和 cba。

import Foundation

private func exchange(array: inout Array<String>, start: Int, end: Int) {
    guard array[start] != array[end] else {
        return
    }
    let temp = array[start]
    array[start] = array[end]
    array[end] = temp
}

private func permutation(strArray: inout Array<String>, path:Array<String>, start:Int) {
    if strArray.count == path.count {
        print(path.joined())
        return
    }
    var nextPath = path
    var exchangeSet = Set<String>()
    for index in start ..< strArray.count {
        if exchangeSet.insert(strArray[index]).inserted { // 已交换字母不做二次交换
            nextPath.append(strArray[index])
            exchange(array: &strArray, start: start, end: index)
            permutation(strArray: &strArray, path: nextPath, start: start+1)
            exchange(array: &strArray, start: index, end: start)
            nextPath.removeLast()
        }
    }
}

func permutation(str: String) {
    guard (str as NSString).length != 0 else {
        return
    }
    var charArray = Array<String>()
    for char in str.characters {
        charArray.append("\(char)")
    }
    permutation(strArray: &charArray, path: [], start: 0)
}

