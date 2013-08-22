//
//  BaseModel.h
//  LQRequest
//
//  Created by liquan1 on 13-8-22.
//  Copyright (c) 2013年 liquan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
//Automatically NSDictionary into a model Class;
-(id)initWithdictory:(NSDictionary *)jsonObject;

@end
