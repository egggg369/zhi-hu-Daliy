//
//  CellView.m
//  zhihu
//
//  Created by 郭红乐 on 2020/11/1.
//  Copyright © 2020 无. All rights reserved.
//

#import "CellView.h"
#import <Masonry.h>
#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height
@implementation CellView

- (void) viewInit {
    //_backBtn = [[UIButton alloc] init];
    _backBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [_backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    //[_backBtn setTintColor:[UIColor colorWithRed:0.55 green:054 blue:0.64 alpha:1.00]];
     [self addSubview:_backBtn];
    //_backBtn.frame = CGRectMake(10, 815, 50, 50);
    
    
    
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@40);
        make.width.mas_equalTo(@40);
        make.left.equalTo(self.mas_left).offset(15);
        make.top.equalTo(self.mas_top).offset(829);
    }];
    
    
    _commentBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_commentBtn setImage:[UIImage imageNamed:@"评论"] forState:UIControlStateNormal];
    [self addSubview:_commentBtn];
    _commentBtn.frame = CGRectMake(85, 818, 63, 63);
    
    _zanBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_zanBtn setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
    [self addSubview:_zanBtn];
    _zanBtn.frame = CGRectMake(160, 820, 50, 50);
    
    _starBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_starBtn setImage:[UIImage imageNamed:@"收藏"] forState:UIControlStateNormal];
    [self addSubview:_starBtn];
    _starBtn.frame = CGRectMake(240, 820, 50, 50);
    
    _shareBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_shareBtn setImage:[UIImage imageNamed:@"分享"] forState:UIControlStateNormal];
    [self addSubview:_shareBtn];
    _shareBtn.frame = CGRectMake(310, 820, 50, 50);
    
    
   
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
