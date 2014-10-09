//
//  WPWeather.h
//  Weather Playground
//
//  Created by Taylor Mott on 10.7.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPWeather : NSObject

@property (strong, nonatomic) NSString *locationName;
@property (strong, nonatomic) NSString *weatherMain;
@property (strong, nonatomic) NSString *weatherDescription;
@property (strong, nonatomic) NSString *weatherIcon;
@property (assign, nonatomic) NSString *weatherTemp;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
