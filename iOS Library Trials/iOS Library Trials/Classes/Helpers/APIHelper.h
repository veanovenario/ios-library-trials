//
//  APIHelper.h
//  iOS Library Trials
//
//  Created by Vea Novenario on 10/2/17.
//  Copyright © 2017 Vea Novenario. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface APIHelper : NSObject <NSXMLParserDelegate>

@property (nonatomic, strong) AFHTTPSessionManager *manager;

// ConnectDotNet Test
-(void)connectDotNetStartSession;

@end
