//
//  main.swift
//  StringDemo
//
//  Created by JayWon on 14-6-10.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

import Foundation


//1、字符
//用 Character 定义单个字符：
let money: Character = "￥"
var face: Character = "😱"
println(money)
println(face)

//Swift的字符串String就是由字符Character组成的，每一个Character都代表了一个特定的Unicode字符。通过for-in循环，可以遍历字符串中的每一个字符：
for character in "Dog!" {
    println(character)
}




//2、Swift中，字符串不是指针，而是实际的值
/*
在Swift中，一个String类型就是一个实际的值，当定义一个新的String，并且将之前的String值拷贝过来的时候，是实际创建了一个相等的新值，而不是仅仅像指针那样指向过去。

同样在函数传递参数的时候，也是传递的实际值，并且创建了一个新的字符串，后续的操作都不会改变原有的String字符串。
*/

//1、字符串常量
let someString = "ABC"


/*
字符串常量可以包括下面这些特殊字符：
    空字符\0，反斜杠\，制表符\t，换行符\n，回车符\r，双引号\”和单引号\’
    单字节Unicode字符，\xnn，其中nn是两个十六进制数
    双字节Unicode字符，\unnnn，其中nnnn是四个十六进制数
    四字节Unicode字符，\Unnnnnnnn，其中nnnnnnnn是八个十六进制数
*/

let wiseWords = " \"\" "
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496



//2、初始化一个空串
//初始化一个空串时有两种形式，但是两种初始化方法的结果都一样，表示空串
var emptyString = "" // empty string literal
var anotherEmptyString = String() // initializer syntax

//通过isEmpty属性可以检查一个字符串是否为空
if emptyString.isEmpty {
    println("Nothing to see here")
}


//3、变长字符串
//如果使用var关键词定义的字符串即为可修改的变长字符串，而let关键词定义的字符串是常量字符串，不可修改。
var variableString = "Horse"
variableString += " and carriage"   // variableString is now "Horse and carriage"
println(variableString)

let constantString = "Highlander"
//constantString += " and another Highlander" //错误


//6、字符计数
//Swift 中的字符在一个字符串中 并不一定占用相同的内存空间，需使用全局函数countElements计算一个字符串中字符的数量
let unusualMenagerie = "Koala , Snail , Penguin , Dromedary "
println("unusualMenagerie has \(countElements(unusualMenagerie)) characters")
// prints "unusualMenagerie has 40 characters"
/*
注意：通过 countElements 返回的字符数量并不总是与包含相同字符的 NSString 的 length 属性相同。NSString 的 length 属性是基于利用 UTF-16 编码的数目，而不是基于 Unicode 字符
*/


//7、组合使用字符和字符串
//String和Character类型可以通过使用+号相加来组合成一个新的字符串
var string1 = "hello"
var string2 = " there"
let character1: Character = "!"

string1.append(character1)    // equals "hello!"
let stringPlusString = string1 + string2                // equals "hello there"

//也可以使用+=号来组合：
var instruction = "look over"
instruction += string2  // instruction now equals "look over there"


//8、使用字符串生成新串
//通过现有的字符串，可以使用如下方法来生成新的字符串：
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"  // message is "3 times 2.5 is 7.5"



//9、字符串比较
//Swift提供三种方法比较字符串的值：字符串相等，前缀相等，和后缀相等


//9.1字符串相等
//当两个字符串的包含完全相同的字符时，他们被判断为相等。
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    println("These two strings are considered equal")
}


//前缀（prefix）、后缀(hasSuffix)相等
//通过调用字符串的 hasPrefix/hasSuffix 方法来检查字符串是否拥有特定前缀/后缀。两个方法均需要以字符串作为参数传入并返回 Boolean 值。两个方法均执行基本字符串和前缀/后缀字符串之间逐个字符的比较操作

let animals = ["食肉:老虎", "食肉:狮子", "食草:牛群", "食草:羊群", "食草:马群"]
//hasPrefix
var aCount = 0
for animal in animals {
    if animal.hasPrefix("食肉") {
        ++aCount
    }
}
println("这有\(aCount)头食肉动物")

//hasSuffix
var bCount = 0
for animal in animals {
    if animal.hasSuffix("群") {
        ++bCount
    }
}
println("这有\(bCount)群食草动物")


//10.大写和小写字符串
//您可以通过字符串的 uppercaseString 和 lowercaseString 属性来访问一个字符串的大写/小写版本。
let normal = "Could you help me, please?"
let shouty = normal.uppercaseString
println("shouty: " + shouty)
let whispered = normal.lowercaseString
println("whispered: " + whispered)



//11.Unicode
//字符串的 Unicode 表示
/*
Swift 支持多种不同的方式取得Unicode字符串：

1.以 Unicode 字符的方式访问每一个字符值
2.UTF-8 编码单元集合 (利用字符串的 utf8 属性进行访问)
3.UTF-16 编码单元集合 (利用字符串的 utf16 属性进行访问)
4.21位的 Unicode 标量值集合 (利用字符串的 unicodeScalars 属性进行访问)
*/

let dogString = "Dog!🐶"

for codeUnit in dogString.utf8 {    //UTF-8. 得到字符的utf8编码的值
    print("\(codeUnit) ")
}
print("\n")
// 68 111 103 33 240 159 144 182”

//UTF-16. 得到字符的utf16编码的值
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ")
}
print("\n")
// 68 111 103 33 55357 56374”


//Unicode 标量 (Unicode Scalars)你可以使用String类型的unicodeScalars属性遍历一个Unicode标量编码的字符
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ")
//    println("\(scalar) ")
}
print("\n")
// 68 111 103 33 128054”


