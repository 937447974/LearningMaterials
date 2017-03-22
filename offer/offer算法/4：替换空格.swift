//
//  4：替换空格.swift
//  Demo
//
//  Created by 阳君 on 2017/3/22.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 请实现一个函数，把字符串中的每个空格替换成 “%20”。
// 例如输入 “We are happy.” 则输出 “We%20are%20happy.”

import Foundation

func replaceBlank(str: String) -> String {
    var result = ""
    for char in str.characters {
        if char == " " {
            result += "%20"
        } else {
            result += "\(char)"
        }
    }
    return result
}

print(replaceBlank(str: "We are happy."))
print(replaceBlank(str: ""))
