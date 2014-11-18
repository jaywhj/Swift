//
//  Person.swift
//  ObjcCallSwiftCommand
//
//  Created by JayWon on 14-11-12.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

import Foundation

//如果此类需要被OC的类来调用，一定要继承自NSObject
class Person : NSObject{
    var name: String{
        willSet{
            NSLog("将要把名字设置为:" + name)
        }
    }
    override init()
    {
        self.name = ""
    }
    init(name: String)
    {
        self.name = name
    }
    func desc()
    {
        println("这是一个Swift的类，name: " + self.name)
    }
}