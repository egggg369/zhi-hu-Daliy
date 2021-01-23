//
//  StarTableViewCell.m
//  zhihu
//
//  Created by 郭红乐 on 2020/11/29.
//  Copyright © 2020 无. All rights reserved.
//

#import "StarTableViewCell.h"
#import "Masonry.h"

@implementation StarTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if([self.reuseIdentifier isEqualToString:@"cell"])
    {
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        
        
        _starimage = [[UIImageView alloc] init];
        [self.contentView addSubview:_starimage];
        
        [self initUI];
    }
    return self;
}

- (void) initUI
{
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        
//        make.height.mas_equalTo(@40);
//        make.width.mas_equalTo(@40);
//        make.left.equalTo(self.mas_left).offset(15);
//        make.top.equalTo(self.mas_top).offset(829);
        
        make.left.equalTo(self.contentView.mas_left).with.offset(20);
        make.top.equalTo(self.contentView.mas_top).with.offset(2);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-20);
        make.width.equalTo(@270);
    }];
    self.label.numberOfLines = 0;

    [self.starimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@100);
        //make.left.equalTo(self.contentView.mas_right).with.offset(-20);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.top.equalTo(self.contentView.mas_top).offset(15);
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
