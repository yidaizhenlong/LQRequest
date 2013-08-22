//
//  LQSingleton.h
//  LQRequest
//
//  Created by liquan1 on 13-8-22.
//  Copyright (c) 2013年 liquan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "BaseModel.h"
typedef void (^SucceededBlock)();
typedef void (^ErrorBlock)();
@interface LQSingleton : NSObject
+(id)sharSingleton;
//only one request can work for all the project;
-(ASIFormDataRequest *)requestWithModel:(BaseModel *)model onSucceeded:(SucceededBlock) succeededBlock onError:(ErrorBlock) errorBlock;
@end
