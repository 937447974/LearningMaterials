//
//  49：把字符串转换成整数.swift
//  Offer
//
//  Created by 阳君 on 2017/3/23.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

import Foundation

enum NumberError: Error {
    case IllegalInput
}

func charToNmuber(char: Character) throws -> Int {
    switch char {
    case "0":
        return 0
    case "1":
        return 1
    case "2":
        return 2
    case "3":
        return 3
    case "4":
        return 4
    case "5":
        return 5
    case "6":
        return 6
    case "7":
        return 7
    case "8":
        return 8
    case "9":
        return 9
    default:
        throw NumberError.IllegalInput
    }
}

func stringToNumber(str: String) throws -> Int  {
    guard str != "" else {
        return 0
    }
    var positive = 1
    var str = str
    let index = str.index(str.startIndex, offsetBy: 1)
    if str.hasPrefix("+") {
        str = str.substring(from: index)
    } else if str.hasPrefix("-") {
        str = str.substring(from: index)
        positive = -1
    }
    var result = 0
    for char in str.characters {
        do {
            result = try result * 10 + charToNmuber(char: char)
        } catch {
            throw error
        }
    }
    return positive * result
}


print("\(try? stringToNumber(str: "11"))")
print("\(try? stringToNumber(str: ""))")
print("\(try? stringToNumber(str: "?11"))")
print("\(try? stringToNumber(str: "1+1"))")
print("\(try? stringToNumber(str: "-11"))")
print("\(try? stringToNumber(str: "+11"))")


