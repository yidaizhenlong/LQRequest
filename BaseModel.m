//
//  BaseModel.m
//  LQRequest
//
//  Created by liquan1 on 13-8-22.
//  Copyright (c) 2013年 liquan. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
-(id)initWithdictory:(NSDictionary *)jsonObject
{
    if ([super init]) {
        [self setValuesForKeysWithDictionary:jsonObject];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@ error",key);
}
@end
