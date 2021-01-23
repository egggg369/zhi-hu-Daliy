//
//  CommentModel.h
//  zhihu
//
//  Created by 郭红乐 on 2020/11/12.
//  Copyright © 2020 无. All rights reserved.
//

#import "JSONModel.h"
@protocol CommentsModel

@end

@protocol ReplyModel

@end
NS_ASSUME_NONNULL_BEGIN

@interface ReplyModel : JSONModel

@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) int status;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *author;

@end

@interface CommentsModel : JSONModel

@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, strong) NSString *likes;
@property (nonatomic, strong) ReplyModel *reply_to;

@end


@interface CommentModel : JSONModel
@property (nonatomic, copy) NSArray<CommentsModel>*comments;
@end

NS_ASSUME_NONNULL_END
