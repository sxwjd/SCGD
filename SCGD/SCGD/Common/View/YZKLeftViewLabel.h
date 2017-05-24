//
//  YZKLeftViewLabel.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZKLeftViewLabel : UIView
/**
 *  leftViewColor
 */
@property (nonatomic, strong) UIColor *leftViewColor;
/**
 *  contentViewColor
 */
@property (nonatomic, strong) UIColor *contentViewColor;
/**
 *  leftViewFont
 */
@property (nonatomic, strong) UIFont *leftViewFont;
/**
 *  contentViewFont
 */
@property (nonatomic, strong) UIFont *contentViewFont;
@property (nonatomic, assign) CGFloat ContentnumberOfLines;
@property (nonatomic, copy) NSString *leftViewText;
@property (nonatomic, copy) NSString *contentViewText;



@end
