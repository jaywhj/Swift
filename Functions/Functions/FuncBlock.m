//
//  FuncBlock.m
//  Functions
//
//  Created by JayWon on 14-6-25.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "FuncBlock.h"

@implementation FuncBlock

//1、定义函数
int sum2(int a, int b)
{
    return a+b;
}

-(void)desc2
{
    //2、声明Block
    int (^p)(int, int);
    
    //3、函数指针指向函数
//    p = sum2;
    p = ^(int a, int b) //把函数赋值给Block
    {
        return a+b;
    };
    
    //4、使用
    int result = p(10, 40);
    printf("OC方法输出result:%d\n", result);
}

@end
