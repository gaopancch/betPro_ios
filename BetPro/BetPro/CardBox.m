//
//  CardBox.m
//  BetPro
//
//  Created by letv on 2017/9/14.
//  Copyright © 2017年 gaopan. All rights reserved.
//

#import "CardBox.h"

static CardBox *cardbox;
NSMutableArray *cardArray;
NSMutableArray *valueArray;
@implementation CardBox

+(instancetype)getInstance{
    if(cardbox==nil){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            cardbox=[[CardBox alloc]initCardBox];
        });
    }
    return cardbox;
}

-(Card*)sendCard{
    int count=cardArray.count;
    int n= arc4random() % count;

    Card *card=cardArray[n];
    [cardArray removeObjectAtIndex:n];
    return card;

}

-(void)clearCards{
    [cardArray removeAllObjects];
    [self makeCardsInBox];
}

-(instancetype)initCardBox{
    self = [super init];
    if(self){
        valueArray=[[NSMutableArray alloc]initWithObjects:@"A",@"2", @"3", @"4" ,@"5", @"6" ,@"7" ,@"8", @"9" ,@"10", @"J" ,@"Q", @"K", nil];
        cardArray=[[NSMutableArray alloc]init];
        [self makeCardsInBox];
    }

    return self;
}

-(void)makeCardsInBox{
     int count=valueArray.count;
        for (int i=0; i<count; i++) {
        Card *cardh=[[Card alloc]init];
        [cardh setCardHSDC_type:heart];
        [cardh setCardValue:valueArray[i]];
        [cardArray addObject:cardh];

        Card *cards=[[Card alloc]init];
        [cards setCardHSDC_type:spade];
        [cards setCardValue:valueArray[i]];
        [cardArray addObject:cards];

        Card *cardc=[[Card alloc]init];
        [cardc setCardHSDC_type:club];
        [cardc setCardValue:valueArray[i]];
        [cardArray addObject:cardc];

        Card *cardd=[[Card alloc]init];
        [cardd setCardHSDC_type:diamaond];
        [cardd setCardValue:valueArray[i]];
        [cardArray addObject:cardd];
    }
}

@end
