//
//  LQSingleton.m
//  LQRequest
//
//  Created by liquan1 on 13-8-22.
//  Copyright (c) 2013年 liquan. All rights reserved.
//

#import "LQSingleton.h"
#import "NSObject+PropertyArray.h"
@implementation LQSingleton
+(id)sharSingleton
{
    static LQSingleton *_currentUser;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _currentUser= [LQSingleton alloc];
    });
    return _currentUser;
}
-(ASIFormDataRequest *)requestWithModel:(BaseModel *)model onSucceeded:(SucceededBlock)succeededBlock onError:(ErrorBlock)errorBlock
{
    //Because the url is different so we do not need to set it dead
    //can't use method     [[ASIFormDataRequest alloc] init] to Start
    ASIFormDataRequest *_oaRequest = [ASIFormDataRequest requestWithURL:nil] ;
    //Automatically model into a NSDictionary Class;
    NSDictionary *modelDict=[model dictionaryWithValuesForKeys:[model allKeys]];
    for (NSString *keyString in [modelDict allKeys]) {
        //the postkey is modelDict.key ,PostValue is modelDict.key for value
        [_oaRequest setPostValue:[modelDict objectForKey:keyString] forKey:keyString];
    }
    [_oaRequest setCompletionBlock:^{
        succeededBlock();
    }];
    [_oaRequest setFailedBlock:^{
        errorBlock();
    }];
    return _oaRequest;
}
@end
