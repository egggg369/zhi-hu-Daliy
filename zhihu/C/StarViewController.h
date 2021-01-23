//
//  StarViewController.h
//  zhihu
//
//  Created by 郭红乐 on 2020/11/26.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarModel.h"
#import "StarTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface StarViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSMutableArray *setid;
@property (nonatomic, strong) UITableView *tableView;
//@property (nonatomic, strong) UITableViewCell *startableView;
@property (nonatomic, strong) StarTableViewCell *tableViewCell;
@property (nonatomic, strong) NSString *fileName;
@property (nonatomic, strong) StarModel *starModel;
@property (nonatomic, strong) NSMutableArray *starArray;

@end

NS_ASSUME_NONNULL_END
