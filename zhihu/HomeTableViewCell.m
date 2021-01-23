//
//  HomeTableViewCell.m
//  zhihu
//
//  Created by 郭红乐 on 2020/10/25.
//  Copyright © 2020 无. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "Masonry.h"

@implementation HomeTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if([self.reuseIdentifier isEqualToString:@"cell"])
    {
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        
        
        _image = [[UIImageView alloc] init];
        [self.contentView addSubview:_image];
        
        _labelhint = [[UILabel alloc] init];
        [self.contentView addSubview:_labelhint];
        _labelhint.font = [UIFont systemFontOfSize:14];
        
        [self initUI];
    }
    return self;
}

- (void) initUI
{
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(20);
        make.top.equalTo(self.contentView.mas_top).with.offset(2);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-20);
        make.width.equalTo(self.contentView.mas_width).multipliedBy(0.7);
    }];
    self.label.numberOfLines = 0;

    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.contentView).multipliedBy(0.1845);
        make.height.mas_equalTo(self.contentView).multipliedBy(0.667);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.top.equalTo(self.contentView.mas_top).offset(15);
    }];
    
    [self.labelhint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(20);
        make.top.equalTo(self.contentView.mas_top).with.offset(80);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-10);
        make.width.equalTo(self.contentView.mas_width).multipliedBy(0.7);
    }];
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
