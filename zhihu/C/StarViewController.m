//
//  StarViewController.m
//  zhihu
//
//  Created by 郭红乐 on 2020/11/26.
//  Copyright © 2020 无. All rights reserved.
//

#import "StarViewController.h"
#import "StarTableViewCell.h"
#import "FirstManager.h"
#include <SDWebImage/UIImageView+WebCache.h>
#import "StarModel.h"
#import <FMDB.h>

@interface StarViewController ()

@end

@implementation StarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //_tableView = [[UITableView alloc] init];
    
    _starArray = [[NSMutableArray alloc] init];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    [self.tableView registerClass:[StarTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    
    NSString *doc = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%@", doc);
    
    //获取数值
    _fileName = [doc stringByAppendingPathComponent:@"downCourse.db"];
    //self.path = fileName;
    NSLog(@"%@", _fileName);
    FMDatabase *dataBase = [FMDatabase databaseWithPath:_fileName];
    
    if([dataBase open]) {
        FMResultSet *resultSet = [dataBase executeQuery:@"SELECT * FROM t_downCourseOrder"];
        self.setid = [[NSMutableArray alloc] init];
        while([resultSet next]) {
            NSString *setId = [resultSet stringForColumn:@"id"];
            [self.setid addObject:setId];
        }
        [dataBase close];
    }else {
        NSLog(@"打开数据库失败");
    }
    
    NSLog(@"%@", _setid);
    [self startitle];
    [self createUI];
}

- (void) createUI
{
    UIImage *ima01 = [[UIImage imageNamed:@"back"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *image01 = [[UIBarButtonItem alloc]initWithImage:ima01 style:UIBarButtonItemStyleDone target:self action:@selector(next)];
    self.navigationItem.leftBarButtonItems = @[image01];
}

-(void) next
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) startitle {
    for(int i = 0; i < self.setid.count; i++) {
        
        [[FirstManager sharedManger] NetworkRequestStar:self.setid[i] succeed:^(StarModel * _Nonnull star1Model) {
//            self.starModel = [[StarModel alloc] init];
//            self.starModel = star1Model;
            
            [self.starArray addObject:star1Model];
            
            NSLog(@"传值成功！");
            NSLog(@"%@", self.starArray);
            
            //[self.starArray addObject:home1Model];
            dispatch_sync(dispatch_get_main_queue(), ^{
                 [self.tableView reloadData];
            });
            
        } error:^(NSError * _Nonnull error) {
            NSLog(@"添加失败！");
        }];
    }
}

//获取数组
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//获取每组的元素个数
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
//    if (self.starArray.count == 0) {
//        return 0;
//    }
    return _starArray.count;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    StarTableViewCell *starTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    StarModel *model = _starArray[indexPath.row];
    
    NSString *str = [[NSString alloc] init];
    //NSLog(@"%@",starModel);
    str = model.image;
    //NSData *imageData = [NSData dataWithContentsOfFile:str];
    //UIImage *image = [UIImage imageWithData: imageData];
    [starTableViewCell.starimage sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"123.jpg"]];
//    UIImage *image = [UIImage imageWithData: imageData];
//    starTableViewCell.image = UIImage;
    
    starTableViewCell.label.text = model.title;
    
    return starTableViewCell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
