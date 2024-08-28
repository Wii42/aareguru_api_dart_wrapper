import 'package:aareguru_api/aareguru_api.dart';
import 'package:test/test.dart';

import 'current_test.dart';

void main() {
  dynamic mockJson;
  setUpAll(() {
    mockJson = loadMockData('today_response_mock.json');
  });
  group('Today', () {
    Today today() => Today.fromJson(mockJson);
    test('today', () => expect(today(), isNotNull));
    test('aareTemperature', () => expect(today().aareTemperature, 18.1));
    test('aarePreciceTemperature',
        () => expect(today().aarePreciceTemperature, 18.08));
    test('text', () => expect(today().aareTemperatureText, "Rächt gut. Mit viu Wasser"));
    test('textShort', () => expect(today().aareTemperatureTextShort, "Mit viu Wasser"));
    test('time', () => expect(today().time, DateTime(2024, 8, 19, 23, 0, 0)));
    test('name', () => expect(today().name, "Interlake"));
    test('longName', () => expect(today().longName, "Ringgenberg, Goldswil"));
  });
}
