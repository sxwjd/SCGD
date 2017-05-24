//
//  ContactDataController.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactDataController : NSObject
/**
 *  公共通讯录数据
 */
@property (nonatomic, strong) NSMutableArray *organizationDataArr;

/**
 * 私人通讯录组列表数据
 */
@property (nonatomic, strong) NSMutableArray *privateContactSectionArr;

/**
 请求按组织分类的公共通讯录

 @param callback 错误返回
 */
- (void)requestContactDataSortByOrganizationWithCallback:(void(^)(NSError *error))callback;
/**
 请求按人员分类的公共通讯录
 
 @param callback 错误返回
 */
- (void)requestContactDataSortByPersonnelWithCallback:(void(^)(NSError *error))callback;
/**
 请求私人通讯录组列表
 
 @param callback 错误返回
 */
- (void)requestPrivateContactSectionListDataWithCallback:(void(^)(NSError *error))callback;


@end
