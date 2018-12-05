//
//  Event.h
//  EventBus
//
//  Created by 王宁 on 2018/11/12.
//  Copyright © 2018年 王宁. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Event : NSObject

@property(nonatomic,copy)NSString * key;
@property(nonatomic,strong)id  userInfo;



@end

NS_ASSUME_NONNULL_END
