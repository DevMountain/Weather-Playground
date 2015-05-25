Weather-Playground
==================

An app that uses open weather map data and provides a background for a designed weather app

#### You will need to run 'pod init' and 'pod install' to run this solution branch.

###Step 1:
- Initialize pods to get a podfile
  - ```pod init```
- Add AFNetworking to the podfile
  - ```pod 'AFNetworking', '~> 2.3.1'```
- Run pod install command
  - ```pod install```
  
###Step 2:
- Add a network controller
  - Add a shared instance of AFHTTPSessionManager
    - Set the base URL to http://api.openweathermap.org/data/2.5/
    - Set the response serializer of the session manager to json
- Add an object controller
  - Use as a shared instance
- Add a weather object
  - Properties: locationName, weatherMain, weatherDescription, weatherIcon, weatherTemp
  - Add initWithDictionary
  
###Step 3:
- Add a getWeatherWithName: method with a completion handler
  - ```- (void)getWeatherWithName:(NSString *)name completion:(void (^)(Weather *weather))completion;```
  - The method should call GET on the [NetworkController api] then parse the response

###Step 4:
- Add an interface to the viewController
  - IBOutlet for a textField in order to populate the search
  - IBAction to trigger the search from a button
    - In the search method call the getWeather method
    - You'll need to escape the string ```stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding```
  - IBOutlets for labels to display the weather found (locationName, weatherMain, weatherDescription, weatherTemperature)
  - IBOutlet for UIImageView to display the weather found (weatherIcon)
    - The icon uses the URL scheme: http://openweathermap.org/img/w/10d.png
- In the completion of the search update the labels and the imageView
