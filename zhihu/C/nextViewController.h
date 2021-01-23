//
//  nextViewController.h
//  zhihu
//
//  Created by 郭红乐 on 2020/10/29.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface nextViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIImageView *imageview;
@property (nonatomic, strong) UIImageView *image1;
@property (nonatomic, strong) UIImageView *image2;
@property (nonatomic, strong) UILabel *labelname;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;

@end

NS_ASSUME_NONNULL_END
