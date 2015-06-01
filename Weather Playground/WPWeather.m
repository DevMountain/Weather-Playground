//
//  WPWeather.m
//  Weather Playground
//
//  Created by Taylor Mott on 10.7.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WPWeather.h"

@interface WPWeather()

@end

@implementation WPWeather

//Initialize the model object with a dictionary.
- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    //Example of dictionary received:
    /*
     {
     "coord":{"lon":-0.13,"lat":51.51},
     "sys":{"type":1,"id":5091,"message":0.7353,"country":"GB","sunrise":1412748812,"sunset":1412788938},
     "weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],
     "base":"cmc stations",
     "main":{"temp":285.9,"pressure":995,"humidity":71,"temp_min":285.15,"temp_max":287.15},
     "wind":{"speed":4.6,"deg":210},
     "clouds":{"all":92},
     "dt":1412802749,
     "id":2643743,
     "name":"London",
     "cod":200
     }
     */
    
    self.locationName = dictionary[@"name"];
    self.weatherMain = dictionary[@"weather"][0][@"main"];
    self.weatherDescription = dictionary[@"weather"][0][@"description"];
    self.weatherIcon = dictionary[@"weather"][0][@"icon"];
    self.weatherTemp = dictionary[@"main"][@"temp"];
    
    return self;
}

@end
