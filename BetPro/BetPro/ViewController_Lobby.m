//
//  ViewController_Lobby.m
//  BetPro
//
//  Created by letv on 2017/9/13.
//  Copyright © 2017年 gaopan. All rights reserved.
//

#import "ViewController_Lobby.h"
#import "ConstansUtils.h"
#import "ViewController_server.h"
#import <sys/socket.h>
#import <sys/sockio.h>
#import <sys/ioctl.h>
#import <net/if.h>
#import <arpa/inet.h>


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
    float withCenter=self.view.bounds.size.width/2;

    UILabel* welcomLabel=[[UILabel alloc]init];
    welcomLabel.frame=CGRectMake(withCenter-100,80, 200, 50);
    NSString* labelText= [@"欢迎 " stringByAppendingString:c.userName];
    //    welcomLabel.backgroundColor=[UIColor redColor];
    welcomLabel.textAlignment=UITextAlignmentCenter;
    [welcomLabel setText:labelText];
    [self.view addSubview:welcomLabel];

    UIButton* createRoomButton=[UIButton buttonWithType:UIButtonTypeCustom];
    createRoomButton.frame=CGRectMake(withCenter-100, 140, 200, 50);
    [createRoomButton setTitle:@"创建房间" forState:UIControlStateNormal];
    [createRoomButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    createRoomButton.tag=101;
    [createRoomButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    createRoomButton.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:createRoomButton];

    UIButton* joinRoomButton=[UIButton buttonWithType:UIButtonTypeCustom];
    joinRoomButton.frame=CGRectMake(withCenter-100, 210, 200, 50);
    [joinRoomButton setTitle:@"加入房间" forState:UIControlStateNormal];
    [joinRoomButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    joinRoomButton.tag=102;
    [joinRoomButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    joinRoomButton.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:joinRoomButton];
    c.ipAdress=[self getDeviceIPIpAddresses];
}

-(void)pressButton:(UIButton*) sender{
//    NSLog(@"tag= %ld",(long)sender.tag);
    switch (sender.tag) {
        case 101:
        {
            NSLog(@"tag= %ld",(long)sender.tag);
            ViewController_server* vcs=[[ViewController_server alloc]init];
            [self.navigationController pushViewController:vcs animated:YES];
            break;
        }
        case 102:
            NSLog(@"tag= %ld",(long)sender.tag);
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString *)getDeviceIPIpAddresses

{

    int sockfd =socket(AF_INET,SOCK_DGRAM, 0);

    //    if (sockfd <</span> 0) return nil;

    NSMutableArray *ips=[NSMutableArray array];


    int BUFFERSIZE =4096;

    struct ifconf ifc;

    char buffer[BUFFERSIZE], *ptr, lastname[IFNAMSIZ], *cptr;

    struct ifreq *ifr, ifrcopy;

    ifc.ifc_len = BUFFERSIZE;

    ifc.ifc_buf = buffer;

    if (ioctl(sockfd,SIOCGIFCONF, &ifc) >= 0){

        for (ptr = buffer; ptr < buffer + ifc.ifc_len; ){

            ifr = (struct ifreq *)ptr;

            int len =sizeof(struct sockaddr);

            if (ifr->ifr_addr.sa_len > len) {

                len = ifr->ifr_addr.sa_len;

            }

            ptr += sizeof(ifr->ifr_name) + len;

            if (ifr->ifr_addr.sa_family !=AF_INET) continue;

            if ((cptr = (char *)strchr(ifr->ifr_name,':')) != NULL) *cptr =0;

            if (strncmp(lastname, ifr->ifr_name,IFNAMSIZ) == 0)continue;

            memcpy(lastname, ifr->ifr_name,IFNAMSIZ);

            ifrcopy = *ifr;

            ioctl(sockfd,SIOCGIFFLAGS, &ifrcopy);

            if ((ifrcopy.ifr_flags &IFF_UP) == 0)continue;



            NSString *ip = [NSString stringWithFormat:@"%s",inet_ntoa(((struct sockaddr_in *)&ifr->ifr_addr)->sin_addr)];

            [ips addObject:ip];

        }

    }

    close(sockfd);





    NSString *deviceIP =@"";

    for (int i=0; i < ips.count; i++)

    {

        if (ips.count >0)

        {

            deviceIP = [NSString stringWithFormat:@"%@",ips.lastObject];



        }

    }

    NSLog(@"deviceIP========%@",deviceIP);
    return deviceIP;

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
