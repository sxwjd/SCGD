//
//  UIImage+YZKExtention.m
//  Categories
//
//  Created by 佳冬  on 15/10/20.
//  Copyright (c) 2015年 YZK. All rights reserved.
//

#import "UIImage+YZKExtention.h"

@implementation UIImage (YZKExtention)
+(UIImage *)resizebleWithImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    CGFloat w = image.size.width * 0.5;
    CGFloat h = image.size.height * 0.5;
    
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}
-(UIImage *)resizebleImage
{
    CGFloat w = self.size.width * 0.6;
    CGFloat h = self.size.height * 0.6;
    
    

    return [self resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

- (UIImage *)imageWithScale:(CGFloat)width{
    CGSize size = CGSizeMake(width, width);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, width, width);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextClip(ctx);
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndPDFContext();
    return image;
}

@end
