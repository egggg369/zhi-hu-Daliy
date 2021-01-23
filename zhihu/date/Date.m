//
//  Date.m
//  zhihu
//
//  Created by 郭红乐 on 2020/11/7.
//  Copyright © 2020 无. All rights reserved.
//

#import "Date.h"

@implementation Date

//+ (NSString *)dateStringBeforeDays:(NSInteger)data {
//    NSDateFormatter *formatter = [NSDateFormatter new];
//    [formatter setDateFormat:@"yyyyMMdd"];
//    NSDate *before = [NSDate dateWithTimeIntervalSinceNow:-data*60*60*24];
//
//    return [formatter stringFromDate:before];
//
//}

+ (NSString *)dateStringBeforeDays:(NSInteger)data {
    NSLog(@"%ld",data);
    NSDate *currentDate = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:currentDate];
    [components setDay:([components day] - data)];
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:@"yyyyMMdd"];
    return [dateday stringFromDate:beginningOfWeek];
}
@end
