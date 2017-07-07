//
//  NSObject+wl_Runtime.m
//  RuntimeTest
//
//  Created by dinpay on 2017/7/7.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import "NSObject+wl_Runtime.h"
#import <objc/message.h>

@implementation NSObject (wl_Runtime)
/**
 获取成员变量列表,包括属性生成的成员变量
 
 @return 返回成员变量列表数组
 */
+ (NSArray *)fetchIvarList {
    
    unsigned int count;
    Ivar *ivarList = class_copyIvarList(self, &count);
    NSMutableArray *mutabArr = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; ++i) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
        const char *ivarName = ivar_getName(ivarList[i]);
        const char *ivarType = ivar_getTypeEncoding(ivarList[i]);
        [dic setValue:[NSString stringWithUTF8String:ivarType] forKey:@"ivarType"];
        [dic setValue:[NSString stringWithUTF8String:ivarName] forKey:@"ivarName"];
        
        
        [mutabArr addObject:dic];
    }
    free(ivarList);
    return [mutabArr copy];
}
/**
 获取属性列表，包括私有与公有的属性，以及分类中的属性
 
 @return 返回属性数组
 */
+ (NSArray *)fetchPropertyList {
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList(self, &count);
    NSMutableArray *mutabArr = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; ++i) {
        const char *propertyName = property_getName(propertyList[i]);
      //  const char *propertyAttributes = property_getAttributes(propertyList[i]);
        [mutabArr addObject:[NSString stringWithUTF8String:propertyName]];
    }
    free(propertyList);
    return [mutabArr copy];
}

/**
 获取对象方法列表，包括 setter 与 getter 方法
 
 @return 返回对象方法列表数组
 */
+ (NSArray *)fetchInstanceMethodList {
    unsigned int count;
    Method *methodList = class_copyMethodList(self, &count);
    NSMutableArray *mutabArr = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; ++i) {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        [mutabArr addObject:NSStringFromSelector(methodName)];
    }
    free(methodList);
    return [mutabArr copy];
}

/**
 获取类方法列表
 
 @return 返回类方法列表数组
 */
+ (NSArray *)fetchClassMethodList {
    unsigned int count;
    Method *methodList = class_copyMethodList([self class], &count);
    NSMutableArray *mutabArr = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; ++i) {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        [mutabArr addObject:NSStringFromSelector(methodName)];
    }
    free(methodList);
    return [mutabArr copy];
}

/**
 获取协议列表，包括 .h 与 .m 以及分类
 
 @return 返回协议列表数组
 */
+ (NSArray *)fetchProtocolList {
    unsigned int count;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(self, &count);
    NSMutableArray *mutabArr = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i  <count; ++i) {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        [mutabArr addObject:[NSString stringWithUTF8String:protocolName]];
    }
    free(protocolList);
    return [mutabArr copy];
}

/**
 交换两个实例方法
 
 @param originInstanceMethod 原始的实例方法
 @param currentInstanceMethod 要交换的实例方法
 */
+ (void)swapInstanceMethod:(SEL)originInstanceMethod currentInstanceMethod:(SEL)currentInstanceMethod {
    
}

/**
 交换两个类方法
 
 @param originClassMethod 原始的类方法
 @param currentClassMethod 要交换的类方法
 */
+ (void)swapClassMethod:(SEL)originClassMethod currentClassMethod:(SEL)currentClassMethod {
    
}

@end
