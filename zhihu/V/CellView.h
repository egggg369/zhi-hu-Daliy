//
//  CellView.h
//  zhihu
//
//  Created by 郭红乐 on 2020/11/1.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellView : UIView
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UIButton *zanBtn;
@property (nonatomic, strong) UIButton *starBtn;
@property (nonatomic, strong) UIButton *shareBtn;

- (void)viewInit;
@end

NS_ASSUME_NONNULL_END
