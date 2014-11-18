//
//  main.swift
//  TypeCastingDemo
//
//  Created by JayWon on 14-11-4.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

//类型转换（Type Casting）
import Foundation

//类型转换在 Swift 中使用is 和 as操作符实现。这两个操作符提供了一种简单达意的方式去检查值的类型或者转换它的类型。

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

var movieCount = 0
var songCount = 0

//检查类型（Checking Type）
//用类型检查操作符(is)来检查一个实例是否属于特定子类型。
for item in library {
    if item is Movie {
        ++movieCount
    } else if item is Song {
        ++songCount
    }
}



//向下转型（Downcasting）
//某类型的一个常量或变量可能在幕后实际上属于一个子类。你可以尝试向下转到它的子类型，用类型转换操作符(as)
//因为向下转型可能会失败，类型转型操作符带有两种不同形式。可选形式（ optional form） as? 返回一个你试图下转成的类型的可选值（optional value）。强制形式 as 把试图向下转型和强制解包（force-unwraps）结果作为一个混合动作。
for item in library {
    if let movie = item as? Movie {
        println("Movie: '\(movie.name)', dir. \(movie.director)")
    } else if let song = item as? Song {
        println("Song: '\(song.name)', by \(song.artist)")
    }
}


//Any和AnyObject的类型转换
//Swift为不确定类型提供了两种特殊类型别名：
//1、AnyObject可以代表任何class类型的实例。
//2、Any可以表示任何类型，除了方法类型（function types）。

//AnyObject
let someObjects: [AnyObject] = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")
]
for movie in someObjects as [Movie] {
    println("Movie: '\(movie.name)', dir. \(movie.director)")
}


//Any
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))


for thing in things {
    switch thing {
    case 0 as Int:
        println("zero as an Int")
    case 0 as Double:
        println("zero as a Double")
    case let someInt as Int:
        println("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        println("a positive double value of \(someDouble)")
    case is Double:
        println("some other double value that I don't want to print")
    case let someString as String:
        println("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        println("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        println("a movie called '\(movie.name)', dir. \(movie.director)")
    default:
        println("something else")
    }
}
