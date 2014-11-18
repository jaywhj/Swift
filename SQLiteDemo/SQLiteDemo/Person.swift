//
//  Person.swift
//  SQLiteDemo
//
//  Created by JayWon on 14-11-6.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

import Foundation

class Person {
    var name: String?
    var password: String?
    var email: String?
    var age: Int?
    
    init(){}
    
    init(name:String, pwd:String, email:String, age:Int)
    {
        self.name = name
        self.password = pwd
        self.email = email
        self.age = age
    }
}
