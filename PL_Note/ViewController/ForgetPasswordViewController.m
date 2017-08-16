//
//  ForgetPasswordViewController.m
//  PL_Note
//
//  Created by PengLiang on 2017/8/16.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "AllUtils.h"
#import "Constant.h"
#import <BmobSDK/Bmob.h>

#import <SMS_SDK/SMSSDK.h>
#import <SMS_SDK/SMSSDKCountryAndAreaCode.h>
#import <SMS_SDK/SMSSDK+DeprecatedMethods.h>
#import <SMS_SDK/SMSSDK+ExtexdMethods.h>
#import <MOBFoundation/MOBFoundation.h>
@interface ForgetPasswordViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *validateCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *nowPasswordTextField;
@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)getValidateCodeButtonPressed:(id)sender {
    //获取验证码，要先判断手机号是否已经注册，如果没有注册，则不能获取验证码，让用户去注册界面
    [self isRepeatUsername:USER_TABLE username:self.phoneTextField.text limitCount:50];
}
- (IBAction)resettingPasswordButtonPressed:(id)sender {
}
- (IBAction)loginButtonPressed:(id)sender {
}

#pragma mark - 查询手机号是否已经注册
- (void)isRepeatUsername:(NSString *)tableName username:(NSString *)username limitCount:(int)limitCount {
    __block BOOL isRepeatUsername = NO;
    BmobQuery *queryUser = [BmobQuery queryWithClassName:tableName];
    queryUser.limit = limitCount;
    [queryUser findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        if (!error) {
            for (BmobObject *obj in array) {
                if ([[obj objectForKey:@"username"] isEqualToString:username]) {
                    //表示已经存在该用户名，可以进行找回密码
                    isRepeatUsername = YES;
                    break;
                }
            }
        } else {
            [AllUtils showPromptDialog:@"提示" andMessage:@"网络异常，请稍后重试！" OKButton:@"确定" OKButtonAction:nil cancelButton:@"" cancelButtonAction:nil  contextViewController:self];
        }
        if (!isRepeatUsername) {
            [AllUtils showPromptDialog:@"提示" andMessage:@"用户还未注册，请先注册！" OKButton:@"确定" OKButtonAction:nil cancelButton:@"" cancelButtonAction:nil  contextViewController:self];
        } else {
            [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneTextField.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
                if (!error) {
                    [AllUtils showPromptDialog:@"提示" andMessage:@"验证码发送成功，请稍后！" OKButton:@"确定" OKButtonAction:nil cancelButton:@"" cancelButtonAction:nil  contextViewController:self];
                } else {
                    [AllUtils showPromptDialog:@"提示" andMessage:@"获取验证码失败！" OKButton:@"确定" OKButtonAction:nil cancelButton:@"" cancelButtonAction:nil  contextViewController:self];
                }
            }];
        }
    }];
}
#pragma mark - 点击屏幕隐藏软键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.phoneTextField resignFirstResponder];
    [self.validateCodeTextField resignFirstResponder];
    [self.nowPasswordTextField resignFirstResponder];
}
@end
