//
//  ConstansUtils.m
//  BetPro
//
//  Created by letv on 2017/9/13.
//  Copyright © 2017年 gaopan. All rights reserved.
//

#import "ConstansUtils.h"

static ConstansUtils* constansUtils;

@implementation ConstansUtils

+(id)getInstance{
    if(constansUtils==nil){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            constansUtils= [[self alloc ]init];
        });
        return constansUtils;
    }
    return constansUtils;
}

-(id)init{
    self = [super init];
    return self;
}


@end
