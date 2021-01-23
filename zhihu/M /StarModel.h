//
//  StarModel.h
//  zhihu
//
//  Created by 郭红乐 on 2020/11/29.
//  Copyright © 2020 无. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

//@interface SectionJSONModel : JSONModel
//@property (nonatomic, strong) NSString *thumbnail;
//@property (nonatomic, strong) NSString *name;
//@property (nonatomic, strong) NSString *id;
//@end

@interface StarModel : JSONModel
//@property (nonatomic, strong) NSString *body;
//@property (nonatomic, strong) NSString *image_hue;
//@property (nonatomic, strong) NSString *image_source;
@property (nonatomic, strong) NSString *title;
//@property (nonatomic, strong) NSString *url;
//@property (nonatomic, strong) NSString *share_url;
@property (nonatomic, strong) NSString *image;
//@property (nonatomic, strong) NSString *js;
//@property (nonatomic, strong) NSString *id;
//@property (nonatomic, strong) NSString *ga_prefix;
//@property (nonatomic, strong) NSString *type;
//@property (nonatomic, strong) NSArray *images;
//@property (nonatomic, strong) NSArray *css;
//@property (nonatomic, copy) NSDictionary <SectionJSONModel> *section;

@end

NS_ASSUME_NONNULL_END
