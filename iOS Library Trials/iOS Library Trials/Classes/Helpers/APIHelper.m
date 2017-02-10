//
//  APIHelper.m
//  iOS Library Trials
//
//  Created by Vea Novenario on 10/2/17.
//  Copyright © 2017 Vea Novenario. All rights reserved.
//

#import "APIHelper.h"

@implementation APIHelper

-(id)init{
    self = [super init];
    if (self) {
        
        // Init AFHTTPSessionManager
        self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kAPIBaseURL]];
        self.manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        [self.manager.requestSerializer setValue:kAPIKey forHTTPHeaderField:@"X-API-KEY"];
    }
    return self;
}

-(void)connectDotNetStartSession{
    
    NSString *connectDotNetURL = @"http://www.my-ankaa.com/mobileservices/publicmembers.asmx/";
    self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:connectDotNetURL]];
    self.manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    [self.manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.manager.responseSerializer = [AFXMLParserResponseSerializer serializer];

    NSString *apiName = @"StartSession";

//    NSString *parameter = @"\"Description\":\"{\"Header\":null,\"Data\":\"{\\\"domain\\\":\\\"my-ankaa\\\",\\\"sessionid\\\":\\\"5295894e-8d86-4d60-a35a-435dde302e63\\\",\\\"logintype\\\":\\\"0\\\"}\"}\"";
    
    // sample for error
//    NSDictionary *parameter = @{@"Description":@"1"};
    
    // with backslash
    NSDictionary *parameter = @{@"Description":@"{\"Header\":null,\"Data\":\"{\\\"domain\\\":\\\"my-ankaa\\\",\\\"sessionid\\\":\\\"5295894e-8d86-4d60-a35a-435dde302e63\\\",\\\"logintype\\\":\\\"0\\\"}\"}"};
    
    // w/o backslash
//    NSDictionary *parameter = @{@"Description":@"{\"Header\":null,\"Data\":\"{\"domain\":\"my-ankaa\",\"sessionid\":\"5295894e-8d86-4d60-a35a-435dde302e63\",\"logintype\":\"0\"}\"}"};
    
    DLog(@"[ URL ] %@%@", self.manager.baseURL,apiName);
    DLog(@"[ Param ] %@", parameter)
    
    [SVProgressHUD show];
    
    [self.manager POST:apiName parameters:parameter progress:^(NSProgress *uploadProgress){
    } success:^(NSURLSessionDataTask * __unused task, id result) {
        
        DLog(@"[ RESULT ] %@",result );

        NSXMLParser *XMLParser = (NSXMLParser *)result;
        [XMLParser setShouldProcessNamespaces:YES];
        XMLParser.delegate = self;
        [XMLParser parse];
        
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        DLog(@"[ Error ] %@", error);
        
        [SVProgressHUD dismiss];
    }];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    DLog(@"[ XML ] %@",string);
    
    // Deserialize 1
//    NSData* data = [string dataUsingEncoding:NSUTF8StringEncoding];
//    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
//    DLog(@"[ RESULT ] %@",result);
    
    NSData *sessionData = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *sessionDict = [NSJSONSerialization JSONObjectWithData:sessionData options:NSJSONReadingAllowFragments error:NULL];
    NSString *headerString = [sessionDict objectForKey:@"Header"];
    NSData* headerData = [headerString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:headerData options:NSJSONReadingAllowFragments error:NULL];
    DLog(@"[ RESULT ] %@",result);
}

@end
