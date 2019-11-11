//
//  BitMapViewController.m
//  CoreGraphics图形库
//
//  Created by 徐金城 on 2019/11/11.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "BitMapViewController.h"

@interface BitMapViewController ()

@property (strong, nonatomic) UIImageView *iv;

@end

@implementation BitMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"获取位图上下文";
    self.iv = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 300, 300)];
    self.iv.image = [UIImage imageNamed:@"papa.png"];
    [self.view addSubview:self.iv];
    
    //0.创建一个Bitmap上下文
    //c语言的方法
//    CGBitmapContextCreate(<#void *data#>, <#size_t width#>, <#size_t height#>, <#size_t bitsPerComponent#>, <#size_t bytesPerRow#>, <#CGColorSpaceRef space#>, <#CGBitmapInfo bitmapInfo#>)
    //oc中封装的方法
    //方法1
//    UIGraphicsBeginImageContext(<#CGSize size#>);
    //方法2
    UIGraphicsBeginImageContextWithOptions( CGSizeMake(200, 200), NO, 0);
    //1.获取bitmap上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.绘图(画一个圆)
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    //3.渲染
    CGContextStrokePath(ctx);
    //4.获取生成的图片
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    //5.显示生成的图片到imageview
    self.iv.image=image;
    //6.保存绘制好的图片到文件中
    //先将图片转换为二进制数据，然后再将图片写到文件中
    // UIImageJPEGRepresentation(image, 1); //第二个参数为保存的图片的效果
    NSData *data=UIImagePNGRepresentation(image);
    [data writeToFile:@"/Users/xujincheng/Desktop/abc.png" atomically:YES];
}

@end
