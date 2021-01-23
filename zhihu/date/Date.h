//
//  Date.h
//  zhihu
//
//  Created by 郭红乐 on 2020/11/7.
//  Copyright © 2020 无. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Date : NSObject

//+ (NSString *)getDate:(NSDate *)date :(NSInteger)i;
+ (NSString *)dateStringBeforeDays:(NSInteger)data;
//+ (NSString *)getDateStringWithTimeStr:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
