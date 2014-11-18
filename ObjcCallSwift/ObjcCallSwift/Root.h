//
//  Root.h
//  ObjcCallSwiftCommand
//
//  Created by JayWon on 14-11-12.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

//Objective-c 的头文件如果需要引用Swift的类，则可以使用下面这种方式
@class Person;

@interface Root : NSObject

-(Person *)returnPerson;
-(void)desc;

@end
