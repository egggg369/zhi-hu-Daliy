//
//  CommentManager.m
//  zhihu
//
//  Created by 郭红乐 on 2020/11/15.
//  Copyright © 2020 无. All rights reserved.
//

#import "CommentManager.h"

@implementation CommentManager

static CommentManager *manager = nil;

+ (instancetype) sharedManger {
    if(!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [CommentManager new];
        });
    }
    return manager;
}

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler{
    NSURLCredential *card = [[NSURLCredential alloc] initWithTrust:challenge.protectionSpace.serverTrust];
    completionHandler(NSURLSessionAuthChallengeUseCredential,card);
}

- (void) NetworkRequestTotalcomment:(NSString *)ID succeed:(CommentTotalBlock)succeedBlock error:(ErrorBlock)errorBlock
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *url = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/story-extra/%@", ID];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil) {
            NSDictionary *requestDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            CommentTotalModel *commentTotalModel = [[CommentTotalModel alloc] initWithDictionary:requestDictionary error:nil];
            succeedBlock(commentTotalModel);
        }
        else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
}


- (void) NetworkRequestLongcomment:(NSString *)ID succeed:(CommentLongBlock) succeedBlock error:(ErrorBlock) errorBlock{
    //网络请求
    NSString *longcommentURLStr = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/story/%@/long-comments",ID];
    NSURL *longcommentURL = [NSURL URLWithString:longcommentURLStr];
    NSURLRequest *longcommentRequest = [NSURLRequest requestWithURL:longcommentURL];
    //NSURLSession *longcommentSession = [NSURLSession sharedSession];
    NSURLSession *longcommentSession=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
   // NSURLSession *longcommentSession=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
    NSURLSessionDataTask *longcommentdataTask = [longcommentSession dataTaskWithRequest:longcommentRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil) {
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:data  options:NSJSONReadingMutableContainers error:nil];
            CommentLongModel *comment1Model = [[CommentLongModel alloc] initWithDictionary:resultDic error:&error];
            succeedBlock(comment1Model);
        }else {
            errorBlock(error);
        }
    }];
    [longcommentdataTask resume];
}

- (void)NetworkRequestShortcomment:(NSString *)ID succeed:(CommentShortBlock) succeedBlock error:(ErrorBlock) errorBlock{
    //网络请求
    NSString *shortcommentURLStr = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/story/%@/short-comments",ID];
    NSURL *shortcommentURL = [NSURL URLWithString:shortcommentURLStr];
    NSURLRequest *shortcommentRequest = [NSURLRequest requestWithURL:shortcommentURL];
    //NSURLSession *shortcommentSession = [NSURLSession sharedSession];
    //NSURLSession *shortcommentSession=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
    //NSURLSession *longcommentSession=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
    NSURLSession *shortcommentsession = [NSURLSession sharedSession];
    NSURLSessionDataTask *shortcommentdataTask = [shortcommentsession dataTaskWithRequest:shortcommentRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil) {
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:data  options:NSJSONReadingMutableContainers error:nil];
            CommentModel *comment2Model = [[CommentModel alloc] initWithDictionary:resultDic error:&error];
            succeedBlock(comment2Model);
        }else {
            errorBlock(error);
        }
    }];
    [shortcommentdataTask resume];
}


@end
