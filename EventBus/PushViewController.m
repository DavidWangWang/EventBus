//
//  PushViewController.m
//  EventBus
//
//  Created by 王宁 on 2018/11/12.
//  Copyright © 2018年 王宁. All rights reserved.
//

#import "PushViewController.h"
#import "EventBus.h"
#import "Event.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[EventBus share] addObserver:self key:@"identify" callback:^(Event * _Nonnull event) {
        NSLog(@"%@",event.userInfo);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    Event *event1 = [[Event alloc]init];
    event1.key = @"identify";
    event1.userInfo = @"这牛逼";
    [[EventBus share] postEvent:event1];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
