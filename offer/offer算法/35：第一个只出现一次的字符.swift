//
//  35：第一个只出现一次的字符.swift
//  Offer
//
//  Created by 阳君 on 2017/3/25.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 在字符串中找出第一个只出现一次的字符。
// 如输入 abaccdeff，则输出 b

import Foundation

func firstNotRepeatingChar(str: String) -> String? {
    var chars = Dictionary<Character, Int>()
    for char in str.characters {
        if chars[char] == nil {
            chars[char] = 1
        } else {
            chars[char] = 2
        }
    }
    for char in str.characters {
        if chars[char] == 1 {
            return "\(char)"
        }
    }
    return nil
}


print("\(firstNotRepeatingChar(str: ""))")
print("\(firstNotRepeatingChar(str: "aa"))")
print("\(firstNotRepeatingChar(str: "acab"))")
