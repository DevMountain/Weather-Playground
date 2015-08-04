Weather-Playground
==================

An app that uses open weather map data and provides a background for a designed weather app

###Step 1:
- Review the documentation for the [OpenWeatherMap.org API](http://api.openweathermap.org/data/2.5/)
  
###Step 2:
- Open the project or start a new project
- Configure your ViewController with a search field, a search button, and labels for the weather data you want to display
- Add an action for the Search button
- Create an NSURLSession and NSURLSessionDataTask that will take the text in the search field and retrieve data from the Open Weather Map API
- Resume the NSURLSessionDataTask
- In the completionHandler for the NSURLSessionDataTask, update your labels
- You will need to use Grand Central Dispatch to ensure the labels are updated on the main queue

```
dispatch_async(dispatch_get_main_queue(), ^{
  //update labels here
}
```
###Black Diamond - Step 3 - Extract to Network Controller

- Add a network controller object
  - Add a getWeatherWithName: method with a completion handler
  - ```- (void)getWeatherWithName:(NSString *)name completion:(void (^)(NSDictionary *weather))completion;```
  - You'll need to escape the string to work with qualified URL formatting 
  - ```stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding```
  - The method should execute the data task, you can cut and paste over most of your code that you originally wrote in the Search Action method in the View Controller

###Black Diamond - Step 4 - Model Object Serialization
- Add an object controller
  - Use as a shared instance
- Add a weather object
  - Properties: locationName, weatherMain, weatherDescription, weatherIcon, weatherTemp
  - Add initWithDictionary
- In your getWeatherWithName, change the NSDictionary *weather block parameter to Weather *weather
- Use the initWithDictionary method to turn the NSDictionary result into a Weather object

###Black Diamond - Step 5 - Better User Interface
  - Labels to display the weather found (locationName, weatherMain, weatherDescription, weatherTemperature)
  - UIImageView to display the weather found (weatherIcon)
    - The icon uses the URL scheme: http://openweathermap.org/img/w/10d.png
    - (Hint: NSURLSessionDownloadTask, use the block to set the image afterwards.)
- In the completion of the search update the labels and the imageView
