//
//  ViewController.m
//  XSTTestDemo
//
//  Created by Beauty-ruanjian on 2019/5/7.
//  Copyright © 2019 Beauty-ruanjian. All rights reserved.
//

#import "ViewController.h"
#import "XSTGuideLikeAnimationView.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) XSTGuideSwitchView *guideView;
@property (nonatomic, strong) XSTGuideLikeAnimationView *likeView;
@property (nonatomic, strong) UIView *coverView;
@property (nonatomic, assign) NSInteger currentCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.frame = self.view.bounds;
    [self.view addSubview:self.tableView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:@selector(test1)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:@selector(test2)];
    
    self.coverView = [[UIView alloc] init];
    self.coverView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    self.coverView.frame = self.tableView.bounds;
    [self.view addSubview:self.coverView];
    
    self.guideView = [[XSTGuideSwitchView alloc] init];
    self.guideView.frame = CGRectMake(0, (self.view.bounds.size.height - 113) * 0.5, self.view.bounds.size.width, 120);
    self.guideView.alpha = 0;
    
    self.likeView = [[XSTGuideLikeAnimationView alloc] init];
    self.likeView.frame = CGRectMake(0, (self.view.bounds.size.height - 113) * 0.5, self.view.bounds.size.width, 120);
    self.likeView.alpha = 0;
    [self.view addSubview:self.guideView];
    [self.view addSubview:self.likeView];
    
}

- (void)test2
{
    self.likeView.alpha = 1;
    self.coverView.alpha = 1;
    [self.likeView startAnimationWithDuration:2 repeatCount:2 completion:^{
        self.likeView.alpha = 0;
        self.coverView.alpha = 0;
    }];
}

- (void)test1
{
    self.coverView.alpha = 1;
    self.guideView.alpha = 1;
    CGPoint offset = self.tableView.contentOffset;
    CGPoint newOffset = offset;
    newOffset.y += [UIScreen mainScreen].bounds.size.height * 0.5;
    CGRect frame = self.guideView.frame;
    CGRect newFrame = frame;
    newFrame.origin.y = 88;
    [UIView animateWithDuration:2 animations:^{
        self.tableView.contentOffset = newOffset;
        self.guideView.frame = newFrame;
    } completion:^(BOOL finished) {
        [self.tableView setContentOffset:offset animated:YES];
        [UIView animateWithDuration:0.5 animations:^{
            self.guideView.alpha = 0;
            self.coverView.alpha = 0;
        } completion:^(BOOL finished) {
            self.guideView.frame = frame;
        }];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    return cell;
}


@end
