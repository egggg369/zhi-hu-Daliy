//
//  CommentViewController.m
//  zhihu
//
//  Created by 郭红乐 on 2020/11/15.
//  Copyright © 2020 无. All rights reserved.
//

#import "CommentViewController.h"
#import "CommentManager.h"
#import "CommentModel.h"
#import "CommentTotalModel.h"
#import "CommentTableViewCell.h"
#include <SDWebImage/UIImageView+WebCache.h>
#include <Masonry.h>
@interface CommentViewController ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation CommentViewController {
    //BOOL flag;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    _mycommentView = [[CommentView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [_mycommentView viewInit];
    [self.view addSubview:_mycommentView];
    _mycommentView.tableView.delegate = self;
    _mycommentView.tableView.dataSource = self;
    //[self.mycommentView.tableView registerClass:[CommentTableViewCell class] forCellReuseIdentifier:@"cell"];
    //优雅的自适应高度
    self.mycommentView.tableView.rowHeight = UITableViewAutomaticDimension;
    self.mycommentView.tableView.estimatedRowHeight = 176;
    
    [self post:_idstr];
    [self postLongComment:_idstr];
    [self postShortComment:_idstr];
    
    NSLog(@"%@", self.idstr);
    //flag = YES;
    //[self postShortComment:_idstr];
    
    NSMutableArray *cellArray1 = [NSMutableArray arrayWithArray:@[@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO]];
    NSMutableArray *cellArray2 = [NSMutableArray arrayWithArray:@[@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO]];
    _cellArray = [NSMutableArray new];
    [_cellArray addObject:cellArray1];
    [_cellArray addObject:cellArray2];
    
}

- (void)post:(NSString *)idstr {
    [[CommentManager sharedManger] NetworkRequestTotalcomment:self.idstr succeed:^(CommentTotalModel *commentTotalModel) {
        
        self.mycommentTotalModel = [[CommentTotalModel alloc] init];
        self.mycommentTotalModel = commentTotalModel;
        NSLog(@"%@总结长",self.mycommentTotalModel.long_comments);
        NSLog(@"%@总结短",self.mycommentTotalModel.short_comments);
        NSLog(@"传值成功评论总结");
    } error:^(NSError *error) {
        NSLog(@"添加失败!");
    }];
}

- (void)postLongComment :(NSString *)idstr{
    //[[FirstManager sharedManger] NetworkRequestdate:self.data succeed:^(homeModel * _Nonnull home1Model)
    
    [[CommentManager sharedManger] NetworkRequestLongcomment:self.idstr succeed:^(CommentLongModel *commentlongModel) {
        NSLog(@"传值成功long");
        self.mylongcommentModel = [[CommentLongModel alloc] init];
        self.mylongcommentModel = commentlongModel;
        //NSLog(@"%@", self.mylongcommentModel.comments[0]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            //[self calculateLongCommitsHeight];
            [self.mycommentView.tableView reloadData];
        });
    } error:^(NSError *error) {
        NSLog(@"添加失败C1");
    }];
}

- (void)postShortComment :(NSString *)idstr{
    [[CommentManager sharedManger] NetworkRequestShortcomment:self.idstr succeed:^(CommentModel *commentshortModel) {
            NSLog(@"传值成功short");
        NSLog(@"%@", commentshortModel);
        self.myshortcommentModel = [[CommentModel alloc] init];
        self.myshortcommentModel = commentshortModel;
        NSLog(@"%@",self.myshortcommentModel);
        NSLog(@"%@", self.myshortcommentModel.comments[0]);
            dispatch_sync(dispatch_get_main_queue(), ^{
                 [self.mycommentView.tableView reloadData];
            });
        } error:^(NSError *error) {
            NSLog(@"添加失败C2");
        }];
}

//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if([self.mycommentTotalModel.long_comments integerValue] == 0) {
        return 1;
    }
    return 2;
}

//组内行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([self.mycommentTotalModel.long_comments integerValue] == 0) {
        NSLog(@"%@ section",self.mycommentTotalModel.short_comments);
                       if ([self.mycommentTotalModel.short_comments integerValue] > 20) {
                           return 20;
                       } else{
                           return [self.mycommentTotalModel.short_comments integerValue];
                       }
    }
    else {
        if (section == 0) {
            NSLog(@"%@ section",self.mycommentTotalModel.long_comments);
            if ([self.mycommentTotalModel.long_comments integerValue] > 13) {
                return 20;
            } else{
                return [self.mycommentTotalModel.long_comments integerValue];
            }
            
        }
        else{
            NSLog(@"%@ section",self.mycommentTotalModel.short_comments);
            if ([self.mycommentTotalModel.short_comments integerValue] > 20) {
                return 20;
            } else{
                return [self.mycommentTotalModel.short_comments integerValue];
            }
        }
        }
}

 - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
     // TODO：多余代码
     if ([self.mycommentTotalModel.long_comments integerValue] == 0) {
         return 36;
     } else{
         if (section == 0) {
             return 36;
         } else{
             return 36;
         }
     }
 }

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if ([self.mycommentTotalModel.long_comments integerValue] == 0) {
            UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 42)];
            headView.backgroundColor = [UIColor whiteColor];
        
            // TODO：shortCommentTitleLabel
            UILabel *label = [[UILabel alloc] init];
            [headView addSubview:label];
        
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(headView.mas_left).offset(20);
                make.top.mas_equalTo(headView.mas_top).offset(4);
                make.width.equalTo(@100);
                make.height.equalTo(@22);
            }];
        
            //label.text = [NSString stringWithFormat:@"%@条短评", self.mycommentTotalModel.short_comments];
        if ([self.mycommentTotalModel.short_comments integerValue] > 20) {
            label.text = [NSString stringWithFormat:@"%d条短评", 20];
        } else{
            label.text = [NSString stringWithFormat:@"%@条短评", self.mycommentTotalModel.short_comments];
        }
            label.textAlignment = NSTextAlignmentLeft;
            label.textColor = [UIColor blackColor];
        
            return headView;
    } else{
        if(section == 0) {
            UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 42)];
            headView.backgroundColor = [UIColor whiteColor];
            UILabel *label = [[UILabel alloc] init];
            //label.text = [NSString stringWithFormat:@"%@条长评", self.mycommentTotalModel.long_comments];
            if ([self.mycommentTotalModel.short_comments integerValue] > 13) {
                label.text = [NSString stringWithFormat:@"%d条短评", 13];
            } else{
                label.text = [NSString stringWithFormat:@"%@条短评", self.mycommentTotalModel.long_comments];
            }
            label.textAlignment = NSTextAlignmentLeft;
            label.textColor = [UIColor blackColor];
            [headView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(headView.mas_left).offset(20);
                make.top.mas_equalTo(headView.mas_top).offset(4);
                make.width.equalTo(@100);
                make.height.equalTo(@22);
            }];
            return headView;
        }else {
            UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 42)];
            headView.backgroundColor = [UIColor whiteColor];
            UILabel *label = [[UILabel alloc] init];
            //label.text = [NSString stringWithFormat:@"%@条短评", self.mycommentTotalModel.short_comments];
            if ([self.mycommentTotalModel.short_comments integerValue] > 20) {
                label.text = [NSString stringWithFormat:@"%d条短评", 20];
            } else{
                label.text = [NSString stringWithFormat:@"%@条短评", self.mycommentTotalModel.short_comments];
            }
            
            label.textAlignment = NSTextAlignmentLeft;
            label.textColor = [UIColor blackColor];
            [headView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(headView.mas_left).offset(20);
                make.top.mas_equalTo(headView.mas_top).offset(4);
                make.width.equalTo(@100);
                make.height.equalTo(@22);
            }];
            return headView;
        }
    }
}


                                  
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
//{
//    return 276;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if([self.mycommentTotalModel.long_comments integerValue] == 0) {
            CommentTableViewCell *commentTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        if([_cellArray[0][indexPath.row] isEqual:@YES]) {
            [commentTableViewCell cellOpen];
            commentTableViewCell.foldButton.selected = YES;
        }
            _str = [self.myshortcommentModel.comments[indexPath.row] avatar];
            [commentTableViewCell.imageview sd_setImageWithURL:[NSURL URLWithString:_str] placeholderImage:[UIImage imageNamed:@"123.jpg"]];
            
            commentTableViewCell.idLabel.text = [self.myshortcommentModel.comments[indexPath.row] author];
            commentTableViewCell.contentLabel.text = [self.myshortcommentModel.comments[indexPath.row] content];
            commentTableViewCell.timeLabel.text = [self.myshortcommentModel.comments[indexPath.row] time];
//        commentTableViewCell.replyLabel.text = [[self.myshortcommentModel.comments[indexPath.row] reply_to] content];
//        commentTableViewCell.foldButton
            [commentTableViewCell.likeButton setTitle:[self.myshortcommentModel.comments[indexPath.row] likes] forState:UIControlStateNormal];
            [commentTableViewCell.likeButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
        
        //判断回复label是否存在
        if([self.myshortcommentModel.comments[indexPath.row] reply_to] == nil) {
            commentTableViewCell.replyLabel.text = nil;
            commentTableViewCell.foldButton.hidden = YES;
        }else {
            commentTableViewCell.foldButton.hidden = NO;
            
            //回复颜色
            NSString *str = [NSString stringWithFormat:@"//%@:",[[self.myshortcommentModel.comments[indexPath.row]reply_to] author]];
            NSMutableString *replyStr = [[NSMutableString alloc] initWithString:str];
            [replyStr appendString:[[self.myshortcommentModel.comments[indexPath.row] reply_to] content]];
            NSMutableAttributedString *replycolorStr = [[NSMutableAttributedString alloc] initWithString:replyStr];
            NSRange r1 = NSMakeRange(0, 2);
            NSRange r2 = NSMakeRange(2, [[[self.myshortcommentModel.comments[indexPath.row] reply_to] content] length] - 1);
            [replycolorStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.53f green:0.53f blue:0.53f alpha:1.00f] range:r1];
            [replycolorStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.53f green:0.53f blue:0.53f alpha:1.00f] range:r2];
            //重新加载
            [commentTableViewCell.replyLabel setAttributedText:replycolorStr];
            [commentTableViewCell.foldButton addTarget:self action:@selector(reloadButton:) forControlEvents:UIControlEventTouchUpInside];
            
            
            //判断cell行数
            NSInteger count = [self textHeightFromTextString:replyStr width:338 fontSize:17].height/commentTableViewCell.replyLabel.font.lineHeight;
            if (count <= 2) {
                commentTableViewCell.foldButton.hidden = YES;
            }else {
                commentTableViewCell.foldButton.hidden = NO;
            }
        }
        
        
        
        if([_cellArray[0][indexPath.row] isEqual:@NO]) {
            [commentTableViewCell cellClose];
            commentTableViewCell.foldButton.selected = NO;
        }
        
        
            return commentTableViewCell;
    }else {
        if(indexPath.section == 0) {
            CommentTableViewCell *commentTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
            
            if([_cellArray[0][indexPath.row] isEqual:@YES]) {
                [commentTableViewCell cellOpen];
                commentTableViewCell.foldButton.selected = YES;
            }
            
            if (!commentTableViewCell) {
                commentTableViewCell = [[CommentTableViewCell alloc] init];
            }
            
            _str = [self.mylongcommentModel.comments[indexPath.row] avatar];
            [commentTableViewCell.imageview sd_setImageWithURL:[NSURL URLWithString:_str] placeholderImage:[UIImage imageNamed:@"123.jpg"]];
            
            commentTableViewCell.idLabel.text = [self.mylongcommentModel.comments[indexPath.row] author];
            commentTableViewCell.contentLabel.text = [self.mylongcommentModel.comments[indexPath.row] content];
            [commentTableViewCell.likeButton setTitle:[self.mylongcommentModel.comments[indexPath.row] likes] forState:UIControlStateNormal];
            [commentTableViewCell.likeButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
            //commentTableViewCell.timeLabel.text = [ZHDDateUtils getDateStringWithTimeStr:[self.longCommentsModel.comments[indexPath.row] time]];
            
            //判断回复label是否存在
            if([self.mylongcommentModel.comments[indexPath.row] reply_to] == nil) {
                commentTableViewCell.replyLabel.text = nil;
                commentTableViewCell.foldButton.hidden = YES;
            }else {
                commentTableViewCell.foldButton.hidden = NO;
                
                NSString *str = [NSString stringWithFormat:@"//%@:",[[self.mylongcommentModel.comments[indexPath.row]reply_to] author]];
                NSMutableString *replyStr = [[NSMutableString alloc] initWithString:str];
                [replyStr appendString:[[self.mylongcommentModel.comments[indexPath.row] reply_to] content]];
                NSMutableAttributedString *replycolorStr = [[NSMutableAttributedString alloc] initWithString:replyStr];
                NSRange r1 = NSMakeRange(0, 2);
                NSRange r2 = NSMakeRange(2, [[[self.mylongcommentModel.comments[indexPath.row] reply_to] content] length] - 1);
                [replycolorStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.53f green:0.53f blue:0.53f alpha:1.00f] range:r1];
                [replycolorStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.53f green:0.53f blue:0.53f alpha:1.00f] range:r2];
                //[commentTableViewCell.replyLabel setAttributedText:replycolorStr];
                [commentTableViewCell.foldButton addTarget:self action:@selector(reloadButton:) forControlEvents:UIControlEventTouchUpInside];
                
                
                //判断cell行数
                NSInteger count = [self textHeightFromTextString:replyStr width:338 fontSize:17].height/commentTableViewCell.replyLabel.font.lineHeight;
                if (count <= 2) {
                    commentTableViewCell.foldButton.hidden = YES;
                }else {
                    commentTableViewCell.foldButton.hidden = NO;
                }
                
            }
            
            
            if([_cellArray[0][indexPath.row] isEqual:@NO]) {
                [commentTableViewCell cellClose];
                commentTableViewCell.foldButton.selected = NO;
            }
        
            return commentTableViewCell;
        }
        else {
            CommentTableViewCell *commentTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
            NSLog(@"%ld Count",indexPath.row);
            
            if([_cellArray[1][indexPath.row] isEqual:@YES]) {
                [commentTableViewCell cellOpen];
                commentTableViewCell.foldButton.selected = YES;
            }
            
            if (!commentTableViewCell) {
                commentTableViewCell = [[CommentTableViewCell alloc] init];
            }
            
            _str = [self.myshortcommentModel.comments[indexPath.row] avatar];
            [commentTableViewCell.imageview sd_setImageWithURL:[NSURL URLWithString:_str] placeholderImage:[UIImage imageNamed:@"123.jpg"]];
            
            commentTableViewCell.idLabel.text = [self.myshortcommentModel.comments[indexPath.row] author];
            commentTableViewCell.contentLabel.text = [self.myshortcommentModel.comments[indexPath.row] content];
            commentTableViewCell.timeLabel.text = [self.myshortcommentModel.comments[indexPath.row] time];
            [commentTableViewCell.likeButton setTitle:[self.myshortcommentModel.comments[indexPath.row] likes] forState:UIControlStateNormal];
            [commentTableViewCell.likeButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
            
            //判断回复label是否存在
            if([self.myshortcommentModel.comments[indexPath.row] reply_to] == nil) {
                commentTableViewCell.replyLabel.text = nil;
                commentTableViewCell.foldButton.hidden = YES;
            }else {
                commentTableViewCell.foldButton.hidden = NO;
                
                NSString *str = [NSString stringWithFormat:@"//%@:",[[self.myshortcommentModel.comments[indexPath.row]reply_to] author]];
                NSMutableString *replyStr = [[NSMutableString alloc] initWithString:str];
                [replyStr appendString:[[self.myshortcommentModel.comments[indexPath.row] reply_to] content]];
                NSMutableAttributedString *replycolorStr = [[NSMutableAttributedString alloc] initWithString:replyStr];
                NSRange r1 = NSMakeRange(0, 2);
                NSRange r2 = NSMakeRange(2, [[[self.myshortcommentModel.comments[indexPath.row] reply_to] content] length] - 1);
                [replycolorStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.53f green:0.53f blue:0.53f alpha:1.00f] range:r1];
                [replycolorStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.53f green:0.53f blue:0.53f alpha:1.00f] range:r2];
                [commentTableViewCell.replyLabel setAttributedText:replycolorStr];
                //commentTableViewCell.replyLabel.text = replycolorStr;
                [commentTableViewCell.foldButton addTarget:self action:@selector(reloadButton:) forControlEvents:UIControlEventTouchUpInside];
                
                //判断cell行数
                NSInteger count = [self textHeightFromTextString:replyStr width:338 fontSize:17].height/commentTableViewCell.replyLabel.font.lineHeight;
                if (count <= 2) {
                    commentTableViewCell.foldButton.hidden = YES;
                }else {
                    commentTableViewCell.foldButton.hidden = NO;
                }
            }
            
            
            //判断cell是否处于展开状态
            if([_cellArray[1][indexPath.row] isEqual:@NO]) {
                [commentTableViewCell cellClose];
                commentTableViewCell.foldButton.selected = NO;
            }
            
            
            
            
            return commentTableViewCell;
        }
    }
    
    
}

//通过点击UITableViewCell中的Button来获取当前Cell的indexPath
- (void)reloadButton:(UIButton *)button{
    CommentTableViewCell *cell = (CommentTableViewCell *)[[button superview] superview];
    NSIndexPath *indexPath = [_mycommentView.tableView indexPathForCell:cell];
    if ([_cellArray[indexPath.section][indexPath.row]  isEqual:@YES]) {
        _cellArray[indexPath.section][indexPath.row] = @NO;
    } else {
        _cellArray[indexPath.section][indexPath.row] = @YES;
    }
    [_mycommentView.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

//计算 label需要的宽度和高度方法
-(CGSize)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size{
    
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    CGSize size1 = [text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:size]}];
    
    return CGSizeMake(size1.width, rect.size.height);
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
