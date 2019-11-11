//
//  CircleImageController.m
//  CoreGraphics图形库
//
//  Created by 徐金城 on 2019/11/11.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "CircleImageController.h"
#import "UIImage+CL.h"

@interface CircleImageController ()

@end

@implementation CircleImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图片裁剪圆形+屏幕截图";
    //图片裁剪圆形
    UIImage *image = [UIImage circleImageWithImageName:@"haha.png" borderColor:[UIColor redColor] borderWidth:2];
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100,100 , 100)];
    imageV.image = image;
    [self.view addSubview:imageV];
}

//屏幕截图
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //截取当前vie成为一张图片
    
    // 使用位图上下文
    // 1.开启位图上下文
    UIGraphicsBeginImageContext(self.view.bounds.size);
    
    // 2.当前控制器的view画在位图上下文
    // render 渲染
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 3.获取图片
    UIImage *captureImg = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.结束位图编辑
    UIGraphicsEndImageContext();
    
    // save Image
    NSData *imgData = UIImagePNGRepresentation(captureImg);
#warning 平时开发过程，图片保存是沙盒
    [imgData writeToFile:@"/Users/xujincheng/Desktop/capture.png" atomically:YES];
}

@end
