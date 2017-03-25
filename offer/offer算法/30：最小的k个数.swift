//
//  30：最小的k个数.swift
//  Offer
//
//  Created by 阳君 on 2017/3/25.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 输入n个整数，找出其中最小的k个数。
// 例如输入[1,2,3,4,5,6,7,8]，最小的4个数为[1,2,3,4]

import Foundation

private class KArray {
    
    private var k = 0
    private var array = Array<Int>()
    
    init(_ k: Int) {
        self.k = k
    }
    
    func append(_ newElement: Int) {
        if self.array.count == k && newElement > self.array.last! {
            return
        }
        self.array.append(newElement)
        self.array.sort()
        if self.array.count > k {            
            self.array.removeLast()
        }
    }
    
    func toArray() -> Array<Int> {
        return self.array
    }
    
}

func getLastNumbers(array: Array<Int>, k: Int) -> Array<Int> {
    guard k > 0 else {
        return []
    }
    guard array.count > k else {
        return array
    }
    let kArray = KArray(k)
    for item in array {
        kArray.append(item)
    }
    return kArray.toArray()
}



print(getLastNumbers(array: [], k: 14))
print(getLastNumbers(array: [8,7,6,1,2,3,4], k: 14))
print(getLastNumbers(array: [8,7,6,1,2,3,4], k: 4))





