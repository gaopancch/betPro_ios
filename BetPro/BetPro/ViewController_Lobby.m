//
//  ViewController_Lobby.m
//  BetPro
//
//  Created by letv on 2017/9/13.
//  Copyright © 2017年 gaopan. All rights reserved.
//

#import "ViewController_Lobby.h"
#import "ConstansUtils.h"

@interface ViewController_Lobby ()

@end
ConstansUtils* c;
@implementation ViewController_Lobby

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.navigationController.navigationBarHidden=NO;//隐藏顶部导航栏
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    c=ConstansUtils.getInstance;
    NSLog(@"name = %@",c.userName);
    [self initUI];
}

-(void)initUI{
    UILabel* welcomLabel=[[UILabel alloc]init];
    welcomLabel.frame=CGRectMake(self.view.bounds.size.width/2-100,80, 200, 50);
    NSString* labelText= [@"欢迎 " stringByAppendingString:c.userName];
//    welcomLabel.backgroundColor=[UIColor redColor];
    welcomLabel.textAlignment=UITextAlignmentCenter;
    [welcomLabel setText:labelText];
    [self.view addSubview:welcomLabel];

//    UIButton*
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
