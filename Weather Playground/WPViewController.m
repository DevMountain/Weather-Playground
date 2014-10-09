//
//  WPViewController.m
//  Weather Playground
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WPViewController.h"
#import "WeatherController.h"
#import "WPWeather.h"

@interface WPViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UILabel *countryName;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

- (IBAction)searchButtonPressed:(UIButton *)sender;

@end

@implementation WPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (double)celsiusFromKelvinString:(NSString *)kelvin
{
    double kelvinDouble = [kelvin doubleValue];
    return kelvinDouble - 273.15;
}

- (IBAction)searchButtonPressed:(UIButton *)sender
{
    [[WeatherController sharedInstance] getWeatherWithName:[self.searchField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] completion:
     ^(WPWeather *weather)
     {
         self.countryName.text = weather.locationName;
         self.tempLabel.text = [NSString stringWithFormat:@"%.1fº C", [self celsiusFromKelvinString:weather.weatherTemp]];
         self.mainLabel.text = weather.weatherMain;
         self.descriptionLabel.text = weather.weatherDescription;
     }];
}
@end
