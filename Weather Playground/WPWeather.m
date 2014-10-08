//
//  WPWeather.m
//  Weather Playground
//
//  Created by Taylor Mott on 10.7.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WPWeather.h"

@interface WPWeather()

@property (strong, nonatomic) NSString *locationName;
@property (strong, nonatomic) NSString *weatherMain;
@property (strong, nonatomic) NSString *weatherDescription;
@property (strong, nonatomic) NSString *weatherIcon;
@property (assign, nonatomic) NSUInteger *weatherTemp;

@end

@implementation WPWeather

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    //code
    
    return self;
}

@end
