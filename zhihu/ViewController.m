//
//  ViewController.m
//  zhihu
//
//  Created by 郭红乐 on 2020/10/21.
//  Copyright © 2020 无. All rights reserved.
//

#import "ViewController.h"
//#import "HomeTableViewCell.h"
#import "nextViewController.h"
#import "FirstManager.h"
#import "homeModel.h"
#import "HomeView.h"
#include "CellViewController.h"
#include <SDWebImage/UIImageView+WebCache.h>
#include "CommentViewController.h"


// TODO：@jiangkaiwen
// kFrameWidth
// 使用PCH文件，加入常用宏定义

#define Width self.view.frame.size.width
#define Height self.view.frame.size.height

#define COUNT 5
//static int i;


@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, assign) BOOL isLoading;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.isLoading = true;
    self.days = -1;
    //self.data = [[NSMutableArray alloc] init];
    self.data = 0;
    
    _homeView = [[HomeView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [_homeView viewInit];
    _homeView.tableView.delegate = self;
    _homeView.tableView.dataSource = self;
    [self.view addSubview:_homeView];
    
    _homeView.labelhinttop = [[UILabel alloc] init];
    //_homeView.labelhinttop.frame = CGRectMake(20, 290, 398, 20);
    _homeView.labelhinttop.font = [UIFont systemFontOfSize:15];
    _homeView.labelhinttop.textColor = [UIColor whiteColor];
    _homeView.labelhinttop.numberOfLines = 0;
    //_homeView.labelhinttop.backgroundColor = [UIColor redColor];
    //[_homeView.sv addSubview:_homeView.labelhinttop];
    
    _homeView.labeltop = [[UILabel alloc] init];
    //_homeView.labeltop.frame = CGRectMake(20, 240, 398, 60);
    _homeView.labeltop.font = [UIFont systemFontOfSize:25];
    _homeView.labeltop.textColor = [UIColor whiteColor];
    _homeView.labeltop.numberOfLines = 0;
    
    _beforeArray = [[NSMutableArray alloc] init];

    //[_homeView.sv addSubview:_homeView.labeltop];
    
    //self.data = [NSMutableArray new];
    _myModel = [[homeModel alloc] init];
    
    
    _btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btn.hidden = NO;
    
    [self Lastpost];
//    self.days++;
    
    UIImage *ima = [[UIImage imageNamed:@"2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *image = [[UIBarButtonItem alloc]initWithImage:ima style:UIBarButtonItemStyleDone target:self action:@selector(next)];
    self.navigationItem.rightBarButtonItems = @[image];
    
    // Do any additional setup after loading the view.
}

- (void) Lastpost {
    
    [[FirstManager sharedManger] NetworkRequestSuccess:^(homeModel * _Nonnull home1Model) {
            NSLog(@"传值成功！");
            //self.data = home1Model;
            self.myModel = [[homeModel alloc] init];
            self.myModel = home1Model;
            NSLog(@"%@", _myModel.stories[0]);
            NSLog(@"%@", _myModel.top_stories[0]);
    //        StoriesJSONModel *storiesModel = [[StoriesJSONModel alloc] init];
    //        storiesModel = self->_myModel.stories[0][5];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                for(int i = -1; i < COUNT + 1; i++) {
                    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * 413, 0, 413, 320)];

                    
                    if(i < COUNT && i > -1) {
                            Top_storiesJSONModel *model =self.myModel.top_stories[i];
                            
                                NSString *str1 = model.image;
                                NSLog(@"%@",model.image);
                                NSLog(@"%@", model.title);
                                //NSString *imageName;
                                [imageView sd_setImageWithURL:[NSURL URLWithString:str1] placeholderImage:[UIImage imageNamed:@"123.jpg"]];
//                        imageView.tag = i;
//                        NSLog(@"%ld",imageView.tag);
                        self.tag = i;
                        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)];
                        [imageView addGestureRecognizer:tapGesture];
                        imageView.userInteractionEnabled = YES;
                        
                        
                        self.homeView.labelhinttop = [[UILabel alloc] init];
                        //self.homeView.labelhinttop.frame = CGRectMake(20, 290, 398, 20);
                        self.homeView.labelhinttop.font = [UIFont systemFontOfSize:15];
                        self.homeView.labelhinttop.textColor = [UIColor whiteColor];
                        self.homeView.labelhinttop.numberOfLines = 0;
                        
                        self.homeView.labeltop = [[UILabel alloc] init];
                        //_homeView.labeltop.frame = CGRectMake(20, 240, 398, 60);
                        self.homeView.labeltop.font = [UIFont systemFontOfSize:25];
                        self.homeView.labeltop.textColor = [UIColor whiteColor];
                        self.homeView.labeltop.numberOfLines = 0;
                        
                                self.homeView.labeltop.text = model.title;//_myModel.stories[0][@"title"];
                                self.homeView.labelhinttop.text = model.hint;
                                self.homeView.labelhinttop.frame = CGRectMake(20 , 290, 398, 20);
                                self.homeView.labeltop.frame = CGRectMake(20, 210, 398, 80);
                        
                        [imageView addSubview:self.homeView.labeltop];
                                [imageView addSubview:self.homeView.labelhinttop];
                    }
                        //NSString *imageName = [NSString stringWithFormat:@"%d.png", 1];
                        if(i == -1) {
                            Top_storiesJSONModel *model2 = self.myModel.top_stories[4];
                            [imageView sd_setImageWithURL:[NSURL URLWithString:model2.image] placeholderImage:[UIImage imageNamed:@"123.jpg"]];
                            
                            self.homeView.labeltop.text =   model2.title;
                            self.homeView.labelhinttop.text = model2.hint;
                            
                            self.homeView.labelhinttop.frame = CGRectMake(20 , 290, 398, 20);
                            self.homeView.labeltop.frame = CGRectMake(20, 100, 398, 80);
//
                            [imageView addSubview:self.homeView.labeltop];
                            [imageView addSubview:self.homeView.labelhinttop];
                            
                            self.tag = COUNT;
                            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)];
                            [imageView addGestureRecognizer:tapGesture];
                            imageView.userInteractionEnabled = YES;
                            
                        }else if(i == COUNT ) {
                            Top_storiesJSONModel *model3 = self.myModel.top_stories[0];
                            [imageView sd_setImageWithURL:[NSURL URLWithString:model3.image] placeholderImage:[UIImage imageNamed:@"123.jpg"]];
                            
                            self.homeView.labelhinttop = [[UILabel alloc] init];
                            //self.homeView.labelhinttop.frame = CGRectMake(20, 290, 398, 20);
                            self.homeView.labelhinttop.font = [UIFont systemFontOfSize:15];
                            self.homeView.labelhinttop.textColor = [UIColor whiteColor];
                            self.homeView.labelhinttop.numberOfLines = 0;
                            
                            self.homeView.labeltop = [[UILabel alloc] init];
                            //_homeView.labeltop.frame = CGRectMake(20, 240, 398, 60);
                            self.homeView.labeltop.font = [UIFont systemFontOfSize:25];
                            self.homeView.labeltop.textColor = [UIColor whiteColor];
                            self.homeView.labeltop.numberOfLines = 0;
                            
                            self.homeView.labelhinttop.text = model3.hint;
                            self.homeView.labeltop.text =   model3.title;
                            self.homeView.labelhinttop.frame = CGRectMake(20 , 290, 398, 20);
                            self.homeView.labeltop.frame = CGRectMake(20, 210, 398, 80);
                            [imageView addSubview:self.homeView.labeltop];
                            [imageView addSubview:self.homeView.labelhinttop];
                            
                            self.tag = 0;
                            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)];
                            [imageView addGestureRecognizer:tapGesture];
                            imageView.userInteractionEnabled = YES;
                        }
                       
                    [self.homeView.sv addSubview:imageView];
                    }

                    
                //     UIImageView *imageView = [[UIImageView alloc] init];
                //     NSString *imageName = [NSString stringWithFormat:@"%d.png", 1];
                //    imageView.image = [UIImage imageNamed:imageName];
                //           [_homeView.sv addSubview:imageView];
                    
                    
                    

                    
                self.homeView.sv.contentSize = CGSizeMake((COUNT+2)  * 413, 320);
                self.homeView.sv.pagingEnabled = YES;
                self.homeView.sv.delegate = self;
                    
                self.homeView.pc.backgroundColor = [UIColor clearColor];
                self.homeView.pc.numberOfPages = COUNT;
                self.homeView.pc.currentPage = 0;
                self.homeView.pc.currentPageIndicatorTintColor = [UIColor whiteColor];
                    
                    [_homeView.pc addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
                
                
                [self.homeView.tableView reloadData];
            });
            

        } error:^(NSError * _Nonnull error) {
            NSLog(@"错误！");
        }];
}

//点击轮播图转换
- (void)imageBtnClick:(UIButton *)btn {
    
    CellViewController *cell = [[CellViewController alloc] init];
    StoriesJSONModel *Top_storiesJSONModel = self.myModel.top_stories[COUNT];
    [self presentViewController:cell animated:YES completion:nil];

}


- (void)post {
    self.isLoading = YES;
    //NSLog(@"%ld",self.days);
    [[FirstManager sharedManger] NetworkRequestdate:self.data succeed:^(homeModel * _Nonnull home1Model) {
        NSLog(@"传值成功3");
        [self.beforeArray addObject:home1Model];
       
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.homeView.tableView reloadData];
            self.isLoading = NO;
            //self.data--;
        });
    } error:^(NSError * _Nonnull error) {
        NSLog(@"添加失败1");
    }];
}

- (void)createTimer
{
    _homeView.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(runA) userInfo:nil repeats:YES];
}


- (void) runA
{
    [_homeView.sv setContentOffset:CGPointMake((_homeView.pc.currentPage +2) * 413, 0) animated:YES];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    if(tag == 1){
//
//    }
    //轮播图
    if (_homeView.sv.contentOffset.x == 0) {
        _homeView.sv.contentOffset = CGPointMake(COUNT * 413, 0);
    }else if (_homeView.sv.contentOffset.x == (COUNT + 1) * 413) {
        _homeView.sv.contentOffset = CGPointMake(413, 0);
    }
    _homeView.pc.currentPage = _homeView.sv.contentOffset.x / 413 - 1;
    
    //double remove = 0.13 * self.homeView.frame.size.height * self.myModel.stories.count + 200 - self.view.frame.size.height;
    //if(scrollView.contentOffset
    
    //下拉刷新
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    CGSize contentSize = scrollView.contentSize;
    float y = offset.y + bounds.size.height;
    float h = contentSize.height;
    float Reloaddistance = -10;
    //NSLog(@"%f %f",y,h+Reloaddistance);
    
    // TODO:  @jiangkaiwen
    // 加入flag，防止多次刷新,但是加了也并没用，，，
    if (scrollView.contentOffset.y > 0.13 * self.homeView.frame.size.height * self.myModel.stories.count + 200 - self.view.frame.size.height) {
    if(y > h + Reloaddistance - 120) {
        if(self.isLoading ) {
            return;
        }else {
            self.days++;
            NSLog(@"zaizhe%ld",_days);
            [self post];
            self.data++;
            //self.isLoading = NO;
        }
    }
    }
}

//- (void)imageBtnClick:(UIButton *)btn {
//    //    NSLog(@"%ld",btn.tag);
//    if ([self respondsToSelector:@selector(carouselView:indexOfClickedImageBtn:)])
//    {
//        [self ne
//    }
//    
//}
     

- (void) change: (UIPageControl *)pc
{
    [_homeView.sv setContentOffset:CGPointMake(_homeView.pc.currentPage * 413, 0) animated:YES];
    
}




-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //停止定时器
    [_homeView.timer invalidate];
}


//当不再按图片 也就是松开的时候 立马调用计时器方法
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    //用scheduledTimerWithTimeInterval 创建定时器是用的系统默认的方法 当遇见多线程时候会出现问题
    //    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    //所以还是调用上面创建的定时器方法
    [self createTimer];
}


//单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return /*1.3 * self.homeView.frame.size.height*/120;
}

//组内行数
- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _myModel.stories.count;
}

//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.days + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    if(indexPath.section == 0) {
        self.homeView.tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        //StoriesJSONModel *story = _myModel;
        //NSLog(@"%@", [self.myModel.stories[indexPath.row] title]);
        self.homeView.tableViewCell.label.text =  [self.myModel.stories[indexPath.row] title];//_myModel.stories[0][@"title"];
        self.homeView.tableViewCell.labelhint.text = [self.myModel.stories[indexPath.row] hint];
        
        NSString *str = [self.myModel.stories[indexPath.row] images][0];
        
        [self.homeView.tableViewCell.image sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"123.jpg"]];
    //    [self.mainView.tableViewCell.rightImageView sd_setImageWithURL:[NSURL URLWithString:story.images[0]] placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
        
        
        return self.homeView.tableViewCell;
    }
    else {
        self.homeView.tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
            //StoriesJSONModel *story = _myModel;
            //NSLog(@"%@", [self.beforeModel.stories[indexPath.row] title]);
        
//        StoriesModel *model = _beforeArray[indexPath.section - 1][indexPath.row];
//        self.homeView.tableViewCell.label.text = model.title;//_myModel.stories[0][@"title"];
//        self.homeView.tableViewCell.labelhint.text = model.hint;
//        NSString *str = model.images[0];
//
        
        //NSLog(@"%@", _beforeArray[indexPath.section-1]);
        BeforeModel *model = _beforeArray[indexPath.section - 1];
        self.homeView.tableViewCell.label.text = [model.stories[indexPath.row] title];//_myModel.stories[0][@"title"];
        self.homeView.tableViewCell.labelhint.text = [model.stories[indexPath.row] hint];

        NSString *str = [model.stories[indexPath.row] images][0];
        
        
//        self.homeView.tableViewCell.label.text =  [self.beforeModel.stories[indexPath.row] title];//_myModel.stories[0][@"title"];
//        self.homeView.tableViewCell.labelhint.text = [self.beforeModel.stories[indexPath.row] hint];
//
//        NSString *str = [self.beforeModel.stories[indexPath.row] images][0];
        
            [self.homeView.tableViewCell.image sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"123.jpg"]];
        //    [self.mainView.tableViewCell.rightImageView sd_setImageWithURL:[NSURL URLWithString:story.images[0]] placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
            return self.homeView.tableViewCell;
    }
}






- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     if(indexPath.section == 0) {
        CellViewController *cell = [[CellViewController alloc] init];
        StoriesJSONModel *storiesmodel =self.myModel.stories[indexPath.row];
        cell.idstr = storiesmodel.id;
        
        //CoViewController *comment = [[CommentViewController alloc] init];
        cell.idstr = [self.myModel.stories[indexPath.row] id];
        NSLog(@"comment的idstr%@",cell.idstr);
        
        cell.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:cell animated:YES completion:nil];
     } else {
         CellViewController *cell = [[CellViewController alloc] init];
         BeforeModel *beforestoriesmodel = _beforeArray[indexPath.section - 1];
         cell.idstr = [beforestoriesmodel.stories[indexPath.row] id];
         NSLog(@"cell和评论的idstr%@",cell.idstr);
         
         cell.modalPresentationStyle = UIModalPresentationFullScreen;
         [self presentViewController:cell animated:YES completion:nil];
     }
}


- (void) next {
    nextViewController *next = [[nextViewController alloc] init];
    
    [self.navigationController pushViewController:next animated:YES];
}

- (void)clickImage :(int ) i{
    CellViewController *cell = [[CellViewController alloc] init];
    NSLog(@"%d", i);
    Top_storiesJSONModel *topstoriesmodel = self.myModel.top_stories[i];
    cell.idstr = topstoriesmodel.id;
    NSLog(@"cell的id%@",cell.idstr);
    
    cell.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:cell animated:YES completion:nil];
}


@end
