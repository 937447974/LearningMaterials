//
//  55：字符流中第一个不重复的字符.swift
//  Offer
//
//  Created by 阳君 on 2017/3/27.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 请实现一个函数用来找出字符流中第一个只出现一次的字符。
// 例如，当从字符流中只读出前两个字符 “go” 时，第一个只出现一次的字符是 g。"google" 时是 "l"

import Foundation

func firstOnce(str: String) -> String? {
    var onceSet = Set<Character>()
    var repeatSet = Set<Character>()
    for char in str.characters {
        if !repeatSet.contains(char) { // 未重复
            if !onceSet.insert(char).inserted { // 已插入
                onceSet.remove(char)
                repeatSet.insert(char)
            }
        }
    }
    guard onceSet.count > 0 else {
        return nil
    }
    for char in str.characters {
        if onceSet.contains(char) {
            return "\(char)"
        }
    }
    return nil
}



print("\(firstOnce(str: ""))")
print("\(firstOnce(str: "go"))")
print("\(firstOnce(str: "goog"))")
print("\(firstOnce(str: "google"))")
