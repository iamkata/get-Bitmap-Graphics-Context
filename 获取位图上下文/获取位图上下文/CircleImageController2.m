//
//  CircleImageController2.m
//  CoreGraphics图形库
//
//  Created by 徐金城 on 2019/11/11.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "CircleImageController2.h"

@interface CircleImageController2 ()

@property (strong, nonatomic) UIImageView *imageV;

@end

@implementation CircleImageController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图片擦除";
    self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 300, 300)];
    self.imageV.image = [UIImage imageNamed:@"papa.png"];
    self.imageV.userInteractionEnabled = YES;
    [self.view addSubview:self.imageV];
    
    //添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageV addGestureRecognizer:pan];
}

- (void)pan:(UIGestureRecognizer *)pan {
    
    //获取当前手指的点
    CGPoint curP =  [pan locationInView:self.imageV];
    
    //确定擦除区域
    CGFloat rectWH = 30;
    CGFloat x = curP.x - rectWH * 0.5;
    CGFloat y = curP.y - rectWH * 0.5;
    CGRect rect = CGRectMake(x, y, rectWH, rectWH);
    
    //生成一张带有透明擦除区域的图片
    
    //1.开启图片上下文
    UIGraphicsBeginImageContextWithOptions(self.imageV.bounds.size, NO, 0);
    
    //2.把UIImageV内容渲染到当前的上下文当中
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.imageV.layer renderInContext:ctx];
    
    //3.擦除上下文当中的指定的区域
    CGContextClearRect(ctx, rect);
    
    //4.从上下文当中取出图片
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    
    //替换之前ImageView的图片
    self.imageV.image = newImage; 
}

@end
