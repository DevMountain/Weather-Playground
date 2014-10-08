//
//  NetworkController.m
//  Weather Playground
//
//  Created by Taylor Mott on 10.7.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "NetworkController.h"

@implementation NetworkController

+ (AFHTTPSessionManager *)api {
    
    static AFHTTPSessionManager *api = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/"]];
        api.responseSerializer = [AFJSONResponseSerializer serializer];
        
    });
    return api;
}

@end
