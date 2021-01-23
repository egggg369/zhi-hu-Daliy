//
//  CommentTableViewCell.h
//  zhihu
//
//  Created by 郭红乐 on 2020/11/15.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *imageview;
//@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UILabel *idLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UILabel *replyLabel;
@property (nonatomic, strong) UIButton *foldButton;

-(void)cellOpen;
-(void)cellClose;

@end

NS_ASSUME_NONNULL_END
