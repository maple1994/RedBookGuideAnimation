//
//  XSTGuideLikeAnimationView.h
//  XSTTestDemo
//
//  Created by Beauty-ruanjian on 2019/5/8.
//  Copyright © 2019 Beauty-ruanjian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XSTGuideLikeAnimationView : UIView

/**
 开始动画
 
 @param duration 动画时间
 @param repeatCount 重复次数
 @param completion 完成的回调
 */
- (void)startAnimationWithDuration: (CGFloat)duration repeatCount: (int)repeatCount completion: (void(^)(void))completion;

@end

@interface XSTGuideSwitchView : UIView

@end
NS_ASSUME_NONNULL_END
