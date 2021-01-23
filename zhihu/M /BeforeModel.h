//
//  BeforeModel.h
//  zhihu
//
//  Created by 郭红乐 on 2020/11/12.
//  Copyright © 2020 无. All rights reserved.
//

#import "JSONModel.h"

@protocol StoriesModel
@end


NS_ASSUME_NONNULL_BEGIN

@interface StoriesModel : JSONModel
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *image_hue;
@property (nonatomic, copy) NSString *hint;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSArray *images;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ga_prefix;

@end


@interface BeforeModel : JSONModel
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSArray<StoriesModel>*stories;
@end

NS_ASSUME_NONNULL_END
