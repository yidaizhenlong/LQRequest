//
//  ViewController.m
//  LQRequest
//
//  Created by liquan1 on 13-8-22.
//  Copyright (c) 2013年 liquan. All rights reserved.
//

#import "ViewController.h"
#import "LQSingleton.h"
#import "TestModel.h"
#define ShareSingeletong  ((LQSingleton*)[LQSingleton sharSingleton])

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self request];
}
-(void)request
{
    TestModel *model=[[[TestModel alloc] init] autorelease];
    model.name=@"test";
    model.passWorld=@"test";
  __block  ASIFormDataRequest *request=[ShareSingeletong requestWithModel:model onSucceeded:^{
      
  } onError:^{
      
  }];
    //Set your custom url
    [request setURL:[NSURL URLWithString:@"customurl"]];
    //if you wanto from file or another Special objects
    model.file=@"file";
    [request setFile:model.file forKey:model.file];
    [request setPostValue:[NSNumber numberWithInt:1] forKey:@"number"];
    [request startSynchronous];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
