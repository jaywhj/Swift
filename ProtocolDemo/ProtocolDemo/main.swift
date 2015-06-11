//
//  main.swift
//  ProtocolDemo
//
//  Created by JayWon on 14-11-4.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

import Foundation

/*
协议(Protocol)用于定义完成某项任务或功能所必须的方法和属性，协议实际上并不提供这些功能或任务的具体实现(Implementation)--而只用来描述这些实现应该是什么样的。类，结构体，枚举通过提供协议所要求的方法，属性的具体实现来采用(adopt)协议。任意能够满足协议要求的类型被称为协议的遵循者。
*/


//协议的语法

//MARK: - 1、协议的定义
protocol FirstProtocol {
    // 协议内容
}
protocol AnotherProtocol {
    // 协议内容
}



//MARK: - 2、实现协议
//在类型名称后加上协议名称，中间以冒号:分隔即可实现协议；实现多个协议时，各协议之间用逗号,分隔
struct SomeStructure: FirstProtocol, AnotherProtocol {
    // 结构体内容
}

//如果一个类在含有父类的同时也采用了协议，应当把父类放在所有的协议之前:
class SomeSuperClass{}
class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
    // 类的内容
}


//MARK: - 3、对属性的规定
//协议中的属性经常被加以var前缀声明其为变量属性，在声明后加上{ set get }来表示属性是可读写的，只读的属性则写作{ get }
protocol SomeProtocol {
    var mustBeSettable : Int { get set }
    var doesNotNeedToBeSettable: Int { get }
    //通常在协议的定义中使用class前缀表示该属性为类成员；在枚举和结构体实现协议时中，需要使用static关键字作为前缀。
    static var someTypeProperty: Int { get set }
}


//demo
protocol FullyNamed {
    var fullName: String { get }
}
struct Person: FullyNamed{
    var fullName: String
}

let john = Person(fullName: "John Appleseed")
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil ) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : " ") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
// ncc1701.fullName == "USS Enterprise"


//MARK: - 4、对方法的规定
protocol RandomNumberGenerator {
    func random() -> Double
}
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
println("Here's a random number: \(generator.random())")
// 输出 : "Here's a random number: 0.37464991998171"
println("And another one: \(generator.random())")
// 输出 : "And another one: 0.729023776863283"


//4.1、对变异方法的规定
protocol Togglable {
    mutating func toggle()
}
enum OnOffSwitch: Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()
//lightSwitch 现在的值为 .On



//MARK: - 5、对构造器的规定
protocol SProtocol {
    init()
}


class SSuperClass {
    init() {
        //协议定义
    }
}


class SSubClass: SSuperClass, SProtocol {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    //使用required修饰符可以保证：所有的遵循该协议的子类，同样能为构造器规定提供一个显式的实现或继承实现。
    required override init() {
        // 构造器实现
    }
}



//MARK: - 6、协议类型
/*
尽管协议本身并不实现任何功能，但是协议可以被当做类型来使用。
使用场景:
协议类型作为函数、方法或构造器中的参数类型或返回值类型
协议类型作为常量、变量或属性的类型
协议类型作为数组、字典或其他容器中的元素类型
*/
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}
var d6 = Dice(sides: 6,generator: LinearCongruentialGenerator())
for _ in 1...5 {
    println("Random dice roll is \(d6.roll())")
}
//输出结果
//Random dice roll is 3
//Random dice roll is 5
//Random dice roll is 4
//Random dice roll is 5
//Random dice roll is 4


//MARK: - 7、在扩展中添加协议成员
protocol TextRepresentable {
    func asText() -> String
}
extension Dice: TextRepresentable {
    func asText() -> String {
        return "A \(sides)-sided dice"
    }
}
let d12 = Dice(sides: 12,generator: LinearCongruentialGenerator())
println(d12.asText())
// 输出 "A 12-sided dice"


//MARK: - 8、通过扩展补充协议声明
struct Hamster {
    var name: String
    func asText() -> String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}
let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
println(somethingTextRepresentable.asText())
// 输出 "A hamster named Simon"


//MARK: - 9、集合中的协议类型
//协议类型可以被集合使用，表示集合中的元素均为协议类型
let things: [TextRepresentable] = [d12, simonTheHamster]
for thing in things {
    println(thing.asText())
}
// A 12-sided dice
// A hamster named Simon


//MARK: - 10、协议的继承
//协议能够继承一到多个其他协议。语法与类的继承相似，多个协议间用逗号，分隔
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // 协议定义
}

//MARK: - 11、类专属协议
//你可以在协议的继承列表中,通过添加“class”关键字,限制协议只能适配到类（class）类型。（结构体或枚举不能遵循该协议）。该“class”关键字必须是第一个出现在协议的继承列表中，其后，才是其他继承协议。
//协议SomeClassOnlyProtocol只能被类（class）类型适配。如果尝试让结构体或枚举类型适配该协议，则会出现编译错误。
protocol SomeClassOnlyProtocol: class, SomeProtocol, AnotherProtocol {
    // class-only protocol definition goes here
}

//MARK: - 12、协议合成
//一个协议可由多个协议采用protocol<SomeProtocol， AnotherProtocol>这样的格式进行组合，称为协议合成(protocol composition)。
//协议合成并不会生成一个新协议类型，而是将多个协议合成为一个临时的协议，超出范围后立即失效。
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct User: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(celebrator: protocol<Named, Aged>) {
    println("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}
let birthdayPerson = User(name: "Malcolm", age: 21)
wishHappyBirthday(birthdayPerson)
// 输出 "Happy birthday Malcolm - you're 21!


//MARK: - 13、检验协议的一致性
/*
is操作符用来检查实例是否遵循了某个协议。
as?返回一个可选值，当实例遵循协议时，返回该协议类型;否则返回nil
as用以强制向下转型。
@objc用来表示协议是可选的，也可以用来表示暴露给Objective-C的代码，此外，@objc型协议只对类有效，因此只能在类中检查协议的一致性
*/
@objc protocol HasArea {
    var area: Double { get }
}
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
   @objc  var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
    @objc var area: Double
    init(area: Double) { self.area = area }
}
class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}
let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]
for object in objects {
    if let objectWithArea = object as? HasArea {
        println("Area is \(objectWithArea.area)")
    } else {
        println("Something that doesn't have an area")
    }
}
// Area is 12.5663708
// Area is 243610.0
// Something that doesn't have an area


//MARK: - 14、对可选协议的规定
//可选协议含有可选成员，其遵循者可以选择是否实现这些成员。在协议中使用optional关键字作为前缀来定义可选成员。
//注意: 可选协议只能在含有@objc前缀的协议中生效。且@objc的协议只能被类遵循
@objc protocol CounterDataSource {
    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int { get }
}
@objc class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.incrementForCount?(count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}
class ThreeSource: CounterDataSource {
    let fixedIncrement = 3
}
var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    println(counter.count)
}
// 3
// 6
// 9
// 12
