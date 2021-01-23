//
//  CommentView.h
//  zhihu
//
//  Created by 郭红乐 on 2020/11/15.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentView : UIView <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
- (void)viewInit;
@end

NS_ASSUME_NONNULL_END
