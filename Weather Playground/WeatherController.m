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
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"weather?q=%@", name] relativeToURL:[NetworkController baseURL]];
    
    NSLog(@"%@", url);
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *weatherDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        WPWeather *weather = [[WPWeather alloc] initWithDictionary:weatherDictionary];
        
        if (error) {
            NSLog(@"%@", error);
            completion(nil);
        } else {
            completion(weather);
        }
    }];
    
    [dataTask resume];
}

@end
