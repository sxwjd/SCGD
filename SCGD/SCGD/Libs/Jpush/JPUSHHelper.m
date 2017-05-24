//
//  JPUSHHelper.m
//  PushTest
//
//  Created by 佳冬  on 16/9/21.
//
//

#import "JPUSHHelper.h"


@interface JPUSHHelper()

@end
@implementation JPUSHHelper
+(void)setupJUPSHServeiceWithOptions:(NSDictionary *)launchOptions delegate:(id<JPUSHRegisterDelegate>)delegate
{
  //NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
  
  if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound;
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:delegate];
#endif
  } else if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
    //可以添加自定义categories
    [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                      UIUserNotificationTypeSound |
                                                      UIUserNotificationTypeAlert)
                                          categories:nil];
  } else {
    //categories 必须为nil
    [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                      UIRemoteNotificationTypeSound |
                                                      UIRemoteNotificationTypeAlert)
                                          categories:nil];
  }
  
  //如不需要使用IDFA，advertisingIdentifier 可为nil
  [JPUSHService setupWithOption:launchOptions appKey:appKey
                        channel:channel
               apsForProduction:isProduction
          advertisingIdentifier:nil];
  
}



@end
