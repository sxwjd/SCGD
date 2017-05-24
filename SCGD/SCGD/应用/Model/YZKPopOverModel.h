//
//  YZKPopOverModel.h
//  SCGD
//
//  Created by Lizeyu on 16/10/17.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface YZKPopOverModel : NSObject <UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate>

@property (nonatomic, assign) CGRect frame;
@property (nonatomic, assign) BOOL isPresent;
@end
