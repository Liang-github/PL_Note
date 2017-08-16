//
//  GuidePageViewController.m
//  PL_Note
//
//  Created by PengLiang on 2017/8/16.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "GuidePageViewController.h"
#import "AllUtils.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface GuidePageViewController ()<UIScrollViewDelegate, UIPageViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *guidepageScrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation GuidePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"exist" forKey:@"guidepage"];
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 50, SCREEN_HEIGHT - 50, 100, 20)];
    self.pageControl.numberOfPages = 5;
    [self.view addSubview:self.pageControl];
    [self setGuidePageScrollViewFrame];
}
#pragma mark - 设置控件的位置大小
- (void)setGuidePageScrollViewFrame {
    self.guidepageScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*5, SCREEN_HEIGHT);
    self.guidepageScrollView.userInteractionEnabled = YES;
    self.guidepageScrollView.pagingEnabled = YES;
    self.guidepageScrollView.showsHorizontalScrollIndicator = NO;
    self.guidepageScrollView.showsVerticalScrollIndicator = NO;
    [self setGuidePageImageFrame];
}
- (void)setGuidePageImageFrame {
    for (int i = 0; i < 4; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        imageView.userInteractionEnabled = YES;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guidepage%d",i]];
        [self.guidepageScrollView addSubview:imageView];
    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*4, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    view.userInteractionEnabled = YES;
    view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"guidepage0.png"]];
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 200)/3, SCREEN_HEIGHT - 100, 100, 30)];
    [loginButton setTitle:@"登录" forState:0];
    loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
    loginButton.layer.borderWidth = 0.5;
    loginButton.layer.masksToBounds = YES;
    [loginButton addTarget:self action:@selector(loginButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 200)/3 + (SCREEN_WIDTH - 200)/3 + 100, SCREEN_HEIGHT - 100, 100, 30)];
    [registerButton setTitle:@"注册" forState:0];
    registerButton.layer.borderColor = [UIColor whiteColor].CGColor;
    registerButton.layer.borderWidth = 0.5;
    registerButton.layer.masksToBounds = YES;
    [registerButton addTarget:self action:@selector(registerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:loginButton];
    [view addSubview:registerButton];
    [self.guidepageScrollView addSubview:view];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetWidth = self.guidepageScrollView.contentOffset.x;
    int pageNum = offsetWidth/SCREEN_WIDTH;
    self.pageControl.currentPage = pageNum;
}
#pragma mark - 所有按钮的点击事件
- (void)loginButtonPressed:(UIButton *)sender {
    [AllUtils jumpToViewController:@"LoginViewController" contextViewController:self handler:nil];
}
- (void)registerButtonPressed:(UIButton *)sender {
    [AllUtils jumpToViewController:@"RegisterViewController" contextViewController:self handler:nil];
}
@end
