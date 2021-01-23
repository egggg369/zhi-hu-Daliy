//
//  nextViewController.m
//  zhihu
//
//  Created by 郭红乐 on 2020/10/29.
//  Copyright © 2020 无. All rights reserved.
//

#import "nextViewController.h"
#import "StarViewController.h"
#import "CellViewController.h"

@interface nextViewController ()

@end

@implementation nextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _labelname = [[UILabel alloc] initWithFrame:CGRectMake(170, 250, 160, 40)];
    _labelname.font = [UIFont systemFontOfSize:26];
    _labelname.textColor = [UIColor blackColor];
    _labelname.text = @"无所谓";
    [self.view addSubview:_labelname];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shezhi-01"]];
    _image1.frame = CGRectMake(270, 760, 40, 40);
//    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"开机界面.jpg"]];
//     img.frame =  self.view.bounds;
//    img.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_image1];
    
    _image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yueliang"]];
    _image2.frame = CGRectMake(100, 760, 40, 40);
    [self.view addSubview:_image2];
    
    _imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3"]];
    _imageview.frame = CGRectMake(176, 180, 70, 70);
    // 必須加上這一行，這樣圓角才會加在圖片的「外側」
    _imageview.layer.masksToBounds=YES;
    _imageview.layer.cornerRadius=34.0;
    
    // 其實就是設定圓角，只是圓角的弧度剛好就是圖片尺寸的一半
    //_imageview.layer.cornerRadius = NSPageSize / 2.0;
    [self.view addSubview:_imageview];
    
    _label1 = [[UILabel alloc] init];
    _label1.frame = CGRectMake(95, 810, 100, 20);
    _label1.text = @"夜间模式";
    _label1.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_label1];
    
    _label2 = [[UILabel alloc] init];
    _label2.frame = CGRectMake(276, 810, 60, 20);
    _label2.font = [UIFont systemFontOfSize:15];
    _label2.text = @"设置";
    [self.view addSubview:_label2];
    
    
    
    
    [self createUI];
    
    // Do any additional setup after loading the view.
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


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell01 = nil;
    UITableViewCell *cell02 = nil;
    
    cell01 = [_tableView dequeueReusableCellWithIdentifier:@"cell01"];
    cell02 = [_tableView dequeueReusableCellWithIdentifier:@"cell02"];
    
    
    if(indexPath.section == 0) {
        if(cell01 == nil) {
            cell01 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell01"];
        }
        cell01.textLabel.text = @"我的收藏";
        cell01.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell01;
    }
    else{
        if(cell02 == nil) {
            cell02 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell01"];
        }
        cell02.textLabel.text = @"消息中心";
        cell02.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell02;
    }
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0) {
        StarViewController *starview = [[StarViewController alloc] init];
        
//        starview.testBlock = ^(NSString *name) {
//            self->path = name;
//        }
//        - (void) next {
//            nextViewController *next = [[nextViewController alloc] init];
//
//            [self.navigationController pushViewController:next animated:YES];
//        }

        
//        starview.modalPresentationStyle = UIModalPresentationFullScreen;
//        [self presentViewController:starview animated:YES completion:nil];
        [self.navigationController pushViewController:starview animated:YES];
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
