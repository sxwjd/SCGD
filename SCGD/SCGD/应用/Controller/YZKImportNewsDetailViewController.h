//
//  YZKImportNewsDetailViewController.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/25.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZKImportNewsDetailViewController : UIViewController
@property (nonatomic, copy) NSString *url;
/**
 *  param
 */
@property (nonatomic, strong) NSDictionary *param;
@end
