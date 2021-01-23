//
//  CellViewController.m
//  zhihu
//
//  Created by 郭红乐 on 2020/11/1.
//  Copyright © 2020 无. All rights reserved.
//

#import "CellViewController.h"
#import <WebKit/WebKit.h>
#import "CellView.h"
#import "CommentViewController.h"
#import "FirstManager.h"
#import <FMDB.h>
@interface CellViewController () <WKUIDelegate>
{
    NSString *fileName;
}
@end
//static NSString *fileName;

@implementation CellViewController {
    int count;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self postNextData];
    //[self postData];
    [self CreatView:self.idstr];
    [self search];
    
    NSString *doc = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%@", doc);
    
    fileName = [doc stringByAppendingPathComponent:@"downCourse.db"];
    //self.path = fileName;
    NSLog(@"%@", fileName);
    FMDatabase *dataBase = [FMDatabase databaseWithPath:fileName];
    NSLog(@"%d",[dataBase open]);
    if([dataBase open]) {
        //[self getFilePath:@"saveImage.sqlite"]];
        //@"CREATE TABLE IF NOT EXISTS %@ (\"id\" INTEGER PRIMARY KEY  NOT NULL  UNIQUE, \"type_image\" VARCHAR DEFAULT \"\",\"imagePosition\" VARCHAR DEFAULT \"\" ,\"image\" BLOB)",@"imageList"]
        BOOL result = [dataBase executeUpdate:@"CREATE TABLE IF NOT EXISTS t_downCourseOrder (id TEXT);"];
        

        
        if(result) {
            NSLog(@"创表success");
        }else {
            NSLog(@"创表失败");
        }
    }
    self.dataBase = dataBase;
    
    // Do any additional setup after loading the view.
}


- (void) back2{
    NSLog(@"back!");
    //dismiss返回，来的时候是persent
    //_testBlock(self.path);
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void) comment {
    NSLog(@"comment");
    CommentViewController *comment = [[CommentViewController alloc] init];
    //[self.navigationController pushViewController:comment animated:YES];
    comment.idstr = _idstr;
    
    [self presentViewController:comment animated:YES completion:nil];
}

- (void) star {
    NSLog(@"star");
    FMDatabase *dataBase = [FMDatabase databaseWithPath:self.path];
    NSLog(@"%@",self.dataBase);
    if([dataBase open]) {
        BOOL res = [self.dataBase executeUpdate:@"INSERT INTO t_downCourseOrder (id) VALUES(?);",self.idstr];
        
        //        NSInteger identifier = 42;
        //        NSString *name = @"Liam O'Flahery(\"the famous Irish author\")";
        //        NSDate *date = [NSDate date];
        //        NSString *comment = nil;
        //
        //        Bool success = [db executeUpdate:@"INSERT INTO authors (identifier, name, date, comment) VALUES (?, ?, ?, ?)", @(identifier), name, date, comment?:[NSNull null] ];
        
        if(!res) {
            NSLog(@"收藏失败增加数据！");
        }else {
//            _cellview.starBtn.selected = !_cellview.starBtn.selected;
//            if (_cellview.starBtn.selected) {
                [_cellview.starBtn setImage:[[UIImage imageNamed:@"收藏.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
                NSLog(@"收藏成功！");
                //btn.backgroundColor = [UIColor whiteColor];
                //btn.imageView.backgroundColor = [UIColor whiteColor];
//            }
//            else{
//                [_cellview.starBtn setImage:[UIImage imageNamed:@"收藏.png"] forState:UIControlStateSelected];
//                //btn.tintColor = [UIColor redColor];
//                NSLog(@"收藏成功！");
//            }
        }
            [dataBase close];
        }
}



- (void) search {
    for(int i = 0; i < _IDArray.count; i++) {
        if([_IDArray[i] isEqualToString:self.idstr]) {
            _nextidstr = _IDArray[++i];
            count = i;
            break;
        }
    }
}

- (UIView *) CreatView :(NSString *)idstr{
    _cellview = [[CellView alloc] initWithFrame:self.view.frame];
    [_cellview viewInit];
    //[self.view addSubview:_cellview];

    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*0.92)];
    webView.UIDelegate = self;
    NSString *str = [NSString stringWithFormat:@"https://daily.zhihu.com/story/%@",self.idstr];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.cellview addSubview:webView];
    
    
    [_cellview.backBtn addTarget:self action:@selector(back2) forControlEvents:UIControlEventTouchUpInside];

    [_cellview.commentBtn addTarget:self action:@selector(comment) forControlEvents:UIControlEventTouchUpInside];
    
    [_cellview.starBtn addTarget:self action:@selector(star) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.cellview];
    //[_cellview.starBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    
    return self.cellview;
}






- (void) postNextData {
    
    [[FirstManager sharedManger] NetworkRequestdate:self.data + 1 succeed:^(homeModel * _Nonnull home1Model) {
        NSLog(@"传值成功翻页");
        [self.IDArray addObject:home1Model];
    } error:^(NSError * _Nonnull error) {
        NSLog(@"添加失败");
    }];
}

- (void) postData {
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //下拉刷新
//    CGPoint offset = scrollView.contentOffset;
//    CGRect bounds = scrollView.bounds;
//    CGSize contentSize = scrollView.contentSize;
//    float y = offset.y + bounds.size.height;
//    float h = contentSize.height;
//    float Reloaddistance = -10;
//    //NSLog(@"%f %f",y,h+Reloaddistance);
//
//    // TODO:  @jiangkaiwen
//    // 加入flag，防止多次刷新,但是加了也并没用，，，
//    if (scrollView.contentOffset.y > 0.13 * self.homeView.frame.size.height * self.myModel.stories.count + 200 - self.view.frame.size.height) {
//    if(y > h + Reloaddistance - 120) {
//        if(self.isLoading ) {
//            return;
//        }else {
//            self.days++;
//            NSLog(@"zaizhe%ld",_days);
//            [self post];
//            self.data++;
//            //self.isLoading = NO;
//        }
    
    
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    CGSize contentSize = scrollView.contentSize;
    //UIEdgeInsets inset = scrollView.contentInset;
    float y = offset.y + bounds.size.height; //- inset.bottom;
    float h = contentSize.height;
    float reload_distance = -10;
    if(y > h + reload_distance - 120){ //&& scrollView.contentSize.height != 0) {
        [UIView transitionFromView:self.cellview toView:[self CreatView:_nextidstr] duration:1 options:UIViewAnimationOptionTransitionFlipFromBottom completion:^(BOOL finished) {
            self.idstr = self.nextidstr;
            NSLog(@"%@", self.idstr);
            [self postData];
            if(self->count + 2 >= self.IDArray.count) {
                [self postNextData];
            }else {
                self.nextidstr = self.IDArray[++self->count];
            }
        }];
    }
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
