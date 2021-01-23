//
//  ViewController.h
//  zhihu
//
//  Created by 郭红乐 on 2020/10/21.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "HomeTableViewCell.h"
#import "homeModel.h"
#import "HomeView.h"
#import "BeforeModel.h"
@interface ViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic, strong) HomeView *homeView;
@property (nonatomic, strong) homeModel *myModel;
@property (nonatomic, strong) BeforeModel *beforeModel;
@property (nonatomic, strong) NSMutableArray *beforeArray;

@property (nonatomic, strong) StoriesJSONModel *storiesModel;
@property (nonatomic, strong) Top_storiesJSONModel *topstroiesModel;

@property (nonatomic, assign) NSInteger data;
@property (nonatomic, assign) NSInteger flag;

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, assign) NSInteger days;
@property (nonatomic, assign) NSInteger tag;


@end

