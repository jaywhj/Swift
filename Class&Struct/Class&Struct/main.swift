//
//  main.swift
//  Class&Struct
//
//  Created by JayWon on 14-10-18.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

import Foundation

/*
1、Swift 并不要求你为自定义类和结构去创建独立的接口和实现文件。你所要做的是在一个单一文件中定义一个类或者结构体，系统将会自动生成面向其它代码的外部接口。


2、Swift 中类和结构体有很多共同点。共同处在于：
    定义属性用于储存值
    定义方法用于提供功能
    定义下标用于通过下标语法访问值
    定义构造器用于生成初始化值
    通过扩展以增加默认实现的功能
    符合协议以对某类提供标准功能

结构体的主要目的是用来封装少量相关简单数据值。类还有如下的附加功能：
    继承允许一个类继承另一个类的特征
    类型转换允许在运行时检查和解释一个类实例的类型
    解构器允许一个类实例释放任何其所被分配的资源
    引用计数允许对一个类的多次引用


“结构体和枚举是值类型”
结构体总是通过被复制的方式在代码中传递（值传递或值拷贝），因此请不要使用引用计数
在 Swift 中，所有的基本类型：整数(Integer)、浮点数(floating-point)、布尔值(Booleans)、字符串(string)、数组(array)和字典(dictionaries)，都是值类型，并且都是以结构体的形式在后台所实现。

在 Swift 中，所有的结构体和枚举都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制。

*/


struct Resolution {
    var width = 0
    var height = 0
    
    func test(){
        println("test")
    }
}

//所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性
let vga = Resolution(width:640, height: 480)
let someResolution = Resolution()
println(vga.width)
println(someResolution.width)
someResolution.test()

//这样写错误
//someResolution.width = 23


class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someVideoMode = VideoMode()
//Swift 允许直接设置结构体属性的子属性
someVideoMode.resolution.width = 12880
println(someVideoMode.resolution.width)

//类是引用类型，引用的是已存在的实例本身而不是其拷贝。
let hd = Resolution(width: 1920, height: 1080)
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0


let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

/*
等价于 ( === )恒等于
不等价于 ( !== )
*/
if tenEighty === alsoTenEighty {
   println("tenEighty 与 alsoTenEighty 是等价的")
}
/*
“等价于 ===”表示两个类类型(class type)的常量或者变量引用同一个类实例。
“等于 ==”表示两个实例的值“相等”或“相同”
*/
