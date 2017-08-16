//
//  BmobOperation.m
//  PL_Note
//
//  Created by PengLiang on 2017/8/16.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "BmobOperation.h"
#import <BmobSDK/Bmob.h>
@implementation BmobOperation
#pragma mark - 往数据库中插入一条笔记
//插入一条笔记到Note表，包括userId（用户ID），username（用户名），noteTitle（笔记标题），noteText（笔记内容）
+ (void)addNoteToNoteTable:(NSString *)tableName userId:(NSString *)userId username:(NSString *)username noteTitle:(NSString *)noteTitle noteText:(NSString *)noteText todo:(void (^)(BOOL, NSError *))todo {
    BmobObject *note = [BmobObject objectWithClassName:tableName];
    [note setObject:userId forKey:@"userId"];
    [note setObject:username forKey:@"username"];
    [note setObject:noteTitle forKey:@"noteTitle"];
    [note setObject:noteText forKey:@"noteText"];
    [note sub_saveInBackgroundWithResultBlock:todo];
}
#pragma mark - 往数据库中删除一条笔记
+ (void)deleteNoteFromDatabase:(NSString *)tableName noteId:(NSString *)noteId {
    BmobQuery *delete = [BmobQuery queryWithClassName:tableName];
    [delete getObjectInBackgroundWithId:noteId block:^(BmobObject *object, NSError *error) {
        if (error) {
            //进行错误处理
        } else {
            if (object) {
                //异步删除object
                [object deleteInBackground];
            }
        }
    }];
}
@end
