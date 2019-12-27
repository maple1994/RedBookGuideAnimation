//
//  XSTGuideLikeAnimationView.m
//  XSTTestDemo
//
//  Created by Beauty-ruanjian on 2019/5/8.
//  Copyright © 2019 Beauty-ruanjian. All rights reserved.
//

#import "XSTGuideLikeAnimationView.h"

@interface XSTGuideLikeAnimationView ()<CAAnimationDelegate>

@property (nonatomic, strong) UIView *circleView;
@property (nonatomic, strong) UIImageView *fingerImgV;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, assign) int totalRepeatCount;
@property (nonatomic, assign) int currentRepeatCount;
@property (nonatomic, copy) void(^completionBlock)(void);

@end

@implementation XSTGuideLikeAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.circleView = [[UIView alloc] init];
    self.circleView.backgroundColor = [UIColor whiteColor];
    self.circleView.alpha = 0.8;
    self.circleView.layer.cornerRadius = 32;
    self.circleView.layer.masksToBounds = YES;
    [self addSubview:self.circleView];
    
    self.fingerImgV = [[UIImageView alloc] init];
    self.fingerImgV.image = [UIImage imageNamed:@"XSTVideoFlowGuide"];
    [self addSubview:self.fingerImgV];
    
    self.tipLabel = [[UILabel alloc] init];
    self.tipLabel.textColor = [UIColor whiteColor];
    self.tipLabel.textAlignment = NSTextAlignmentCenter;
    self.tipLabel.font = [UIFont systemFontOfSize:21];
    self.tipLabel.text = @"双击视频点赞";
    [self addSubview:self.tipLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat wh = 64;
    CGFloat x = (CGRectGetWidth(self.frame) - wh) * 0.5;
    CGFloat y = 0;
    self.circleView.frame = CGRectMake(x, y, wh, wh);
    
    wh = 70;
    x = self.circleView.center.x - 10;
    y = self.circleView.center.y - 10;
    self.fingerImgV.frame = CGRectMake(x, y, wh, wh);
    
    x = 0;
    y = CGRectGetMaxY(self.fingerImgV.frame);
    CGFloat w = CGRectGetWidth(self.frame);
    CGFloat h = 35;
    self.tipLabel.frame = CGRectMake(x, y, w, h);
}

- (void)startAnimationWithDuration: (CGFloat)duration repeatCount: (int)repeatCount completion: (void(^)(void))completion
{
    self.duration = duration;
    self.currentRepeatCount = 0;
    self.totalRepeatCount = repeatCount;
    self.completionBlock = completion;
    [self.circleView.layer removeAllAnimations];
    [self.fingerImgV.layer removeAllAnimations];
    [self startAnimationWithDuration:duration delay:0];
}

- (void)startAnimationWithDuration: (CGFloat)duration delay: (CGFloat)delay
{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.beginTime = CACurrentMediaTime() + delay;
    animation.duration = duration;
    NSMutableArray *values = [NSMutableArray array];[values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(2, 2, 1.0)]];
    
    animation.values = values;
    [self.circleView.layer addAnimation:animation forKey:nil];
    
    CAKeyframeAnimation *animation2 = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    animation2.duration = duration;
    animation2.beginTime = CACurrentMediaTime() + delay;
    animation2.values = @[@(0.8), @(0.5)];
    animation2.delegate = self;
    [self.circleView.layer addAnimation:animation2 forKey:nil];
    
    CAKeyframeAnimation* animation3 = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation3.duration = duration;
    animation3.beginTime = CACurrentMediaTime() + delay;
    NSMutableArray *values3 = [NSMutableArray array];[values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1.0)]];
    [values3 addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.7, 0.7, 1.0)]];
    [values3 addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1.0)]];
    [values3 addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.7, 0.7, 1.0)]];
    [values3 addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1.0)]];
    animation3.values = values3;
    [self.fingerImgV.layer addAnimation:animation3 forKey:nil];
}

// MARK : - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        self.currentRepeatCount += 1;
        self.circleView.alpha = 0;
        if (self.currentRepeatCount >= self.totalRepeatCount) {
            if (self.completionBlock) {
                self.completionBlock();
            }
            return;
        }
        [self startAnimationWithDuration:self.duration delay:0.5];
    }
}

@end

@implementation XSTGuideSwitchView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    UIImageView *fingerImgV = [[UIImageView alloc] init];
    fingerImgV.image = [UIImage imageNamed:@"XSTVideoFlowGuide"];
    [self addSubview:fingerImgV];
    
    UILabel *tipLabel = [[UILabel alloc] init];
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.font = [UIFont systemFontOfSize:21];
    tipLabel.text = @"上滑查看更多";
    [self addSubview:tipLabel];
    
    CGFloat w = 70;
    CGFloat h = 70;
    CGFloat x = (screenW - w) * 0.5;
    CGFloat y = 0;
    fingerImgV.frame = CGRectMake(x, y, w, h);
    
    x = 0;
    y = CGRectGetMaxY(fingerImgV.frame) + 10;
    w = screenW;
    h = 35;
    tipLabel.frame = CGRectMake(x, y, w, h);
}

@end
