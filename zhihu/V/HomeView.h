//
//  HomeView.h
//  zhihu
//
//  Created by 郭红乐 on 2020/10/25.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeView : UIView <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HomeTableViewCell *tableViewCell;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIScrollView *sv;
@property (nonatomic, strong) UIPageControl *pc;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UILabel *labeltop;
@property (nonatomic, strong) UILabel *labelhinttop;
@property (nonatomic, strong) UILabel *imagetop;
- (void)viewInit;

@end
NS_ASSUME_NONNULL_END
