//
//  Func.c
//  Functions
//
//  Created by JayWon on 14-6-25.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#include <stdio.h>

//1、定义函数
int sum1(int a, int b)
{
    return a+b;
}

void desc1()
{
    //2、声明函数指针
    int (*p)(int, int);
    
    //3、函数指针指向函数
    p = sum1;
    
    //4、使用
    int result = p(10, 20);
    printf("C函数输出result:%d\n", result);
}