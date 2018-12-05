//
//  DisposeBag.h
//  EventBus
//
//  Created by 王宁 on 2018/11/12.
//  Copyright © 2018年 王宁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DisposeProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface DisposeBag : NSObject

- (void)addObject:(id<DisposeProtocol>)dispose;  //存储obj身上管理的订阅者

@end

NS_ASSUME_NONNULL_END
