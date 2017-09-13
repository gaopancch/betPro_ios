//
//  ViewController_Login.m
//  BetPro
//
//  Created by letv on 2017/9/13.
//  Copyright © 2017年 gaopan. All rights reserved.
//

#import "ViewController_Login.h"
#import "ViewController_Lobby.h"
#import "ConstansUtils.h"

@interface ViewController_Login ()

@end

UITextField *inputText;
@implementation ViewController_Login

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    [self initUI];
//    self.navigationController.navigationBarHidden=YES;//隐藏顶部导航栏
//    UINavigationBar* navigationBar=[[UINavigationBar alloc]init];
    UIBarButtonItem* leftButton=[[UIBarButtonItem alloc]initWithTitle:@"退出" style:UIBarButtonItemStyleDone target:self action:@selector(exit)];
    self.navigationItem.leftBarButtonItem=leftButton;


}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [inputText resignFirstResponder];
}

-(void)exit{
    exit(0);
}

-(void)initUI{
    self.view.backgroundColor=[UIColor whiteColor];

    UILabel *inputLabel=[[UILabel alloc]init];
    inputLabel.frame=CGRectMake(20, 80, 200, 50);
    [inputLabel setText:@"请输入用户名："];

    inputText=[[UITextField alloc]init];
    inputText.frame=CGRectMake(20, 130, self.view.bounds.size.width-40, 50);
    inputText.backgroundColor=[UIColor lightGrayColor];
    inputText.placeholder=@"输入用户名";
//    inputText.text=userName;


    UIButton* loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginButton.frame=CGRectMake(self.view.bounds.size.width/2-50, 200, 100, 60);
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
    ConstansUtils* c=ConstansUtils.getInstance;
    c.userName=inputText.text;
    ViewController_Lobby* lobby=[[ViewController_Lobby alloc]init];
    [self.navigationController pushViewController:lobby animated:YES];

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
