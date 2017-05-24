//
//  JPUSHHelper.h
//  PushTest
//
//  Created by 佳冬  on 16/9/21.
//
//

#import <Foundation/Foundation.h>
#import "JPUSHService.h"
#import <AdSupport/AdSupport.h>
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
static NSString *appKey = @"df10c477eafac31ea72a43be";
static NSString *channel = @"Publish channel";
static BOOL isProduction = FALSE;

@interface JPUSHHelper : NSObject
+(void)setupJUPSHServeiceWithOptions:(NSDictionary *)launchOptions delegate:(id<JPUSHRegisterDelegate>)delegate;
@end
