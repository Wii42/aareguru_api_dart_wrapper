<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
# Aare.guru API Dart Wrapper

Wrapper for the Dart language of the Aare.guru API. This API provides infos about bathing spots in the Aare river in Switzerland.

This package provides a type-safe way to interact with the Aare.guru API. It is written in Dart and can be used in any Dart project.

## Aare.guru?

Look here: [Aare.guru](https://aare.guru) <br>
API documentation: [Aare.guru API](https://aareguru.existenz.ch/)

## Getting started

Import the package in your dart project.

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  aareguru_api:
    git: https://github.com/Wii42/aareguru_api_dart_wrapper
```

Then run `dart pub get` to install the package, or `flutter pub get` if you are using Flutter.

## Usage

Now in your Dart code, you can use:
```dart
import 'package:aareguru_api/aareguru_api.dart';
```


For examples see the [example](example/aareguru_api_example.dart)

## Note

This package is still in development and may not be stable. Breaking changes may occur in every future version until the first stable release.

## License

This package is licensed under the  GNU GPLv3. See the [LICENCE](LICENCE) file for details.


