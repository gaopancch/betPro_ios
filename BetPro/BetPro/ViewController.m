//
//  ViewController.m
//  BetPro
//
//  Created by letv on 2017/9/13.
//  Copyright © 2017年 gaopan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

UITextField *inputText;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    inputText=[[UITextField alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor=[UIColor redColor];
    [self initUI];

}

-(void)initUI{
    UILabel *inputLabel=[[UILabel alloc]init];
    inputLabel.frame=CGRectMake(20, 40, 200, 50);
    [inputLabel setText:@"请输入用户名："];


    inputText.frame=CGRectMake(20, 90, self.view.bounds.size.width-40, 50);
    inputText.backgroundColor=[UIColor lightGrayColor];
    inputText.placeholder=@"输入用户名";


    UIButton* loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginButton.frame=CGRectMake(self.view.bounds.size.width/2-50, 160, 100, 60);
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.backgroundColor=[UIColor lightGrayColor];
    [loginButton addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];


    [self.view addSubview:inputText];
    [self.view addSubview:inputLabel];
    [self.view addSubview:loginButton];
}

-(void)pressLogin{
//    if(textfield.tag==)
//    NSLog(@"text= %@",textfield.text);
    NSLog(@"text = %@",inputText.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
