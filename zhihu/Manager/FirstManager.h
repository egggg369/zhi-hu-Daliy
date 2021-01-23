//
//  FirstManager.h
//  zhihu
//
//  Created by 郭红乐 on 2020/10/21.
//  Copyright © 2020 无. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "homeModel.h"
#import "StarModel.h"

typedef void (^StarBlock)(StarModel * _Nonnull star1Model);
typedef void (^Block)(homeModel * _Nonnull home1Model);
//typedef void (^StoriesBlock)(NSMutableArray *storiesArray);
typedef void(^ErrorBlock)(NSError * _Nonnull error);


NS_ASSUME_NONNULL_BEGIN

@interface FirstManager : NSObject <NSURLSessionDelegate>
+ (instancetype) sharedManger;

- (void) NetworkRequestSuccess:(Block) succeedBlock error:(ErrorBlock) errorBlock;

//根据日期获取某日的数据方法
- (void) NetworkRequestdate:(NSInteger)data succeed: (Block)succeedBlock error:(ErrorBlock)errorBlock;

- (void) NetworkRequestStar:(NSString *)starID  succeed:(StarBlock)succeedBlock error:(ErrorBlock)errorBlock;


@end

NS_ASSUME_NONNULL_END
