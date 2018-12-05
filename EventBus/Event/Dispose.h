//
//  Dispose.h
//  EventBus
//
//  Created by 王宁 on 2018/11/12.
//  Copyright © 2018年 王宁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DisposeProtocol.h"
#import "Event.h"
NS_ASSUME_NONNULL_BEGIN

@interface Dispose : NSObject <DisposeProtocol>

@property(nonatomic,copy)NSString * identify;
@property(nonatomic,copy)void (^onDispose)(NSString *group);
@property(nonatomic,copy)void (^onCallback)(Event *event);

@end

NS_ASSUME_NONNULL_END
