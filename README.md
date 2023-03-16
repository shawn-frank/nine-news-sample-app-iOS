# Nine Tech Assessment

This sample project was built as part of Nine's iOS technical assessment. 

These were [list of specifications](https://github.com/shawn-frank/nine-news-sample-app-iOS/blob/production/Task%20Description.md) provided.

## Final result

To experience the final result, you have two options:

* You may download and run the project on your machine
* You can watch the user experience over on [youtube](https://youtube.com/shorts/WNuTUOftBoo)
* You can also review a quick glance of the screens below

![Nine App Screenshots](https://user-images.githubusercontent.com/80219691/225538650-675a8afe-3a6f-4a0f-88b5-5ebeb209f79c.png)

## Compile notes

`XCode 13.4.1` was used to develop this sample application with `Swift 5.6`

No external libraries or dependancies were used to complete this project.

## Layout

The user interface and app experience was built programatically. 

`Auto layout` was used to achieve a good user experience on all iPhone sizes.

`UICollectionView` with a custom `UICollectionViewCell` was used to load the news assets.

I chose to use `UICollectionViewDiffableDataSource` with the `UICollectionView`. 
While it wasn't necessary for this use case, it does offer better performance in certain scenarios and I hadn't worked with this API before.

## System Design

The software architecture pattern I used was `MVVM` as this was what was described as preferred at Nine.

I also used the `Coordinator` design pattern to decouple the navigation logic from the view controllers.

The network layer was implemented using `protocols` and `generics` to help make it scalable and testable.

I designed the system with `SOLID` in mind. You will most of the solution is quite modular, loosely coupled and scalable.

## Unit Testing

* Wrote tests for whether the time of day extension gave back the correct greeting
* Wrote tests to check if the smallest thumbnail was indeed returned by the `NewsAssetManager`
* Wrote tests to check whether the model was configured correctly to decode the current JSON structure returned by the API

## Integration Testing

* Wrote tests which integrated the `NewsAssetManager` view model and a mock `NetworkService`
* Wrote tests to check whether the `NewsAssets` received from the service were sorted as desired
* Wrote tests to check if the right number of `NewsAssets` were decoded

## Interesting Apple technology used
* I got a chance to work with `expectations` to wait for `asynchronous` calls as we discussed on our call
* I then proceeded to refactor that to use `async` test functions by using `async await` for my network layer
* I chose to use `UICollectionViewDiffableDataSource` with the `UICollectionView`. While it wasn't necessary for this use case, it does offer better performance in certain scenarios and I hadn't worked with this API before.
* I used `NSCache` for the caching mechanism
* I used `Combine` handle async loading of the image from the cache or from the server as I wanted to learn a bit more about using this framework

## What I would improve

* Adding UI Tests as I did not get time to add these yet and it is something new to me
* Adding a `UIRefreshControl` to the `UICollectionView`
* Adding better error handling to the `Cache` implementation
