//
//  42：翻转单词顺序VS左旋转字符串.swift
//  Offer
//
//  Created by 阳君 on 2017/3/26.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 1. 输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。
// 例如输入字符串“I am a student.”,则输出"student. a am I"

import Foundation

func reverseSentence(str: String) {
    var result = Array<String>()
    var temp = ""
    for char in str.characters {
        if char == " " {
            result.append(temp)
            temp = ""
        } else {
            temp += "\(char)"
        }
    }
    if temp != "" {
        result.append(temp)
    }
    // 上面等价 result = str.components(separatedBy: " ")
    result.reverse()
    print(result.joined(separator: " "))
}


reverseSentence(str: "I am a student.")



// 2. 字符串的左旋转操作是把字符串前面的若干字符转移到字符串的尾部。
// 请定义一个函数实现字符串左旋转操作的功能。
// 比如输入 “abcdefg” 和 2，则打印 “cdefgab”

func leftRotateString(str: String, n: Int) {
    guard (str as NSString).length > n  else {
        print(str)
        return
    }
    let index = str.index(str.startIndex, offsetBy: 2)
    print("\(str.substring(from: index))\(str.substring(to: index))")
}


leftRotateString(str: "ab", n: 2)
leftRotateString(str: "abcdefg", n: 2)
