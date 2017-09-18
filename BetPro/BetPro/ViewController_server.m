//
//  ViewController_server.m
//  BetPro
//
//  Created by letv on 2017/9/13.
//  Copyright © 2017年 gaopan. All rights reserved.
//

#import "ViewController_server.h"
#import "ConstansUtils.h"
#import "Card.h"
#import "CardBox.h"
#import "Player.h"

@interface ViewController_server ()

@end

ConstansUtils* constansUtils;
CardBox* cardBox;
UIScrollView *scrollView;
int i=1;
int j=1;

@implementation ViewController_server

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    constansUtils=ConstansUtils.getInstance;
    cardBox=[CardBox getInstance];
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initUI{
    float withCenter=self.view.bounds.size.width/2;
    UILabel* userLabel=[[UILabel alloc]init];
    userLabel.frame=CGRectMake(withCenter-100, 60, 200, 30);
    userLabel.backgroundColor=[UIColor redColor];
    NSString* userLabelText=[@"用户：" stringByAppendingString: constansUtils.userName];
    [userLabel setText:userLabelText];
    [userLabel setTextColor:[UIColor blackColor]];
    [self.view addSubview:userLabel];

    UILabel* idLabel=[[UILabel alloc]init];
    idLabel.frame=CGRectMake(withCenter-100, 90, 200, 30);
    idLabel.backgroundColor=[UIColor redColor];
    NSString* idLabelText=[@"房间号：" stringByAppendingString: constansUtils.ipAdress];
    [idLabel setText:idLabelText];
    [idLabel setTextColor:[UIColor blackColor]];
    [self.view addSubview:idLabel];

    scrollView=[[UIScrollView alloc]init];
    scrollView.frame=CGRectMake(0, 120, self.view.bounds.size.width, self.view.bounds.size.height);
    scrollView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:scrollView];
    scrollView.scrollEnabled=YES;
    scrollView.contentSize=CGSizeMake(withCenter*2, 1000);//如果这里不设置，就不会有滑动

    UITextView *userShowText=[[UITextView alloc]init];
    userShowText.frame=CGRectMake(10,0 , withCenter*2-20, 50);
    NSMutableString *usersString=[[NSMutableString alloc]initWithString:@"当前用户:"];
    [userShowText setEditable:NO];//使textView不可被编辑
    [usersString appendString:constansUtils.userName];
    [userShowText setText:usersString];
    [scrollView addSubview:userShowText];

    UIButton *sendCardButton=[UIButton buttonWithType:UIButtonTypeCustom];
    sendCardButton.frame=CGRectMake(10, 50, withCenter-20, 40);
    sendCardButton.backgroundColor=[UIColor grayColor];
    [sendCardButton setTitle:@"发牌" forState:UIControlStateNormal];
    sendCardButton.tag=101;
    [sendCardButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];

    UIButton *showCardButton=[UIButton buttonWithType:UIButtonTypeCustom];
    showCardButton.frame=CGRectMake(withCenter+10, 50, withCenter-20, 40);
    showCardButton.backgroundColor=[UIColor grayColor];
    [showCardButton setTitle:@"看牌" forState:UIControlStateNormal];
    showCardButton.tag=102;
    [showCardButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];

    [scrollView addSubview:sendCardButton];
    [scrollView addSubview:showCardButton];

//    Card *card=[[Card alloc]initWithFrame:CGRectMake(10, 100, 60, 90) value:@"12" color:heart];

//    [scrollView addSubview:card];

}

-(void)clickButton:(UIButton*) sender{

    if(sender.tag==101){
        i++;
        j++;
        [cardBox clearCards];
        Card *cardTem=[cardBox sendCard];
        Card *card=[[Card alloc]initWithFrame:CGRectMake(10+j*60, i*100, 60, 90) value:cardTem.value color:cardTem.color];
        [scrollView addSubview:card];

        NSLog(@"发牌 %@",cardTem.value);
    }else if(sender.tag==102){
        NSLog(@"看牌");
        [cardBox clearCards];
        NSMutableArray * array=[[NSMutableArray alloc]init];

        [array addObject:[cardBox sendCard]];
        [array addObject:[cardBox sendCard]];
        [array addObject:[cardBox sendCard]];
        Player *player=[[Player alloc]initWithFrame:CGRectMake(10,90, 210, 125) name:@"gaopan" cards:array];
        [scrollView addSubview:player];

    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
