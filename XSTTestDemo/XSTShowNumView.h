//
//  XSTShowNumButton.h
//  XSTTestDemo
//
//  Created by Beauty-ruanjian on 2019/5/7.
//  Copyright © 2019 Beauty-ruanjian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XSTShowNumView : UIControl

@property (nonatomic, strong) UILabel *numLabel;
@property (nonatomic, strong) UILabel *titleLabel;
/// 由外部传入的button
@property (nonatomic, weak) UIButton *iconButton;
/// 设置按钮显示的数字String，num不为0时，显示numLabel，否则显示titleLabel
@property (nonatomic, copy) NSString *numStr;
/// numLabel, titleLabel颜色, 默认白色
@property (nonatomic, strong) UIColor *tintColor;
/// 设置num=0时，显示的title，以及显示icon的buttonm，button的size
- (instancetype)initWithTitle: (NSString *)title button: (UIButton *)button buttonSize: (CGSize)size;

@end

NS_ASSUME_NONNULL_END
