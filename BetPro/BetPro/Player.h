//
//  Player.h
//  BetPro
//
//  Created by letv on 2017/9/14.
//  Copyright © 2017年 gaopan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"
@interface Player : UIView

@property (nonatomic) UILabel* nameLabel;
@property (nonatomic) NSMutableArray* cardArray;

- (instancetype)initWithFrame:(CGRect)frame name:(NSString*)name cards:(NSMutableArray*)cards;
-(void) addCard:(Card*)card;
-(void) clearCards;

@end
