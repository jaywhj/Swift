//
//  User.swift
//  CoreData
//
//  Created by JayWon on 14-11-11.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

import Foundation
import CoreData

//objc特性告诉编译器该声明可以在Objective-C代码中使用
@objc(User)
class User: NSManagedObject {

    /*
    NSManaged，与 Objective-C 里面的 @dynamic特性类似，不过仅能用于 Core Data 中
    该特性用于修饰NSManagedObject子类中的存储型变量属性，表明属性的存储和实现由Core Data在运行时基于相关实体描述动态提供
    */
    @NSManaged var userEmail: String
    @NSManaged var userID: NSNumber
    @NSManaged var userPawd: String

}
