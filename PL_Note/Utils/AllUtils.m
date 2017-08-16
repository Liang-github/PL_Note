//
//  AllUtils.m
//  PL_Note
//
//  Created by PengLiang on 2017/8/16.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "AllUtils.h"

@implementation AllUtils
#pragma mark - 获取日期
+ (NSString *)getDateFromString:(NSString *)date {
    NSString *str = date;
    NSMutableString *reverseString = [NSMutableString string];
    for (int i = 0; i < str.length; i ++) {
        //倒序存储字符并且存到可变数组中
        unichar c = [str characterAtIndex:str.length - i - 1];
        [reverseString appendFormat:@"%c",c];
    }
    str = reverseString;
    NSString *b = [str substringFromIndex:8]; //截取后8位
    NSString *str2 = b;
    NSMutableString *reverseString2 = [NSMutableString string];
    for (int i = 0; i < str2.length; i ++) {
        //倒序读取字符并且存到可变数组中
        unichar c = [str2 characterAtIndex:str2.length - i - 1];
        [reverseString2 appendFormat:@"%c",c];
    }
    str2 = reverseString2;
    return str2;
}
#pragma mark - 弹出提示对话框
+ (UIAlertController *)showPromptDialog:(NSString *)title andMessage:(NSString *)message OKButton:(NSString *)OKButtonTitle OKButtonAction:(void (^)(UIAlertAction *))OKButtonHandler cancelButton:(NSString *)cancelButtonTitle cancelButtonAction:(void (^)(UIAlertAction *))cancelButtonHandler contextViewController:(UIViewController *)contextViewController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:OKButtonTitle style:UIAlertActionStyleDefault handler:OKButtonHandler]];
    if ([cancelButtonTitle isEqualToString:@""]) {
        //表示不需要“取消”按钮
    } else {
        //需要“取消按钮”
        [alertController addAction:[UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleDefault handler:cancelButtonHandler]];
    }
    //弹出提示框
    [contextViewController presentViewController:alertController animated:YES completion:nil];
    return alertController;
}
#pragma mark - 界面跳转封装
+ (void)jumpToViewController:(NSString *)viewControllerIdentifier contextViewController:(UIViewController *)contextViewController handler:(void (^)(void))handler {
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController = [contextViewController.storyboard instantiateViewControllerWithIdentifier:viewControllerIdentifier];
    [contextViewController presentViewController:viewController animated:YES completion:handler];
}
@end
