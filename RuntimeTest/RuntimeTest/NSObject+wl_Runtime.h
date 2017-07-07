//
//  NSObject+wl_Runtime.h
//  RuntimeTest
//
//  Created by dinpay on 2017/7/7.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (wl_Runtime)


/**
 获取成员变量列表,包括属性生成的成员变量

 @return 返回成员变量列表数组
 */
+ (NSArray *)fetchIvarList;

/**
 获取属性列表，包括私有与公有的属性，以及分类中的属性
 
 @return 返回属性数组
 */
+ (NSArray *)fetchPropertyList;

/**
 获取对象方法列表，包括 setter 与 getter 方法
 
 @return 返回对象方法列表数组
 */
+ (NSArray *)fetchInstanceMethodList;

/**
 获取类方法列表
 
 @return 返回类方法列表数组
 */
+ (NSArray *)fetchClassMethodList;

/**
 获取协议列表，包括 .h 与 .m 以及分类
 
 @return 返回协议列表数组
 */
+ (NSArray *)fetchProtocolList;


/**
  交换两个实例方法

 @param originInstanceMethod 原始的实例方法
 @param currentInstanceMethod 要交换的实例方法
 */
+ (void)swapInstanceMethod:(SEL)originInstanceMethod currentInstanceMethod:(SEL)currentInstanceMethod;

/**
 交换两个类方法
 
 @param originClassMethod 原始的类方法
 @param currentClassMethod 要交换的类方法
 */
+ (void)swapClassMethod:(SEL)originClassMethod currentClassMethod:(SEL)currentClassMethod;

@end
