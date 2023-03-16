# Nine Tech Assessment

This sample project was built as part of Nine's iOS technical assessment. 

These were [list of specifications](https://github.com/shawn-frank/nine-news-sample-app-iOS/blob/production/Task%20Description.md) provided.

## Final result

To experience the final result, you have two options:

* You may download and run the project on your machine
* You can watch the user experience over on [youtube](https://youtube.com/shorts/WNuTUOftBoo)
* You can also review a quick glance of the screens below

![Nine App Screenshots](https://user-images.githubusercontent.com/80219691/225531631-b6ad7b1a-6fe6-45f4-8267-83b1cf780746.png)

## Compile notes

`XCode 13.4.1` was used to develop this sample application with `Swift 5.6`

No external libraries or dependancies were used to complete this project.

## Layout

The user interface and app experience was built programatically. 

`Auto layout` was used to achieve a good user experience on all iPhone sizes.

`UICollectionView` with a custom `UICollectionViewCell` was used to load the news assets.

I chose to use `UICollectionViewDiffableDataSource` with the `UICollectionView`. 
While it wasn't necessary for this use case, it does offer better performance in certain scenarios and I hadn't worked with this API before.
