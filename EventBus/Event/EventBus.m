//
//  EventBus.m
//  EventBus
//
//  Created by 王宁 on 2018/11/12.
//  Copyright © 2018年 王宁. All rights reserved.
//

#import "EventBus.h"
#import "Event.h"
#import <objc/runtime.h>
#import "DisposeBag.h"
#import "Dispose.h"

@interface EventBus()

@property(strong,nonatomic)NSMutableDictionary *dict;

@end

static EventBus * _eventBus;
static void *name = &name;
@implementation EventBus

+ (instancetype)share
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _eventBus = [[EventBus alloc]init
                     ];
    });
    return _eventBus;
}

- (void)addObserver:(id)target key:(NSString *)key callback:(void (^)(Event *event))block
{
    NSAssert(key, @"key must exists");
    if (!key) return;
    DisposeBag *bag = objc_getAssociatedObject(target, name);
    if (!bag){
        bag = [[DisposeBag alloc]init];
        objc_setAssociatedObject(target, name, bag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSString *identify = [NSString stringWithFormat:@"%@",[NSDate date]];
    // 创建订阅者
    Dispose *dispose = [[Dispose alloc]init];
    dispose.identify = identify;
    __weak typeof(self) weakSelf = self;
    dispose.onDispose = ^(NSString * _Nonnull ownerIdentify) {
        NSMutableDictionary *dict = weakSelf.dict[key] ?: @{};
        [dict removeObjectForKey:ownerIdentify];
    };
    dispose.onCallback = block;
    [bag addObject:dispose];
    NSMutableDictionary *dict1 = self.dict[key];
    if (!dict1){
        dict1 = @{}.mutableCopy;
        self.dict[key] = dict1;
    }
    dict1[identify] = dispose;
}

- (void)postEvent:(Event *)event
{
    NSString *group = event.key ?: @"";
    NSDictionary *dict = self.dict[group];
    NSArray *items = dict.allValues;
    for (Dispose *dispose in items)
    {
        if (![dispose isKindOfClass:[Dispose class]]) continue;
        if (dispose.onCallback) dispose.onCallback(event);
    }
}


- (NSMutableDictionary *)dict
{
    if (!_dict){
        _dict = @{}.mutableCopy;
    }
    return _dict;
}


@end
