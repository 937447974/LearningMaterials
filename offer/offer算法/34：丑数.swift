//
//  34：丑数.swift
//  Offer
//
//  Created by 阳君 on 2017/3/25.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 我们把只含因子 2、3 和 5 的数称为丑数。
// 求第 n 个丑数，1 为第一个丑数

import Foundation

func getUglyNmber(n: Int) -> Int {
    guard n > 1 else {
        return 1
    }
    var uglys = [1]
    var ugly2 = 2
    var ugly3 = 3
    var ugly5 = 5
    var ugly2Index = 1
    var ugly3Index = 1
    var ugly5Index = 1
    while uglys.count < n {
        if ugly2 <= ugly3 && ugly2 <= ugly5 {
            if ugly2 != uglys.last {
                uglys.append(ugly2)
            }
            ugly2 = uglys[ugly2Index] * 2
            ugly2Index += 1
        } else if ugly3 <= ugly2 && ugly3 <= ugly5 {
            if ugly3 != uglys.last {
                uglys.append(ugly3)
            }
            ugly3 = uglys[ugly3Index] * 3
            ugly3Index += 1
        } else if ugly5 <= ugly2 && ugly5 <= ugly3 {
            if ugly5 != uglys.last {
                uglys.append(ugly5)
            }
            ugly5 = uglys[ugly5Index] * 5
            ugly5Index += 1
        }
    }
    return uglys.last!
}


print(getUglyNmber(n: 0))
print(getUglyNmber(n: 1))
print(getUglyNmber(n: 6))
print(getUglyNmber(n: 7))

