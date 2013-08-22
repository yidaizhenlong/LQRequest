//
//  NSArray+PropertyArray.m
//  Method
//
//  Created by liquan1 on 13-8-22.
//  Copyright (c) 2013年 liquan. All rights reserved.
//

#import "NSObject+PropertyArray.h"
#import <objc/runtime.h>
@implementation NSObject (PropertyArray)
- (NSArray *) allKeys {
    Class clazz = [self class];
    u_int count;
    
    objc_property_t* properties = class_copyPropertyList(clazz, &count);
    NSMutableArray* propertyArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count ; i++) {
        const char* propertyName = property_getName(properties[i]);
        [propertyArray addObject:[NSString  stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
    }
    free(properties);
    
    return [NSArray arrayWithArray:propertyArray];
}
@end
