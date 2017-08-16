//
//  Notes.h
//  PL_Note
//
//  Created by PengLiang on 2017/8/16.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notes : NSObject

@property (nonatomic, copy) NSString *noteId;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *noteTitle;
@property (nonatomic, copy) NSString *noteText;
@property (nonatomic, copy) NSString *noteCreatedAt; //创建笔记的时间
@end
