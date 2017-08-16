//
//  BmobOperation.h
//  PL_Note
//
//  Created by PengLiang on 2017/8/16.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BmobOperation : NSObject
+ (void)addNoteToNoteTable:(NSString *)tableName userId:(NSString *)userId username:(NSString *)username noteTitle:(NSString *)noteTitle noteText:(NSString *)noteText todo:(void (^)(BOOL isSuccessful, NSError *error))todo;
+ (void)deleteNoteFromDatabase:(NSString *)tableName noteId:(NSString *)noteId;
@end
