//
//  Card.h
//  BetPro
//
//  Created by letv on 2017/9/14.
//  Copyright © 2017年 gaopan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
/*红桃:H-Heart 桃心(象形),代表爱情.
 * 黑桃:S-Spade 橄榄叶(象形),代表和平.
 *方块:D-Diamond 钻石(形同意合),代表财富.
 *梅花:C-Club 三叶草(象形),代表幸运.*/
typedef NS_ENUM(NSInteger, HSDC_type){
    heart=0,
    spade,
    diamaond,
    club
};


@interface Card : UIView

@property (nonatomic)UIImageView *imageView;
@property (nonatomic)UILabel *numberLabel;
@property (nonatomic)  NSString *value;
@property (nonatomic)  HSDC_type color;

-(void)setCardValue:(NSString *) temValue;
-(void)setCardHSDC_type:(HSDC_type)temColor;
- (instancetype)initWithFrame:(CGRect)frame value:(NSString *)temValue color:(HSDC_type)temColor;

@end
