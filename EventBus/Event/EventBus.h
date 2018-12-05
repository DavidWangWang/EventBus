//
//  EventBus.h
//  EventBus
//
//  Created by 王宁 on 2018/11/12.
//  Copyright © 2018年 王宁. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Event;
NS_ASSUME_NONNULL_BEGIN

@interface EventBus : NSObject

+ (instancetype)share;

- (void)addObserver:(id)target key:(NSString *)key callback:(void (^)(Event *event))block;

- (void)postEvent:(Event *)event;

@end

NS_ASSUME_NONNULL_END
