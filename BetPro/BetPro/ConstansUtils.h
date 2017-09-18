//
//  ConstansUtils.h
//  BetPro
//
//  Created by letv on 2017/9/13.
//  Copyright © 2017年 gaopan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConstansUtils : NSObject

@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *ipAdress;


+(id)getInstance;
-(id)init;

@end
