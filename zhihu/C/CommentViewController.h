//
//  CommentViewController.h
//  zhihu
//
//  Created by 郭红乐 on 2020/11/15.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"
#import "CommentLongModel.h"
#import "CommentTotalModel.h"
#import "CommentView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentViewController : UIViewController
@property(nonatomic, strong) NSString *idstr;
@property(nonatomic, strong) CommentModel *myshortcommentModel;
@property(nonatomic, strong) CommentLongModel *mylongcommentModel;
@property(nonatomic, strong) CommentTotalModel *mycommentTotalModel;
@property(nonatomic, strong) CommentView *mycommentView;
//@property (copy, nonatomic) NSMutableString *str;
@property(nonatomic, strong) NSString *str;
@property(nonatomic, strong) NSMutableArray *cellArray;
@end

NS_ASSUME_NONNULL_END
