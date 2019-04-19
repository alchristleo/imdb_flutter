# imdb_flutter

A Flutter application looks alike IMDb app and using redux to fetch data.

<img height="480px" src="https://github.com/alchristleo/imdb_flutter/blob/master/presentation/assets/demo.gif">

## Getting Started

1. First you need to install [Flutter](https://flutter.dev/docs/get-started/install) and the setup as well.
2. Second you need to install [Android Studio](https://developer.android.com/studio/install) and [Xcode](https://developer.apple.com/xcode/) for the virtual device.
    Clone this repository
    ```
    git clone git@github.com:alchristleo/imdb_flutter.git
    ```
3. Open the project in your favorite IDE, in this case I'm using [VSCode](https://code.visualstudio.com/), install Dart plugin, then 
    cmd + shift + p, type Pub: Get Packages.
4. cmd + shift + p, type Flutter: Run Flutter Doctor, this command will help you to check if your flutter application can run on both android and ios platform.
5. Navigate to presentation/lib/@services/imdb/imdb.dart.sample rename it to imdb.dart and change the apiKey "<YOUR_IMDB_API_KEY>" to your own api key. To get your api key please register first in here [TMDB API Docs](https://developers.themoviedb.org/3/getting-started/introduction)
6. Run: 
    ```
    flutter packages pub run flutter_launcher_icons:main
    ```
   This command will change the app icons on start, see [flutter_launcher_icons](https://pub.dartlang.org/packages/flutter_launcher_icons)
7. Voila, now you can start the application, first navigate inside presentation folder:
    ```
    cd presentation
    ```
   To run the application you can press F5.

8. If you want to run this app on iOS, navigate to 
    ```
    presentation/ios
    ```
    then in terminal type: 
    ```
    pod install
    ```
This command will help you generate pods file to bundle the library to xcode emulator. See [cocoapods](https://cocoapods.org/)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
