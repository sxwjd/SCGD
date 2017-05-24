//
//  YZKDateChooseView.h
//  SCGD
//
//  Created by Lizeyu on 16/10/24.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Completion)(NSString *date);

@class YZKDateChooseView;

@protocol YZKDateChooseViewDelegate <NSObject>
@optional;
- (void)dateChooseView:(YZKDateChooseView *)view withSelectedYearMonth:(NSString *)year month:(NSString *)month day:(NSString *)day;

@end

@interface YZKDateChooseView : UIView
/**  年 月 日 */
@property (nonatomic, assign, getter=isShowDay) BOOL showDay;
@property (nonatomic, weak) id<YZKDateChooseViewDelegate> delegate;
- (void)show;

@end
