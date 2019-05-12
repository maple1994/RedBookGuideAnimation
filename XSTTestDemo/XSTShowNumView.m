//
//  XSTShowNumButton.m
//  XSTTestDemo
//
//  Created by Beauty-ruanjian on 2019/5/7.
//  Copyright © 2019 Beauty-ruanjian. All rights reserved.
//

#import "XSTShowNumView.h"
#import <Masonry.h>

@interface XSTShowNumView ()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) CGSize iconButtonSize;

@end

@implementation XSTShowNumView

- (instancetype)initWithTitle: (NSString *)title button: (UIButton *)button buttonSize: (CGSize)size
{
    if (self = [super initWithFrame: CGRectZero]) {
        self.title = title;
        self.iconButton = button;
        self.iconButton.userInteractionEnabled = NO;
        self.iconButtonSize = size;
        [self addSubview:button];
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    [self addSubview: self.titleLabel];
    [self addSubview: self.numLabel];
    [self.iconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(self.iconButtonSize);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.iconButton.mas_trailing).offset(5);
        make.centerY.equalTo(self.iconButton);
    }];
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconButton);
        make.leading.equalTo(self.iconButton.mas_trailing).offset(0);
    }];
}

// MARK: - Getter & setter
- (void)setTintColor:(UIColor *)tintColor
{
    self.titleLabel.textColor = tintColor;
    self.numLabel.textColor = tintColor;
}

- (void)setNumStr:(NSString *)numStr
{
    self.numLabel.text = numStr;
    BOOL isNumHidden = [numStr isEqualToString:@"0"];
    _numLabel.hidden = isNumHidden;
    _titleLabel.hidden = !isNumHidden;
}

- (UILabel *)numLabel
{
    if (!_numLabel) {
        _numLabel = [[UILabel alloc] init];
        _numLabel.textColor = [UIColor whiteColor];
        _numLabel.text = @"322";
        _numLabel.font = [UIFont systemFontOfSize:12];
        _numLabel.hidden = YES;
    }
    return _numLabel;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.text = self.title;
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}


@end
