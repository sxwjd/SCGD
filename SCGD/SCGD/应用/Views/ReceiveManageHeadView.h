//
//  ReceiveManageHeadView.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ReceiveManageDetailModel;

@interface ReceiveManageHeadView : UIView
/**
 *  收文相关信息
 */
@property (nonatomic, strong) ReceiveManageDetailModel *model;
/**
 *  流程
 */
@property (nonatomic, strong) NSArray *processArr;
/**
 *  附件
 */
@property (nonatomic, strong) NSArray *attachmentArr;
@end
