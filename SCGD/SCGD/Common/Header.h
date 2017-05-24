//
//  Header.h
//  BianMinYiLiao
//
//  Created by 佳冬  on 15/11/19.
//  Copyright © 2015年 YZK. All rights reserved.
//

#ifndef Header_h
#define Header_h


//出图一般按照iphone6尺寸设计
//iphone6 屏幕宽度 单位px
#define IPHONE6_WIDTH 750.0

//iphone6 屏幕高度 单位px
#define IPHONE6_HEIGHT 1334.0

//屏幕宽度
#define   SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)

//屏幕高度
#define   SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

#define mywidth(width) (width)/IPHONE6_WIDTH*SCREEN_WIDTH
#define myheight(height) (height)/IPHONE6_HEIGHT * SCREEN_HEIGHT

//通过16进制转换color

#define UIColorRGB(rgb) ([[UIColor alloc] initWithRed:(((rgb >> 16) & 0xff) / 255.0f) green:(((rgb >> 8) & 0xff) / 255.0f) blue:(((rgb) & 0xff) / 255.0f) alpha:1.0f])


#define UIColorRGBA(rgb,a) ([[UIColor alloc] initWithRed:(((rgb >> 16) & 0xff) / 255.0f) green:(((rgb >> 8) & 0xff) / 255.0f) blue:(((rgb) & 0xff) / 255.0f) alpha:a])


#define EXCHANGE_COLOR_NORMAL(r,g,b,a) ([UIColor colorWithRed:(r)%225/225.0f green:(g)%225/225.0f blue:(b)%225/225.0f alpha:(a)])


#define RGBCOLOR(R,G,B) [UIColor colorWithRed:R/225.0 green:G/225.0 blue:B/225.0 alpha:1.0]

//主色
#define MAINCOLOR_0XFF 0xeb4f38
#define mainColor UIColorRGB(MAINCOLOR_0XFF)

//状态栏未选中颜色
#define SUBCOLOR_0XFF  0x888888
#define subColor UIColorRGB(SUBCOLOR_0XFF)

//背景色
#define MAINBACKGROUNDCOLOR_0XFF 0xf8f8f8
#define mainBackgroundColor UIColorRGB(MAINBACKGROUNDCOLOR_0XFF)

//黑色字体颜色
#define FONTBLACKCOLOR_0XFF 0x333333
#define fontBlackColor UIColorRGB(FONTBLACKCOLOR_0XFF)

//深灰色字体颜色
#define FONTGRAYCOLOR_0XFF 0x666666
#define fontGrayColor UIColorRGB(FONTGRAYCOLOR_0XFF)

//浅灰色字体颜色
#define FONTLIGTHGRAYCOLOR_0XFF 0xeaeaea
#define fontlightGrayColor UIColorRGB(FONTGRAYCOLOR_0XFF)

//分割线颜色
#define LINECOLOR_0XFF 0xd8d8d8
#define lineColor UIColorRGB(LINECOLOR_0XFF)

//蓝色
#define BLUECOLOR_0XFF 0x56abe4
#define blueColor UIColorRGB(LINECOLOR_0XFF)

//搜索框背景颜色
#define  SEARCHBACKCOLOR__0XFF 0xc7424c
#define searchBackColor UIColorRGB(SEARCHBACKCOLOR__0XFF)

//搜索框placehold字体颜色
#define  SECRCHTEXTCOLOR__0XFF 0xee7f85
#define  searchPlaceholdColor UIColorRGB(SECRCHTEXTCOLOR__0XFF)

//文字与界面边界间距
#define TextPadding 15.0

//黑色字体大小
#define BigTextFont 15.0

//灰色字体大小
#define SmallTextFont 13.0

//获得字体大小
#define SET_FONT(size) [UIFont systemFontOfSize:size]

//获取图片大小
#define imageSize(str) [UIImage imageNamed:str].size

//获得图片
#define SET_IMAGE(ImagePath) [UIImage imageNamed:(ImagePath)]

#define CREATESELF(WE) typeof(& * self )(WE) = self;


#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define CHATVIEWBACKGROUNDCOLOR [UIColor colorWithRed:0.936 green:0.932 blue:0.907 alpha:1]

#define radius(radians) ((radians) * (180.0 / M_PI))
//登录状态
#define ISLOGON @"islogon"
#define LOGINID @"loginId"
#define USERNAME @"userName"


//版本号
#define kVersionCodeKey (NSString *)kCFBundleVersionKey

#define dispatch_main(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

#ifdef DEBUG
#   define NSLog(fmt, ...) NSLog((@"%s " fmt), __PRETTY_FUNCTION__, ##__VA_ARGS__);
#else
#   define NSLog(...)
#endif

//clang
#define UNUSEDMETHOD(method) __attribute__((unavailable (method))

#endif /* Header_h */
