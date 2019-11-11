//
//  UIImage+CL.m
//  CoreGraphics图形库
//
//  Created by 徐金城 on 2019/11/11.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "UIImage+CL.h"

@implementation UIImage (CL)

+(UIImage *)circleImageWithImageName:(NSString *)imageName borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth{
    
    //需求：从位图上下文，裁剪图片[裁剪成圆形，也添加圆形的边框]，生成一张图片
    
    // 获取要裁剪的图片
    UIImage *img = [UIImage imageNamed:imageName];
    CGRect imgRect = CGRectMake(0, 0, img.size.width, img.size.height);
    
    // 1.开启位图上下文 (开启位图上下文的目的就是为了获得当前位图上下文的图片)
    UIGraphicsBeginImageContextWithOptions(img.size, NO, 0.0);
    
#warning 在自定义的view的drawRect方法里，调用UIGraphicsGetCurrentContext获取的上下文，是图层上下文(Layer Graphics Context)
    // 1.1 获取位图上下文
    CGContextRef bitmapContext = UIGraphicsGetCurrentContext();
    
    // 2.往位图上下裁剪图片
    
    // 2.1 指定一个圆形的路径，把圆形之外的剪切掉
    CGContextAddEllipseInRect(bitmapContext, imgRect);
    CGContextClip(bitmapContext);
    
    
    // 2.2 添加图片
    [img drawInRect:imgRect];
    
    // 2.3 添加边框
    // 设置边框的宽度
    CGContextSetLineWidth(bitmapContext, borderWidth);
    // 设置边框的颜色
    [borderColor set];
    CGContextAddEllipseInRect(bitmapContext, imgRect);
    CGContextStrokePath(bitmapContext);
    
    
    // 3.获取当前位图上下文的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.结束位图编辑
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
