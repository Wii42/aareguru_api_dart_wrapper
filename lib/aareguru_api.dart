/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'aareguru_api.dart';

export 'src/aareguru_api.dart';

// TODO: Export any libraries intended for clients of this package.

void main() async {
  AareGuruApi api = AareGuruApi(appName: 'Wi42_test', appVersion: '0.1');
  print(await api.widget());
}
