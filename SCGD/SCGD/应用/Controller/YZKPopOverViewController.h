//
//  YZKPopOverViewController.h
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YZKPopOverViewController;
@protocol YZKPopOverViewControllerDelegate <NSObject>
@optional
- (void)popOverViewController:(YZKPopOverViewController *)popOverViewController didSelectedIndex:(NSIndexPath *)indexPath;
@end
@interface YZKPopOverViewController : UIViewController
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, weak) id<YZKPopOverViewControllerDelegate>delegate;
@end
