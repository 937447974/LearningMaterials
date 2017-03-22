//
//  2实现Singleton模式.swift
//  Demo
//
//  Created by 阳君 on 2017/3/22.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

// 设计一个类，我们只能生成该类的一个实例。

import Foundation

class Singleton: NSObject {
    
    private static var shared = Singleton()
    
    class func singleton() -> Singleton {
        return self.shared
    }
}

print("\(Singleton.singleton())")
