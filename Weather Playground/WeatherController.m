//
//  WeatherController.m
//  Weather Playground
//
//  Created by Taylor Mott on 10.7.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WeatherController.h"

@implementation WeatherController

+ (WeatherController *)sharedInstance {
    static WeatherController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [WeatherController new];
    });
    return sharedInstance;
}

@end
