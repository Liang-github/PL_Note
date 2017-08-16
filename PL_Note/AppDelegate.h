//
//  AppDelegate.h
//  PL_Note
//
//  Created by PengLiang on 2017/8/15.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//当前用户的ID
@property (nonatomic, strong) NSString *GLOBAL_USERID;
//用户名也就是手机号
@property (nonatomic, strong) NSString *GLOBAL_USERNAME;
//昵称
@property (nonatomic, strong) NSString *GLOBAL_NICKNAME;
//密码
@property (nonatomic, strong) NSString *GLOBAL_PASSWORD;
@end

