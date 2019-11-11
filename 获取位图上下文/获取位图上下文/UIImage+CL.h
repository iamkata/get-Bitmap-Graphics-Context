//
//  UIImage+CL.h
//  CoreGraphics图形库
//
//  Created by 徐金城 on 2019/11/11.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (CL)
/**
 *
 *  @param imageName    需要裁剪的图片
 *  @param borderColor 边框的颜色
 *  @param borderWidth 边框的宽度
 *  @return 一个裁剪 带有边框的圆形图片
 */
+(UIImage *)circleImageWithImageName:(NSString *)imageName borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end

NS_ASSUME_NONNULL_END
