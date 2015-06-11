//
//  main.swift
//  Enumeration
//
//  Created by JayWon on 14-10-7.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

import Foundation

//枚举语法
//不像 C 和 Objective-C 一样，Swift 的枚举成员在被创建时不会被赋予一个默认的整数值，North，South，East和West不是隐式的等于0，1，2和3
enum CompassPoint {
    case North
    case South
    case East
    case West
}

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Nepturn
}



var directionToHead = CompassPoint.West
directionToHead = .East

switch directionToHead {
case .North:
    println("Lots of planets have a north")
case .South:
    println("Watch out for penguins")
case .East:
    println("Where the sun rises")
case .West:
    println("Where the skies are blue")
default:
    println("Not a safe place for humans")
}



//实例值（Associated Values）
//你可以定义 Swift 的枚举存储任何类型的实例值，如果需要的话，每个成员的数据类型可以是各不相同的
enum Barcode {
    case UPCA(Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909_51226, 3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")


switch productBarcode {
case let .UPCA(numberSystem, identifier, check):
    println("UPC-A with value of \(numberSystem), \(identifier), \(check).")
case let .QRCode(productCode):
    println("QR code with value of \(productCode).")
}
// 输出 "QR code with value of ABCDEFGHIJKLMNOP.




//原始值（Raw Values）
//原始值可以是字符串，字符，或者任何整型值或浮点型值。每个原始值在它的枚举声明中必须是唯一的。当整型值被用于原始值，如果其他枚举成员没有值时，它们会自动递增。
enum PlanetRaw: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

//使用枚举成员的toRaw方法可以访问该枚举成员的原始值：
let earthsOrder = PlanetRaw.Earth.rawValue
// earthsOrder is 3

//使用枚举的fromRaw方法来试图找到具有特定原始值的枚举成员
//TODO: 需要修改
//let possiblePlanet = Planet.fromRaw(7)
//let possiblePlanet = ​Planet​(​rawValue​: ​7​)
// possiblePlanet is of type Planet? and equals Planet.Uranus




//GCD演示
//高效循环实现原理：将循环的每次迭代提交到dispatch queue进行处理，结合并发queue使用时，可以并发地 执行迭代 以提高性能。但是也不是任何一个循环都需要用dispatch_apply来替换，因为dispatch queue还是存在一些开销的，虽然非常小。所以只有当你的循环代码拥有足够的工作量，才能忽略掉dispatch queue的这些开销以提高性能。

var array = ["jack", "rose", "jay", "grace"];
//声明一个全局并发队列，类型是 dispatch_queue_t；DISPATCH_QUEUE_PRIORITY_DEFAULT为队列优先级，默认为0
var queue: dispatch_queue_t =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)


//开启一个线程
//dispatch_async(queue, { () -> Void in
//    println(NSThread.currentThread().isMainThread ? "这是主线程" : "这是后台线程")

    //第一个参数为次数；第三个参数 block块里面的形参是区分第几次。
    dispatch_apply(array.count, queue, { (index: Int) -> Void in
        println(String(index) + " --- " + array[Int(index)])
    })
    
//    //回调主线程，执行UI更新
//    dispatch_async(dispatch_get_main_queue(), { () -> Void in
//        println(NSThread.currentThread().isMainThread ? "这是主线程" : "这是后台线程")
//    })
//})
//
//
//NSRunLoop.currentRunLoop().run()

