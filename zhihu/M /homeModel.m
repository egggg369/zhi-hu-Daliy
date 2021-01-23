//
//  homeModel.m
//  zhihu
//
//  Created by 郭红乐 on 2020/10/25.
//  Copyright © 2020 无. All rights reserved.
//

#import "homeModel.h"

@implementation StoriesJSONModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation Top_storiesJSONModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end


@implementation homeModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end
