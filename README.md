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

Unofficial wrapper of the Aare.guru API for the Dart language. Aare.guru provides infos about bathing spots in the Aare river in Switzerland.

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


For examples see the [example](example/aareguru_api_example.dart).

## Note

This package is still in development and may not be stable. Breaking changes may occur in every future version until the first stable release.

See the [CHANGELOG](CHANGELOG.md) for details about the changes in each version.

Some fields have been renamed in comparison to the API to better clarify their meaning and conform to camelCase. For example, 'aare' in [Today](lib/src/response_objects/today.dart) is now 'aareTemperature' and 'longname' in [City](lib/src/response_objects/city.dart) is now 'longName'. If a field has been renamed, is specified in the documentation for the field. For example ```Original API field name: <code>text_short</code>```. If nothing is specified, the field name is the same as in the API.

## License

This package is licensed under the GNU GPLv3. See the [LICENSE](LICENSE) file for details.


