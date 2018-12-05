//
//  DisposeBag.m
//  EventBus
//
//  Created by 王宁 on 2018/11/12.
//  Copyright © 2018年 王宁. All rights reserved.
//

#import "DisposeBag.h"

@interface DisposeBag()

@property(strong,nonatomic) NSMutableArray *array;

@end

@implementation DisposeBag

- (NSMutableArray *)array
{
    if (!_array){
        _array = @[].mutableCopy;
    }
    return _array;
}

- (void)addObject:(id<DisposeProtocol>)dispose
{
    [self.array addObject:dispose];
}

- (void)dealloc
{
    for (id<DisposeProtocol> obj in _array)
    {
        [obj dispose];
    }
}


@end
