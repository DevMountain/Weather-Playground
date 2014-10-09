//
//  WeatherController.m
//  Weather Playground
//
//  Created by Taylor Mott on 10.7.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WeatherController.h"
#import "NetworkController.h"

@implementation WeatherController

+ (WeatherController *)sharedInstance {
    static WeatherController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [WeatherController new];
    });
    return sharedInstance;
}

- (void)getWeatherWithName:(NSString *)name completion:(void (^)(WPWeather *weather))completion
{
    NSString *path = [NSString stringWithFormat:@"weather?q=%@", name];
    [[NetworkController api] GET:path parameters:nil
                         success:
     ^(NSURLSessionDataTask *task, id responseObject)
    {
        NSLog(@"getWeatherWithName: %@", responseObject);
        NSDictionary *responseCountry = responseObject;
        WPWeather *weatherObject = [[WPWeather alloc] initWithDictionary:responseCountry];
        completion(weatherObject);
    }
                         failure:
     ^(NSURLSessionDataTask *task, NSError *error)
    {
        NSLog(@"I'm an Error");
        NSLog(@"ERROR: %@", error);
        completion(nil);
    }
    ];
}

@end
