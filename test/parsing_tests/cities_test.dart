import 'package:aareguru_api/aareguru_api.dart';
import 'package:test/test.dart';

import 'current_test.dart';

void main() {
  dynamic mockJson;
  setUpAll(() {
    mockJson = loadMockData('cities_response_mock.json');
  });
  group('List<City>', () {
    List<City> cities() => City.fromJsonList(mockJson);
    test('cities', () {
      expect(cities(), hasLength(2));
    });
  });

  group('City', () {
    City city() => City.fromJson(mockJson[0]);
    test('city', () => expect(city(), isA<City>()));
    test('city.city', () => expect(city().city, 'brienz'));
    test('name', () => expect(city().name, 'Brienz'));
    test('longName', () => expect(city().longName, 'Brienzwiler'));
    test('coordinates', () => expect(city().coordinates, isNotNull));
    test('aareTemperature', () => expect(city().aareTemperature, 8.3));
    test('aarePreciceTemperature',
        () => expect(city().aarePreciseTemperature, 8.29));
    test('weatherSymbol', () => expect(city().weatherSymbol, '10'));
    test('dailyMinimumAirTemperature',
        () => expect(city().dailyMinAirTemperature, 14));
    test('dailyMaximumAirTemperature',
        () => expect(city().dailyMaxAirTemperature, 21));
    test('forecast', () => expect(city().forecast, false));
    test('time', () => expect(city().time, DateTime(2024, 8, 19, 22, 20, 0)));
    test(
        'url',
        () => expect(
            city().url,
            Uri.parse(
                'https://aareguru.existenz.ch/v2018/current?city=brienz')));
    test(
        'today',
        () => expect(city().today,
            Uri.parse('https://aareguru.existenz.ch/v2018/today?city=brienz')));
    test(
        'widget',
        () => expect(
            city().widget,
            Uri.parse(
                'https://aareguru.existenz.ch/v2018/widget?city=brienz')));
  });
}
