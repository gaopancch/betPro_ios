//
//  Card.m
//  BetPro
//
//  Created by letv on 2017/9/14.
//  Copyright © 2017年 gaopan. All rights reserved.
//

#import "Card.h"
@implementation Card


//不要在构造方法里面直接取自身(self,或者说本视图)的宽高,这时候取到的宽高是不准的.
- (instancetype)initWithFrame:(CGRect)frame value:(NSString *)temValue color:(HSDC_type)temColor {
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc]init];
        [self addSubview:self.imageView];

        self.numberLabel = [[UILabel alloc]init];
        self.numberLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.numberLabel];
    }
    _value=temValue;
    _color=temColor;
    return self;
}

- (void)layoutSubviews {
    // 一定要调用super的方法
    [super layoutSubviews];

    // 确定子控件的frame（这里得到的self的frame/bounds才是准确的）
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    self.imageView.frame = CGRectMake(0, 0, width, height);
    self.numberLabel.frame = CGRectMake(0, 0, 25, 25);
    self.imageView.backgroundColor=[UIColor greenColor];
    [self.numberLabel setTextColor:[UIColor redColor]];
    [self.numberLabel setText:_value];
   // [self.imageView setImage:[UIImage imageNamed:@"club.png"]];
    [self adjustColor];
}

-(void)adjustColor{
    switch (_color) {
        case heart:
            [self.imageView setImage:[UIImage imageNamed:@"heart.png"]];
            break;
        case spade:
            [self.imageView setImage:[UIImage imageNamed:@"spade.png"]];
            break;
        case club:
            [self.imageView setImage:[UIImage imageNamed:@"club.png"]];
            break;
        case diamaond:
            [self.imageView setImage:[UIImage imageNamed:@"diamond.png"]];
            break;
        default:
            break;
    }
}

-(void)setCardValue:(NSString *)temValue{
    _value=temValue;
}

-(void)setCardHSDC_type:(HSDC_type)temColor{
    _color=temColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
