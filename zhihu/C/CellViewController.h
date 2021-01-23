//
//  CellViewController.h
//  zhihu
//
//  Created by 郭红乐 on 2020/11/1.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellView.h"
#import "homeModel.h"
#import <FMDB.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellViewController : UIViewController
@property (nonatomic, assign) NSInteger *data;
@property (nonatomic, strong) NSMutableArray *IDArray;
@property (nonatomic, strong) NSMutableArray *starIDArray;
@property (nonatomic ,strong) NSString *idstr;
@property (nonatomic, strong) NSString *nextidstr;
@property (nonatomic, strong) homeModel *myModel;
@property (nonatomic, strong) UIButton *Btn;
@property (nonatomic, strong) CellView *cellview;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) FMDatabase *dataBase;

//@property (nonatomic, copy) void (^testBlock) (NSString *pathname);

@end

NS_ASSUME_NONNULL_END
