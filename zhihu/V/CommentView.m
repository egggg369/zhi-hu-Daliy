//
//  CommentView.m
//  zhihu
//
//  Created by 郭红乐 on 2020/11/15.
//  Copyright © 2020 无. All rights reserved.
//

#import "CommentView.h"
#import "CommentTableViewCell.h"

@implementation CommentView
- (void) viewInit {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,self.frame.size.width, self.frame.size.height -40) style:UITableViewStylePlain];
    [self.tableView registerClass:[CommentTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self addSubview:_tableView];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
