//
//  HomeView.m
//  zhihu
//
//  Created by 郭红乐 on 2020/10/25.
//  Copyright © 2020 无. All rights reserved.
//

#import "HomeView.h"

@implementation HomeView 

- (void) viewInit {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, /*self.homeview.frame.size.width*/413, /*self.homeview.frame.size.height*/896) style:UITableViewStylePlain];
    [self.tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"cell"];
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
    [self addSubview:_tableView];
    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 413, 320)];
    _tableView.tableHeaderView = _headerView;
    
    _sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 413, 320)];
    [self addSubview:_sv];
    [_headerView addSubview:_sv];
    
    _pc = [[UIPageControl alloc] initWithFrame:CGRectMake(200, 290, 300, 30)];
    [_headerView addSubview:_pc];
    
    
    
}
    
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
