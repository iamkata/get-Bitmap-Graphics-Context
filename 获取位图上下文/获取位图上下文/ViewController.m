//
//  ViewController.m
//  获取位图上下文
//
//  Created by 徐金城 on 2019/11/11.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "ViewController.h"
#import "BitMapViewController.h"
#import "CircleImageController.h"
#import "CircleImageController1.h"
#import "CircleImageController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"获取位图上下文";
    
    UIButton *oneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    oneBtn.frame = CGRectMake(120, 200, 200, 50);
    oneBtn.backgroundColor = [UIColor orangeColor];
    [oneBtn setTitle:@"获取位图上下文" forState:UIControlStateNormal];
    [oneBtn addTarget:self action:@selector(oneBtnClicked)  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:oneBtn];
    
    UIButton *twoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    twoBtn.frame = CGRectMake(120, 300, 200, 50);
    twoBtn.backgroundColor = [UIColor orangeColor];
    [twoBtn setTitle:@"裁剪圆形图片+截屏" forState:UIControlStateNormal];
    [twoBtn addTarget:self action:@selector(twoBtnClicked)  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:twoBtn];
    
    UIButton *threeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    threeBtn.frame = CGRectMake(120, 400, 200, 50);
    threeBtn.backgroundColor = [UIColor orangeColor];
    [threeBtn setTitle:@"图片裁剪" forState:UIControlStateNormal];
    [threeBtn addTarget:self action:@selector(threeBtnClicked)  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:threeBtn];
    
    UIButton *fourBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    fourBtn.frame = CGRectMake(120, 500, 200, 50);
    fourBtn.backgroundColor = [UIColor orangeColor];
    [fourBtn setTitle:@"图片擦除" forState:UIControlStateNormal];
    [fourBtn addTarget:self action:@selector(fourBtnClicked)  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fourBtn];
    
//    UIButton *fiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    fiveBtn.frame = CGRectMake(120, 600, 200, 50);
//    fiveBtn.backgroundColor = [UIColor orangeColor];
//    [fiveBtn setTitle:@"" forState:UIControlStateNormal];
//    [fiveBtn addTarget:self action:@selector(fiveBtnClicked)  forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:fiveBtn];
}

- (void)oneBtnClicked {
    BitMapViewController*vc = [[BitMapViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)twoBtnClicked {
    CircleImageController *vc = [[CircleImageController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)threeBtnClicked {
    CircleImageController1 *vc = [[CircleImageController1 alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)fourBtnClicked {
    CircleImageController2*vc = [[CircleImageController2 alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

//- (void)fiveBtnClicked {
//    CircleImageController2*vc = [[CircleImageController2 alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
//}


@end
