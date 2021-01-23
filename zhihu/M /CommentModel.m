//
//  CommentModel.m
//  zhihu
//
//  Created by 郭红乐 on 2020/11/12.
//  Copyright © 2020 无. All rights reserved.
//

#import "CommentModel.h"

@implementation ReplyModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation CommentsModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation CommentModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end
