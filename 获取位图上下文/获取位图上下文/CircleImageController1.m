//
//  CircleImageController1.m
//  CoreGraphics图形库
//
//  Created by 徐金城 on 2019/11/11.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "CircleImageController1.h"

@interface CircleImageController1 ()

@property (strong, nonatomic) UIImageView *imageV;
//开始时手指的点
@property (nonatomic, assign) CGPoint startP;

//覆盖上面灰色的View
@property (nonatomic, weak) UIView *coverV;

@end

@implementation CircleImageController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图片裁剪";
    self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.imageV.userInteractionEnabled = YES;
    self.imageV.image = [UIImage imageNamed:@"haha.png"];
    [self.view addSubview:self.imageV];
    
    UIPanGestureRecognizer *ges = [[UIPanGestureRecognizer alloc] init];
    [ges addTarget:self action:@selector(panAction:)];
    [self.imageV addGestureRecognizer:ges];
}

//添加手势之后调用的方法
- (void)panAction:(UIPanGestureRecognizer *)pan {
    
    //判断手势的状态
    CGPoint curP = [pan locationInView:self.imageV];
    if(pan.state == UIGestureRecognizerStateBegan) {
        self.startP = curP;
    } else if(pan.state == UIGestureRecognizerStateChanged) {
        
        CGFloat x = self.startP.x;
        CGFloat y = self.startP.y;
        CGFloat w = curP.x - self.startP.x;
        CGFloat h = curP.y - self.startP.y;
        CGRect rect =  CGRectMake(x, y, w, h);
        
        //添加一个UIView
        self.coverV.frame = rect;
        
    } else if (pan.state == UIGestureRecognizerStateEnded) {
        
        //把超过coverV的frame以外的内容裁剪掉
        //生成了一张图片,把原来的图片给替换掉.
        UIGraphicsBeginImageContextWithOptions(self.imageV.bounds.size, NO, 0);
        
        //把ImageV绘制到上下文之前,设置一个裁剪区域
        UIBezierPath *clipPath = [UIBezierPath bezierPathWithRect:self.coverV.frame];
        [clipPath addClip];
        
        //把当前的ImageView渲染到上下文当中
        CGContextRef ctx =  UIGraphicsGetCurrentContext();
        [self.imageV.layer renderInContext:ctx];
        //.从上下文当中生成 一张图片
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        //关闭上下文
        UIGraphicsEndImageContext();
        
        self.imageV.image = newImage;
        [self.coverV removeFromSuperview];
    }
}

/**
 *  懒加载coverV
 *  1.能够保证超始至终只有一份
 *  2.什么时候用到什么时候才去加载
 */
-(UIView *)coverV {
    
    if (_coverV == nil) {
        //添加一个UIView
        UIView *coverV = [[UIView alloc] init];
        coverV.backgroundColor = [UIColor blackColor];
        coverV.alpha = 0.7;
        _coverV = coverV;
        [self.view addSubview:coverV];
    }
    return _coverV;
}

@end
