//
//  SQLiteDemoTests.swift
//  SQLiteDemoTests
//
//  Created by JayWon on 14-11-6.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

import UIKit
import XCTest
import Foundation

//在Swift里面进行sqlite单元测试，需要导入sqlite头文件。而头文件导入是使用桥接的方式放在SQLiteDemo-Bridging-Header.h中，需要在 TARGETS -> SQLiteDemoTests -> Build Settings 中的 Objective-C Bridging Header 中添加上述.h文件

class SQLiteDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddUser() {
        var ps = Person(name:"无限互联", pwd:"admin", email:"123@qq.com", age:23)
        XCTAssertTrue(Database.instance.addUser(ps), "添加成功")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
