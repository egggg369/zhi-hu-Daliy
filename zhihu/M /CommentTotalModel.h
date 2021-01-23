//
//  CommentTotalModel.h
//  zhihu
//
//  Created by 郭红乐 on 2020/11/18.
//  Copyright © 2020 无. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentTotalModel : JSONModel
@property(nonatomic, copy) NSString *long_comments;
@property(nonatomic, copy) NSString *popularity;
@property(nonatomic, copy) NSString *short_comments;
@property(nonatomic, copy) NSString *comments;
@end

NS_ASSUME_NONNULL_END
