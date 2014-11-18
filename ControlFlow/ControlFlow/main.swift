//
//  main.swift
//  ControlFlow
//
//  Created by JayWon on 14-6-13.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

import Foundation


//for-in
for index in 1...5 {
    println("\(index) times 5 is \(index * 5)")
}

//如果不需要知道区间内每一项的值，你可以使用下划线（_）替代变量名来忽略对值的访问
//求3的10次幂
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
println("\(base) to the power of \(power) is \(answer)")

//for-in 遍历数组
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    println("Hello, \(name)!")
}

//for-in 遍历字典
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    println("\(animalName)s have \(legCount) legs")
}

//for-in 遍历字符串
for character in "Hello" {
    println(character)
}


//for条件递增（for-condition-increment）
for var index = 0; index < 3; ++index { //不需要使用小括号
    println("index is \(index)")
}


//while循环
var va = 1
while va < 5 {
    println("while index is \(va)")
    va++
}


//do-while循环
var vb = 1
do {
    println("do while index is \(vb)")
    vb++
} while vb < 5


//if
let 今天天气好 = true
if 今天天气好 {
    println("我们就去爬山")
} else {
    println("在教室学习")
}


//switch
/*
Swift 中的switch，当匹配的 case 分支中的代码执行完毕后，程序会终止switch语句，而不会继续执行下一个 case 分支。这也就是说，不需要在 case 分支中显式地使用break语句。这使得switch语句更安全、更易用，也避免了因忘记写break语句而产生的错误
*/
let charA: Character = "a"
switch charA {
    case "a", "A":  //如果想匹配多个条件，可以在一个case里面把多个条件用（，）隔开
        println("The letter a") //每一个 case 分支都必须包含至少一条语句
    case "A":
        println("The letter A")
    default:
        println("default")
}


//case 分支的模式也可以是一个值的区间范围
//使用范围匹配来输出任意数字对应的自然语言格式
let count = 3_000_000_000_000
let countedThings = "stars in the Milky Way"
var naturalCount: String
switch count {
    case 0:
        naturalCount = "no"
    case 1...3:
        naturalCount = "a few"
    case 4...9:
        naturalCount = "several"
    case 10...99:
        naturalCount = "tens of"
    case 100...999:
        naturalCount = "hundreds of"
    case 1000...999_999:
        naturalCount = "thousands of"
    default:
        naturalCount = "millions and millions of"
}
println("There are \(naturalCount) \(countedThings).")
// 输出 "There are millions and millions of stars in the Milky Way.




//可以使用元组在同一个switch语句中测试多个值。元组中的元素可以是值，也可以是范围。另外，使用下划线（_）来匹配 所有可能的值。
//使用一个(Int, Int)类型的元组来分类下图中的点(x, y)
let somePoint = (1, 1)
switch somePoint {
    case (0, 0):
        println("(0, 0) is at the origin")
    case (_, 0):
        println("(\(somePoint.0), 0) is on the x-axis")
    case (0, _):
        println("(0, \(somePoint.1)) is on the y-axis")
    case (-2...2, -2...2):
        println("(\(somePoint.0), \(somePoint.1)) is inside the box")
    default:
        println("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}
// 输出 "(1, 1) is inside the box”
//Swift 允许多个 case 匹配同一个值。实际上，在这个例子中，点(0, 0)可以匹配所有四个 case。但是，如果存在多个匹配，那么只会执行第一个被匹配到的 case 分支



//值绑定（Value Bindings）
//在一个(Int, Int)类型的元组中使用值绑定来分类下图中的点(x, y)
let anotherPoint = (2, 0)
switch anotherPoint {
    case (let x, 0):    //此时x只是一个占位符，用来临时的获取switch条件中的一个或多个值
        println("on the x-axis with an x value of \(x)")
    case (0, let y):
        println("on the y-axis with a y value of \(y)")
    case let (x, y):
        println("somewhere else at (\(x), \(y))")
}
// 输出 "on the x-axis with an x value of 2”




//Where
//case 分支可以使用where语句来判断额外的条件
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
    case let (x, y) where x == y:   //把值赋给x,y，并且要求x等于y
        println("(\(x), \(y)) is on the line x == y")
    case let (x, y) where x == -y:
        println("(\(x), \(y)) is on the line x == -y")
    case let (x, y):
        println("(\(x), \(y)) is just some arbitrary point")
}
// 输出 "(1, -1) is on the line x == -y”







//控制传递语句（Control Transfer Statements）
//continue
//告诉一个循环体立刻停止本次循环迭代，重新开始下次循环迭代。就好像在说“本次循环迭代我已经执行完了,执行下一次吧”
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
        case "a", "e", "i", "o", "u", " ":
            continue
        default:
            puzzleOutput.append(character)
    }
}
println(puzzleOutput)


//Break
//循环语句中的 break
//当在一个循环体中使用break时，会立刻中断该循环体的执行，然后跳转到表示循环体结束的大括号(})后的第一行代码。不会再有本次循环迭代的代码被执行，也不会再有下次的循环迭代产生。
for index in 0..<5 {
    if index == 2 {
        continue
//        break
    }
    println("index: \(index)")
}

//Switch 语句中的 break
//当在一个switch代码块中使用break时，会立即中断该switch代码块的执行，并且跳转到表示switch代码块结束的大括号(})后的第一行代码。
let numberSymbol: Character = "三"
var possibleIntegerValue: Int = 0
switch numberSymbol {
    case "1", "١", "一", "๑":    //拉丁语、阿拉伯语、中文、泰语
        possibleIntegerValue = 1
    case "2", "٢", "二", "๒":
        possibleIntegerValue = 2
    case "3", "٣", "三", "๓":
        possibleIntegerValue = 3
    case "4", "٤", "四", "๔":
        possibleIntegerValue = 4
    default:
        break
}
println("The integer value of \(numberSymbol) is \(possibleIntegerValue).")
// 输出 "The integer value of 三 is 3.



//贯穿（Fallthrough）
//Swift 中的switch不会从上一个 case 分支自动落入到下一个 case 分支，如果确实需要这种效果，可以在每个需要该特性的 case 分支中使用fallthrough关键字
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
    case 2, 3, 5, 7, 11, 13, 17, 19:    //质数
        description += " a prime number, and also"
        fallthrough
    default:
        description += " an integer."
}
println(description)
// 输出 "The number 5 is a prime number, and also an integer.




//标签的语句（Labeled Statements）
/*
在 Swift 中，你可以在循环体和switch代码块中嵌套循环体和switch代码块来创造复杂的控制流结构。然而，循环体和switch都可以使用break语句来提前结束整个方法体。因此，显示地指明break语句想要终止的是哪个循环体或者switch代码块，会很有用。类似地，如果你有许多嵌套的循环体，显示指明continue语句想要影响哪一个循环体也会非常有用。
为了实现这个目的，你可以使用标签来标记一个循环体或者switch代码块，当使用break或者continue时，带上这个标签，可以控制该标签代表对象的中断或者执行。
*/

//根据分数评等级，超过100分跳过，遇到负数停止
var score = [96, 83, 43, 101, 66, 70, -5, 99]

First: for s in score {     //定义标签First
    switch s/10 {
        case 10:
            continue First  //使用标签
        case 9:
            println("\(s)分为优秀")
        case 8:
            println("\(s)分为良好")
        case 6...7:
            println("\(s)分为中等")
        case 0:
            break First     //使用标签，终止for循环。如果这里没使用标签，break的将是switch
        default:
            println("\(s)分为没及格")
    }
}

/*
//蛇和梯子 游戏
let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0      //方块
var diceRoll = 0    //骰子滚动

gameLoop: while square != finalSquare {
    if ++diceRoll == 7 {    //骰子+1了
        diceRoll = 1        //骰子从1到6
    }
    switch square + diceRoll {
        case finalSquare:
            // 到达最后一个方块，游戏结束
            break gameLoop
        case let newSquare where newSquare > finalSquare:
            // 超出最后一个方块，再掷一次骰子
            println(newSquare)
            continue gameLoop
        default:
            // 本次移动有效
            square += diceRoll
            square += board[square]
    }
}
println("Game over!")
*/
