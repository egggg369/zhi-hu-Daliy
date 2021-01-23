//
//  CommentTableViewCell.m
//  zhihu
//
//  Created by 郭红乐 on 2020/11/15.
//  Copyright © 2020 无. All rights reserved.
//

#import "CommentTableViewCell.h"
#import <Masonry.h>

@implementation CommentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
if ([self.reuseIdentifier isEqualToString:@"cell"]) {
    self.imageview = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageview];

    self.imageview.layer.masksToBounds = YES;
    self.imageview.layer.masksToBounds=YES;
    self.imageview.layer.cornerRadius=24.0;
    //[self.imageview.layer setCornerRadius:(self.contentView.frame.size.width * (40.0 / 534.0))/2];
    [self.imageview mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.contentView.mas_width).multipliedBy(60.0/534.0);
        make.height.mas_equalTo(@50);
        make.top.mas_equalTo(self.contentView.mas_top).offset(25);
        make.left.mas_equalTo(self.contentView.mas_left).offset(20);
    }];
    
    _idLabel = [[UILabel alloc] init];
    _idLabel.textColor = [UIColor blackColor];
    //左对齐
    _idLabel.textAlignment = NSTextAlignmentLeft;
    _idLabel.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:_idLabel];
    [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@260);
        make.height.equalTo(@30);
        make.left.mas_equalTo(self.imageview.mas_right).offset(13);
        make.top.mas_equalTo(self.imageview.mas_top).offset(4);
    }];
    _idLabel.numberOfLines = 0;
    
    self.timeLabel = [[UILabel alloc] init];
    _timeLabel.textColor = [UIColor colorWithRed:0.71f green:0.71f blue:0.71f alpha:1.00f];
    _timeLabel.textAlignment = NSTextAlignmentLeft;
    _timeLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.idLabel.mas_left);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);
        make.height.equalTo(@20);
        make.width.equalTo(@200);
    }];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.textColor = [UIColor blackColor];
    self.contentLabel.textAlignment = NSTextAlignmentLeft;
    self.contentLabel.font = [UIFont systemFontOfSize:17];
    self.contentLabel.numberOfLines = 0;
    [self.contentView addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.idLabel.mas_bottom).offset(3);
        //make.bottom.equalTo(self.replyLabel.mas_top).offset(-3);
        //            make.bottom.equalTo(self.contentView.mas_bottom);
        make.left.equalTo(self.idLabel.mas_left);
        //make.right.equalTo(self.contentView.mas_right).offset(-22);
        make.width.equalTo(@290);
        //make.height.equalTo(@80);
    }];
    
    self.likeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _likeButton.tintColor = [UIColor colorWithRed:0.71f green:0.71f blue:0.71f alpha:1.00f];
    [self.contentView addSubview:_likeButton];
    [_likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.idLabel.mas_top);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.height.equalTo(@20);
        make.width.equalTo(@50);
    }];

    self.replyLabel = [[UILabel alloc] init];
    self.replyLabel.textColor = [UIColor colorWithRed:0.52f green:0.52f blue:0.52f alpha:1.00f];
    _replyLabel.textAlignment = NSTextAlignmentLeft;
    _replyLabel.font = [UIFont systemFontOfSize:17];
    self.replyLabel.numberOfLines = 2;
    [self.contentView addSubview:_replyLabel];
    [_replyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(2);
        //            make.height.mas_equalTo(50);
        make.bottom.equalTo(self.timeLabel.mas_top).offset(-2);
        make.left.equalTo(self.contentLabel.mas_left);
        make.right.equalTo(self.contentLabel.mas_right);
    }];
    
    self.foldButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_foldButton setTitle:@"展开" forState:UIControlStateNormal];
    [_foldButton setTitle:@"收起" forState:UIControlStateSelected];
    [_foldButton setBackgroundColor:[UIColor colorWithRed:0.84f green:0.89f blue:0.95f alpha:1.00f]];
    [_foldButton setTintColor:[UIColor colorWithRed:0.84f green:0.89f blue:0.95f alpha:1.00f]];
    [_foldButton setTitleColor:[UIColor colorWithRed:0.55f green:0.56f blue:0.58f alpha:1.00f] forState:UIControlStateNormal];
    [_foldButton setTitleColor:[UIColor colorWithRed:0.55f green:0.56f blue:0.58f alpha:1.00f] forState:UIControlStateSelected];
    [self.contentView addSubview:_foldButton];
    [_foldButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.replyLabel.mas_bottom).offset(2);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.height.equalTo(@20);
        make.width.equalTo(@40);
    }];

    
    
    
    }
    return self;
}

-(void)cellOpen{
    self.replyLabel.numberOfLines = 0;
}
-(void)cellClose{
    self.replyLabel.numberOfLines = 2;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
