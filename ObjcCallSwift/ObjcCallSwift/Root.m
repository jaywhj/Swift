//
//  Root.m
//  ObjcCallSwiftCommand
//
//  Created by JayWon on 14-11-12.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Root.h"

//Objective-c调用Swift
//需要导入固定的头文件，此头文件项目里面找不到，但却是存在。并且会自动把Swift类转换成OC的类，在里面能找到
//格式为 #ProductName#-Swift.h
#import <ObjcCallSwift-Swift.h>


@implementation Root

-(void)desc
{
    Person *ps = [[Person alloc] initWithName:@"Rose"];
    ps.name = @"Jack";
    [ps desc];
}

-(Person *)returnPerson
{
    Person *ps = [[Person alloc] initWithName:@"Tom"];
    return ps;
}

@end
