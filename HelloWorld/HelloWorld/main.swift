//
//  main.swift
//  HelloWorld
//
//  Created by JayWon on 14/6/4.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

import Foundation


/*
-------------------------------------------------------------
    Hello World
*/
println("Hello, World!")    //输出函数，跟Cocoa中NSLog函数是一个意思


/*
-------------------------------------------------------------
    注释
        1.//      单行注释
        2./**/    多行注释。需要注意的是，多行注释可以嵌套，这点和其他语言不一样，很实用的一个功能
*/


/*
-------------------------------------------------------------
    分号
        1.单行无需加分号，加了也没问题
        2.多个语句放在一行，需要加分号
*/


/*
-------------------------------------------------------------
    数据类型
*/
/* 常用数据类型
Int: Int8、Int16、Int32、Int64
UInt: UInt8、UInt16、UInt32、Uint64
Double
Float
Bool
String
Array
Dictionary
*/
//Swift还集成了Objective-C中所没有的“元组”(tuple)类型
//Swift还提供了可选类型Optional，用来处理一些未知的不存在的值


/*
-------------------------------------------------------------
    变量与常量
        1.变量的值可以根据需要不断修改，而常量的值是不能够被二次修改
        2.Swift使用var声明变量，let声明常量。
*/
/*
    类型推导：编译器在编译的时候 通过你提供的初始化值 自动推导出 特定的表达式的类型
*/
var myVariable = 42     //编译器自动推断其类型为Int
myVariable = 50         //变量的多次赋值需要保证值的类型是相同的
let myConstant = 12
//myConstant = 12         //错误，常量不能被二次修改
println(myConstant,myConstant)

//显示声明类型，语法："变量 : 类型名"
let double : Double = 70
let int : Int = 10  //显示声明类型，语法："变量 : 类型名"

//Swift不会自动给变量赋初始值，也就是说变量不会有默认值，所以要求使用变量之前必须要对其初始化
//var noValue     //错误，需要赋初始值


/*
-------------------------------------------------------------
    命名规则：Swift中可以使用几乎任何字符来作为常量和变量名，包括Unicode。但是不能含有数学符号，箭头，无效的Unicode，横线-和制表符，且不能以数字开头
*/
var π = 3.14
var 无限互联 = "学习iOS"
let 🐶 = "汪"
let cat = "🐱";
println(π)
println(无限互联)
println(🐶)
println(cat)


/*
-------------------------------------------------------------
    整型可以写成：
        一个十进制数，不带前缀
        一个二进制数，用前缀0b
        一个八进制数，用0o前缀
        一个十六进制数，以0x前缀
*/
let decimalInteger = 17
let binaryInteger = 0b10001     // 17 in binary notation
let octalInteger = 0o21         // 17 in octal notation
let hexadecimalInteger = 0x11   // 17 inhexadecimal notation

let minValue = UInt8.min        // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max        // maxValue is equal to 255, and is of type UInt8”


/*
-------------------------------------------------------------
    布尔（boolean）
*/
var tigerIsAnimal : Bool = true
var animalIsTiger = false


/*
-------------------------------------------------------------
    类型别名
        使用 关键字定义类型别名，类似typedef
*/
typealias NSInteger = Int
var value : NSInteger = 45
value = 12
println(value);


/*
-------------------------------------------------------------
    字符串(备选)
*/
let label = "The width is "
let width = 94
var widthLabel = label + String(width)  //Swift不支持隐式类型转换，需要显式类型转换
widthLabel += "!"
println(widthLabel)

//Swift使用\(item)的形式进行字符串格式化
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."



/*
-------------------------------------------------------------
    数组与字典
        使用[]操作符声明数组（array）和字典（dictionary）
*/
//数组
//Demo1: //声明空数组
//let emptyArray1: Array = []
//var emptyArray2 = Int[]()
let emptyArray1 = []
var emptyArray2 = [Int]()
let emptyArray3: Array<String> = []

//Demo2:
var shoppingList = ["芒果", "橘子", "水", "葡萄", "香蕉"]

//增加
shoppingList.append("苹果")
println(shoppingList)

shoppingList.insert("苹果", atIndex: 2)
println(shoppingList)


//shoppingList += "柚子"
shoppingList += ["柚子"]
println(shoppingList)

shoppingList += ["西瓜", "木瓜"]
println(shoppingList)

//常用方法
println(shoppingList.count)     //数组的个数
println(shoppingList.capacity)  //数组的容量, 值为大于count的 最小的2的n次方的数, 比如2、4、8、16
println(shoppingList.isEmpty)

//修改
shoppingList[1] = "哈密瓜"     //修改第一个元素的值
println(shoppingList)

shoppingList[4...7] = ["Bananas", "Apples"]     //把下标为4、5、6、7的元素替换成后面的"Bananas", "Apples"， 值变了，count减少了
println(shoppingList)

//删除
shoppingList.removeLast()
println(shoppingList)

shoppingList.removeAtIndex(4)   //需要index < count
println(shoppingList)

//shoppingList.removeAll()
//println(shoppingList)

//数组遍历
for item in shoppingList {
    println(item)
}

for (index, value) in enumerate(shoppingList) {
    println("Item \(index + 1): \(value)")
}


//Demo3:
var threeDoubles = [Double](count: 3, repeatedValue: 0.0)       //[0.0, 0.0, 0.0]
println(threeDoubles)

var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.5)   //[2.5, 2.5, 2.5]
println(anotherThreeDoubles)

var sixDoubles = threeDoubles + anotherThreeDoubles             //[0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
println(sixDoubles)




/* 字典（key : value）*/
//如果类型信息已知，使用[:]声明空字典。
let emptyDictionary1 = [:]
let emptyDictionary2 = Dictionary<String, Float>()
let emptyDictionary3 = [String: Float]()
println(emptyDictionary2.count)

//var airports: Dictionary<String, String> = ["TYO": "Tokyo", "DUB": "Dublin"]
var airports = ["TYO": "Tokyo", "DUB": "Dublin"]
println(airports["TYO"])

//添加、修改
airports["LHR"] = "London"
println(airports)

airports["LHR"] = "London Heathrow" // the value for "LHR" has been changed to "London Heathrow
println(airports)

airports.updateValue("Dublin International", forKey: "DUB")
println(airports)

//删除
airports["LHR"] = nil
println(airports)

airports.removeValueForKey("DUB")
println(airports)


println("airports count is " + String(airports.count))
println("The dictionary of airports contains \(airports.count) items.")

println(airports.startIndex)
println(airports.endIndex)


//遍历字典
for (airportCode, airportName) in airports {
    println("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    println("Airport code: \(airportCode)")
}

for airportName in airports.values {
    println("Airport name: \(airportName)")
}

let airportCodes = Array(airports.keys)     // airportCodes is ["TYO", "LHR"]
let airportNames = Array(airports.values)   // airportNames is ["Tokyo", "London Heathrow"]
println(airportCodes)
println(airportNames)



/*
-------------------------------------------------------------
    元组类型(tuple)
        元组类型可以将任意数据类型组装成一个元素
        元组类型在作为函数返回值的时候特别适用，可以为函数返回更多的用户需要的信息。
*/

//创建元组1
let (x, y) = (1, 2)
//访问元组 - key、value对应方式
println("x is \(x) and y is \(y)")


//创建元组2
let http404Error = (404, "Not Found")   //由一个Int和一个字符串String组成
println(http404Error)

let (statusCode, statusMessage) = http404Error      //指名value的key。statusCode对应值404，statusMessage对应值"Not Found"
println("The status code is \(statusCode)")         //访问第一个值
println("The status message is \(statusMessage)")   //访问第二个值

//如果仅需要元组中的个别值，可以使用(_)来忽略不需要的值
let (justTheStatusCode, _) = http404Error
println("The status code is \(justTheStatusCode)")  //仅需要第一个值

//访问元组 - 序号访问方式，序号从0开始
println("The status code is \(http404Error.0)")     //访问第一个值
println("The status message is \(http404Error.1)")  //访问第二个值


//创建元组3
let http200Status = (statusCode: 200, description: "OK")
println("The status code is \(http200Status.statusCode)")
println("The status message is \(http200Status.description)")


/*
-------------------------------------------------------------
    可选类型（变量名: 类型?）
        这个值要么存在，并且等于x，要么根本不存在。
        可选类型类似于Objective-C中指针的nil值，但是nil只对类(class)有用，指对象不存在，而Swift 的 nil 不是指针，它代表特定类型的值不存在。任何类型的可选类型都能赋值为 nil，而不仅限于对象类型。并且更安全。
*/
let possibleNumber = "123"
//let possibleNumber = "Hello"

//由于toInt方法可能会失败，因此它会返回一个可选的Int类型，而不同于Int类型。一个可选的Int类型被记为Int?，不是Int。问号表明它的值是可选的，可能返回的是一个Int，或者返回的值不存在。
let convertedNumber:Int? = possibleNumber.toInt()// convertedNumber is inferred to be of type "Int?", or "optional Int"

var serverResponseCode: Int? = 404  //要么存在，且值为404
serverResponseCode = nil            //要么不存在。要将可选变量设为值不存在的状态，可以给它赋特殊值 nil



/*nil 不能用于非可选量。
    如果代码中的常量或变量需要适配值不存在的特殊情况，务必将它声明为恰当的可选类型。
    如果定义的可选量时不提供默认值，该常量或变量将自动设为 nil
*/
//var strValue = nil  //错误
var strValue : String?


//判断一个Optional的值是否有值，可以用if来判断
if (strValue != nil) {
    //do sth with strValue
}

/* 使用Optional值
    在使用Optional值的时候需要在具体的操作，比如调用方法、属性、下标索引等前面需要加上一个?
    问号的意思是询问是否响应后面这个方法，和原来的isResponseToSelector有些类似
*/
let hashValue = strValue?.hashValue     //strValue是Optional的字符串，如果strValue是nil，则hashValue也为nil，如果strValue不为nil，hashValue就是strValue字符串的哈希值
//let hashValue = strValue.hashValue      //错误。对于Optional值，不能直接进行操作
println("hashValue is \(hashValue)")

/*总结 ? 使用场景
    声明Optional值变量
    用在对Optional值操作中，用来判断是否能响应后面的操作
*/



/* 解包(!的用法)
    如果确定一个可选类型的对象的值一定存在，那么我们使用 ！进行解包获取它的值，或者使用Optional Binding。
*/
let possibleString: String? = "An optional string."
println(possibleString!) // 解包，我确定possibleString的值一定存在，不需要每次验证值是否存在

let stringValue = possibleString!.hashValue   //解包，这里的!表示“我确定这里的的possibleString一定是非nil的，尽情调用吧”

//Optional Binding，等价于上面一行
if let sValue = possibleString{
    let stringValue = sValue.hashValue
}


/*
考虑下这一种情况，我们有一个自定义的MyViewController类，类中有一个属性是myLabel，myLabel是在viewDidLoad中进行初始化。因为是在viewDidLoad中初始化，所以不能直接声明为普通值：var myLabel : UILabel，因为非Optional的变量必须在声明时或者构造器中进行初始化，但我们是想在viewDidLoad中初始化，所以就只能声明为Optional：var myLabel: UILabel?
虽然我们确定在viewDidLoad中会初始化，并且在ViewController的生命周期内不会置为nil，但是在对myLabel操作时，每次依然要加上!来强制拆包(?也OK)，比如:

myLabel!.text = "text"
myLabel!.frame = CGRectMake(0, 0, 10, 10)

对于这种类型的值，我们可以直接这么声明：var myLabel: UILabel!, 这种是特殊的Optional，称为Implicitly Unwrapped Optionals, 直译就是隐式拆包的Optional，就等于说你每次对这种类型的值操作时，都会自动在操作前补上一个!进行拆包
*/

//你可以把 隐式解包可选类型 当成对每次使用的时候自动解包的可选类型。即不是每次使用的时候 在变量/常量后面加！，而是直接在定义的时候加！
let assumedString: String! = "An implicitly unwrapped optionalstring."
println(assumedString)      //访问其值时无需感叹号



/*总结 ! 使用场景
    强制对Optional值进行解包(unwrap)
    声明 隐式拆包的可选类型（Implicitly Unwrapped Optionals）值，一般用于类中的属性
*/