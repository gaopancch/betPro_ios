//
//  Player.m
//  BetPro
//
//  Created by letv on 2017/9/14.
//  Copyright © 2017年 gaopan. All rights reserved.
//

#import "Player.h"

Card * card1;
Card * card2;
Card * card3;
Card* temCard1;
Card* temcard2;
Card* temcard3;

@implementation Player
//不要在构造方法里面直接取自身(self,或者说本视图)的宽高,这时候取到的宽高是不准的.
- (instancetype)initWithFrame:(CGRect)frame name:(NSString*)name cards:(NSMutableArray*)cards{
    if (self = [super initWithFrame:frame]) {
        _cardArray=cards;
        _nameLabel=[[UILabel alloc]init];
        _nameLabel.frame=CGRectMake(10, 1, 200, 40);
        [_nameLabel setText:name];
        [self addSubview:_nameLabel];
        temCard1=(Card*)_cardArray[0];
        temcard2=(Card*)_cardArray[1];
        temcard3=(Card*)_cardArray[2];
        card1=[[Card alloc]initWithFrame:CGRectMake(10, 30, 60, 90) value:temCard1.value  color:temCard1.color];
        card2=[[Card alloc]initWithFrame:CGRectMake(10+70, 30, 60, 90) value:temcard2.value  color:temcard2.color];
        card3=[[Card alloc]initWithFrame:CGRectMake(10+140, 30, 60, 90) value:temcard3.value  color:temcard3.color];
        [self addSubview:card1];
        [self addSubview:card2];
        [self addSubview:card3];
    }
    return self;
}

- (void)layoutSubviews {
    // 一定要调用super的方法
    [super layoutSubviews];
    // 确定子控件的frame（这里得到的self的frame/bounds才是准确的）
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;

}

-(void)clearCards{

}

-(void)addCard:(Card *)card{

}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
