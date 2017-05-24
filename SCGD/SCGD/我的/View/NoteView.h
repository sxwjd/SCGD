//
//  NoteView.h
//  SCGD
//
//  Created by 佳冬  on 2016/10/20.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NoteViewDelegate<NSObject>
@optional
- (void)signOutWithTag:(NSInteger)tag;
@end

@interface NoteView : UIView
@property (nonatomic, weak) id<NoteViewDelegate>delegate;
@end
