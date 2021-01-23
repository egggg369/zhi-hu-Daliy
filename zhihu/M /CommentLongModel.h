//
//  CommentLongModel.h
//  zhihu
//
//  Created by 郭红乐 on 2020/11/29.
//  Copyright © 2020 无. All rights reserved.
//

#import "JSONModel.h"
@protocol CommentlongModel

@end

@protocol LongReplyModel

@end

NS_ASSUME_NONNULL_BEGIN

@interface LongReplyModel : JSONModel

@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) int status;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *author;

@end


@interface CommentlongModel : JSONModel

@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, strong) NSString *likes;
@property (nonatomic, strong) LongReplyModel *reply_to;

@end


@interface CommentLongModel : JSONModel
@property (nonatomic, copy) NSArray <CommentlongModel> *comments;
@end

NS_ASSUME_NONNULL_END

