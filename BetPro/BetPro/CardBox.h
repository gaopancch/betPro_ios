//
//  CardBox.h
//  BetPro
//
//  Created by letv on 2017/9/14.
//  Copyright © 2017年 gaopan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface CardBox : NSObject
+(instancetype)getInstance;
-(void)clearCards;
-(Card*)sendCard;

@end
