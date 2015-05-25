//
//  NetworkController.m
//  Weather Playground
//
//  Created by Caleb Hicks on 5/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "NetworkController.h"

@implementation NetworkController

+ (NSURL *)baseURL {
    return [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/"];
}

@end
