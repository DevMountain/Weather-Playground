//
//  WeatherController.h
//  Weather Playground
//
//  Created by Taylor Mott on 10.7.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WPWeather.h"

@interface WeatherController : NSObject

+ (WeatherController *)sharedInstance;

- (void)getWeatherWithName:(NSString *)name completion:(void (^)(WPWeather *weather))completion;

@end
