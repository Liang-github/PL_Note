//
//  AllUtils.h
//  PL_Note
//
//  Created by PengLiang on 2017/8/16.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AllUtils : NSObject

+ (NSString *)getDateFromString:(NSString *)date;

+ (UIAlertController *)showPromptDialog:(NSString *)title andMessage:(NSString *)message OKButton:(NSString *)OKButtonTitle OKButtonAction:(void (^)(UIAlertAction *action))OKButtonHandler cancelButton:(NSString *)cancelButtonTitle cancelButtonAction:(void (^)(UIAlertAction *action))cancelButtonHandler contextViewController:(UIViewController *)contextViewController;

+ (void)jumpToViewController:(NSString *)viewControllerIdentifier contextViewController:(UIViewController *)contextViewController handler:(void (^)(void))handler;
@end
