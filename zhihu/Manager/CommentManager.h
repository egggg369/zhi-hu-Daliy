//
//  CommentManager.h
//  zhihu
//
//  Created by 郭红乐 on 2020/11/15.
//  Copyright © 2020 无. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommentModel.h"
#import "CommentLongModel.h"
#import "CommentTotalModel.h"

typedef void (^CommentLongBlock)(CommentLongModel * _Nonnull commentlongModel);
typedef void (^CommentShortBlock)(CommentModel * _Nonnull commentshortModel);
typedef void (^CommentTotalBlock)(CommentTotalModel *_Nonnull commentTotalModel);
//typedef void (^StoriesBlock)(NSMutableArray *storiesArray);
typedef void(^ErrorBlock)(NSError * _Nonnull error);


NS_ASSUME_NONNULL_BEGIN

@interface CommentManager : NSObject <NSURLSessionDelegate>

+ (instancetype) sharedManger;

//长评论，短评论
- (void) NetworkRequestLongcomment:(NSString *)ID succeed:(CommentLongBlock) succeedBlock error:(ErrorBlock) errorBlock;
- (void) NetworkRequestShortcomment:(NSString *)ID succeed:(CommentShortBlock)succeedBlock error:(ErrorBlock)errorBlock;

//总的统计
- (void) NetworkRequestTotalcomment:(NSString *)ID succeed:(CommentTotalBlock)succeedBlock error:(ErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END
