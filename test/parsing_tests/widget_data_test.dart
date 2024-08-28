import 'package:aareguru_api/aareguru_api.dart';
import 'package:test/test.dart';

import 'current_test.dart';

void main() {
  dynamic mockJson;
  setUpAll(() {
    mockJson = loadMockData('widget_response_mock.json');
  });
  group('WidgetData', () {
    WidgetData widget() => WidgetData.fromJson(mockJson);
    test('widget', () => expect(widget(), isNotNull));
    test('values', () => expect(widget().values, hasLength(2)));
    test('cities', () => expect(widget().cities, hasLength(2)));
  });

  group('CityWidget', () {
    CityWidget cityWidget() =>
        CityWidget.fromJson(mockJson['values']['thun'], 'thun');
    test('cityWidget', () => expect(cityWidget(), isNotNull));
    test('city', () => expect(cityWidget().city, 'thun'));
    test('timestamp',
        () => expect(cityWidget().timestamp, DateTime(2024, 8, 19, 23, 10, 0)));
    test('timeString', () => expect(cityWidget().timeString, '23:10'));
    test('waterTemperature', () => expect(cityWidget().aareTemperature, 17.2));
    test('waterTemperatureText',
        () => expect(cityWidget().aareTemperatureText, 'Me chas wage'));
    test('waterTemperatureTextShort',
        () => expect(cityWidget().aareTemperatureTextShort, 'Me chas wage'));
    test('flow', () => expect(cityWidget().flow, 204));
    test('flowText', () => expect(cityWidget().flowText, 'ender viu'));
    test('flowDangerLevel', () => expect(cityWidget().flowDangerLevel, 1));
    test('waterTemperatureForecast2h',
        () => expect(cityWidget().aareTemperatureForecast2h, 17.3));
    test('airTemperature', () => expect(cityWidget().airTemperature, 16));
    test('sunTotal', () => expect(cityWidget().sunTotal, '3:52'));
  });

  group('CityKey', () {
    CityKey cityKey() => CityKey.fromJson(mockJson['cities'][0]);
    test('cityKey', () => expect(cityKey(), isNotNull));
    test('key', () => expect(cityKey().key, 'hagneck'));
    test('name', () => expect(cityKey().name, 'Hagneck'));
  });
}
