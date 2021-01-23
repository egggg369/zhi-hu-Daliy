//
//  FirstManager.m
//  zhihu
//
//  Created by 郭红乐 on 2020/10/21.
//  Copyright © 2020 无. All rights reserved.
//

#import "FirstManager.h"
#import "homeModel.h"
#import "Date.h"
@implementation FirstManager

static FirstManager *manager = nil;

+ (instancetype) sharedManger {
    if(!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [FirstManager new];
        });
    }
    return manager;
}

- (void) NetworkRequestSuccess:(Block) succeedBlock error:(ErrorBlock) errorBlock{
    //网络请求
    NSString *firstURLStr = [NSString stringWithFormat:@"https:/news-at.zhihu.com/api/4/news/latest"];
    NSURL *firstURL = [NSURL URLWithString:firstURLStr];
    NSURLRequest *firstRequest = [NSURLRequest requestWithURL:firstURL];
    //NSURLSession *firstSession = [NSURLSession sharedSession];
    NSURLSession *firstSession=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
    NSURLSessionDataTask *firstdataTask = [firstSession dataTaskWithRequest:firstRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil) {
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:data  options:NSJSONReadingMutableContainers error:nil];
            homeModel *firstModel = [[homeModel alloc] initWithDictionary:resultDic error:&error];
            succeedBlock(firstModel);
        }else {
            errorBlock(error);
        }
    }];
    [firstdataTask resume];
}


- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler{
    NSURLCredential *card = [[NSURLCredential alloc] initWithTrust:challenge.protectionSpace.serverTrust];
    completionHandler(NSURLSessionAuthChallengeUseCredential,card);
}


    
//}



- (void) NetworkRequestdate:(NSInteger)data succeed:(Block)succeedBlock error:(ErrorBlock)errorBlock
{
    NSString *dateURLStr = nil;
    dateURLStr = [@"https://news.at.zhihu.com/api/4/news/before/"stringByAppendingString:[Date dateStringBeforeDays:data] ];
    NSLog(@"%@",[Date dateStringBeforeDays:data]);
    NSURL *dateURL = [NSURL URLWithString:dateURLStr];
    NSURLRequest *dateRequest = [NSURLRequest requestWithURL:dateURL];
   // NSURLSession *dateSession = [NSURLSession sharedSession];
   // NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
    //config.TLSMaximumSupportedProtocol = kTLSProtocol1;
   // NSURLSession *dateSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    NSURLSession *dateSession=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
    NSURLSessionDataTask *datedataTask = [dateSession dataTaskWithRequest:dateRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            homeModel *dateModel = [[homeModel alloc] initWithDictionary:resultDic error:&error];
            succeedBlock(dateModel);
        }else {
            errorBlock(error);
        }
    }];
    [datedataTask resume];
    //data++;
}

- (void) NetworkRequestStar:(NSString *)starID  succeed:(StarBlock)succeedBlock error:(ErrorBlock)errorBlock {
    //网络请求
    NSString *URLStr = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/news/%@",starID];
    NSURL *URL = [NSURL URLWithString:URLStr];
    NSURLRequest *Request = [NSURLRequest requestWithURL:URL];
    //NSURLSession *firstSession = [NSURLSession sharedSession];
    NSURLSession *Session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
    NSURLSessionDataTask *dataTask = [Session dataTaskWithRequest:Request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error == nil) {
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:data  options:NSJSONReadingMutableContainers error:nil];
            StarModel *starModel = [[StarModel alloc] initWithDictionary:resultDic error:&error];
            succeedBlock(starModel);
        }else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
}



@end
