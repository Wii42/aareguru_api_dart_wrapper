import 'dart:convert';
import 'dart:io';

import 'package:aareguru_api/aareguru_api.dart';
import 'package:test/test.dart';

dynamic loadMockData(String fileName) {
  File currentResponseMock = File('test/mock_data/$fileName');
  String currentResponseString = currentResponseMock.readAsStringSync();
  return jsonDecode(currentResponseString);
}

void main() {
  dynamic mockJson;
  setUpAll(() {
    mockJson = loadMockData('current_response_mock.json');
  });
  group('Current', () {
    Current current() => Current.fromJson(mockJson);
    test('current', () => expect(current(), isNotNull));
    test('aare', () => expect(current().aare, isNotNull));
    test('aarePast', () => expect(current().aarePast, hasLength(3)));
    test('weather', () => expect(current().weather, isNotNull));
    test('weatherPast', () => expect(current().weatherPast, hasLength(3)));
    test('sun', () => expect(current().sun, isNotNull));
    test('bueber', () => expect(current().bueber, isNotNull));
    test('notification', () => expect(current().notification, isNotNull));
  });
  group('River', () {
    River aare() => River.fromJson(mockJson['aare']);
    test('aare', () => expect(aare(), isNotNull));
    test('location', () => expect(aare().location, 'Bärn'));
    test('locationLong', () => expect(aare().locationLong, 'Bern, Schönau'));
    test('coordinates', () => expect(aare().coordinates, isNotNull));
    test('forecast', () => expect(aare().forecast, false));
    test('timestamp',
        () => expect(aare().timestamp, DateTime(2024, 8, 19, 18, 10, 0)));
    test('timeString', () => expect(aare().timeString, '18:10'));
    test('temperature', () => expect(aare().temperature, 17.2));
    test('temperaturePrecise', () => expect(aare().temperaturePrecise, 17.23));
    test('temperatureText',
        () => expect(aare().temperatureText, 'Mit de Boumstäm schwümme'));
    test('temperatureTextShort',
        () => expect(aare().temperatureTextShort, 'Zvil Boumstäm'));
    test('flow', () => expect(aare().flow, 229));
    test('flowText', () => expect(aare().flowText, 'mega viu'));
    test('temperatureForecast2h',
        () => expect(aare().temperatureForecast2h, 17.2));
    test('temperatureForecast2hText',
        () => expect(aare().temperatureForecast2hText, 'Blibt äuä öpe glich'));
    test('height', () => expect((aare() as dynamic).height, 502.84));
    test('temperatureScale',
        () => expect(aare().temperatureScale, hasLength(2)));
    test('flowScale', () => expect(aare().flowScale, hasLength(2)));
    test(
        'historicalTempMax', () => expect(aare().historicalTempMax, isNotNull));
  });

  group('Coordinate', () {
    Coordinate coordinates() =>
        Coordinate.fromJson(mockJson['aare']['coordinates']);
    test('coordinate', () => expect(coordinates, isNotNull));
    test('aare', () => expect(coordinates().lat, 46.93));
    test('aare', () => expect(coordinates().lon, 7.45));
  });

  group('ScaleEntry', () {
    ScaleEntry scaleEntry() =>
        ScaleEntry.fromJson(mockJson['aare']['temperature_scale'][0]);
    test('scaleEntry', () => expect(scaleEntry, isNotNull));
    test('value', () => expect(scaleEntry().value, 1));
    test('test', () => expect(scaleEntry().text, 'Iglu boue bringts meh'));
    test('position', () => expect(scaleEntry().position, 'start'));
  });

  group('ValueAtTime', () {
    ValueAtTime valueAtTime() =>
        ValueAtTime.fromJson(mockJson['aare']['historical_temp_max']);
    test('historical_temp_max', () => expect(valueAtTime, isNotNull));
    test('value', () => expect(valueAtTime().value, 24.12));
    test('time',
        () => expect(valueAtTime().timestamp, DateTime(2022, 08, 04, 17, 0)));
  });

  group('RiverAtTime', () {
    RiverAtTime riverAtTime() => RiverAtTime.fromJson(mockJson['aarepast'][0]);
    test('riverAtTime', () => expect(riverAtTime, isNotNull));
    test(
        'timestamp',
        () =>
            expect(riverAtTime().timestamp, DateTime(2024, 8, 17, 18, 30, 0)));
    test('flow', () => expect(riverAtTime().flow, 261));
    test('temperature', () => expect(riverAtTime().temperature, 19.69));
  });

  group('Weather', () {
    Weather weather() => Weather.fromJson(mockJson['weather']);
    test('weather', () => expect(weather, isNotNull));
    test('current', () => expect(weather().current, isNotNull));
    test('today', () => expect(weather().today, isNotNull));
    test('forecast', () => expect(weather().forecast, hasLength(2)));
  });

  group('CurrentWeather', () {
    CurrentWeather currentWeather() =>
        CurrentWeather.fromJson(mockJson['weather']['current']);
    test('currentWeather', () => expect(currentWeather, isNotNull));
    test('currentTemperature',
        () => expect(currentWeather().currentTemperature, 20.5));
    test('rainfall', () => expect(currentWeather().rainfall, 1));
    test('rainfallReal', () => expect(currentWeather().rainfallReal, 1.2));
    test(
        'timestamp',
        () => expect(
            currentWeather().timestamp, DateTime(2024, 8, 19, 18, 10, 0)));
    test('timeString', () => expect(currentWeather().timeString, '18:10'));
  });

  group('WeatherToday', () {
    WeatherToday weatherToday() =>
        WeatherToday.fromJson(mockJson['weather']['today']);
    test('weatherToday', () => expect(weatherToday, isNotNull));
    test('morning', () => expect(weatherToday().morning, isNotNull));
    test('afternoon', () => expect(weatherToday().afternoon, isNotNull));
    test('evening', () => expect(weatherToday().evening, isNotNull));
  });

  group('TimeOfDayWeather', () {
    TimeOfDayWeather timeOfDayWeather() =>
        TimeOfDayWeather.fromJson(mockJson['weather']['today']['v']);
    test('timeOfDayWeather', () => expect(timeOfDayWeather, isNotNull));
    test('weatherSymbol', () => expect(timeOfDayWeather().weatherSymbol, 'b'));
    test('weatherText',
        () => expect(timeOfDayWeather().weatherText, 'zimlech sunnig'));
    test(
        'weatherSymbol2', () => expect(timeOfDayWeather().weatherSymbol2, '2'));
    test('temperature', () => expect(timeOfDayWeather().temperature, 18));
    test('rainfall', () => expect(timeOfDayWeather().rainfall, 0));
    test('rainfallRisk', () => expect(timeOfDayWeather().rainfallRisk, 20));
  });

  group('WeatherForecast', () {
    WeatherForecast weatherForecast() =>
        WeatherForecast.fromJson(mockJson['weather']['forecast'][0]);
    test('weatherForecast', () => expect(weatherForecast, isNotNull));
    test('day', () => expect(weatherForecast().day, 'Zischti'));
    test('dayShort', () => expect(weatherForecast().dayShort, 'Di.'));
    test(
        'timestamp',
        () => expect(
            weatherForecast().timestamp, DateTime(2024, 8, 20, 18, 25, 0)));
    test('symbol', () => expect(weatherForecast().symbol, 'b'));
    test('symbolText', () => expect(weatherForecast().symbolText, 'zimlech sunnig'));
    test('symbol2', () => expect(weatherForecast().symbol2, '2'));
    test('maxTemperature', () => expect(weatherForecast().maxTemperature, 26));
    test('minTemperature', () => expect(weatherForecast().minTemperature, 13));
    test('rainfall', () => expect(weatherForecast().rainfall, 0));
    test('rainfallRisk', () => expect(weatherForecast().rainfallRisk, 0));
  });

  group('WeatherAtTime', () {
    WeatherAtTime weatherAtTime() => WeatherAtTime.fromJson(mockJson['weatherpast'][0]);
    test('weatherAtTime', () => expect(weatherAtTime, isNotNull));
    test('timestamp', () => expect(weatherAtTime().timestamp, DateTime(2024, 8, 17, 18, 30, 0)));
    test('temperature', () => expect(weatherAtTime().temperature, 21.8));
  });

  group('Sun', () {
    Sun sun() => Sun.fromJson(mockJson['sun']);
    test('sun', () => expect(sun, isNotNull));
    test('today', () => expect(sun().today, isNotNull));
    test('forecast', () => expect(sun().forecast, hasLength(2)));
    test('sunLocations', () => expect(sun().sunLocations, hasLength(3)));
  });

  group('SunPerDay', () {
    SunPerDay sunPerDay() => SunPerDay.fromJson(mockJson['sun']['forecast']['1']);
    test('sunPerDay', () => expect(sunPerDay, isNotNull));
    test('day', () => expect(sunPerDay().day, 'Zischti'));
    test('dayShort', () => expect(sunPerDay().dayShort, 'Di.'));
    test('sunTotal', () => expect(sunPerDay().sunTotal, "10:11"));
    test('sunRelative', () => expect(sunPerDay().sunRelative, 73));
  });

  group('SunLocation', () {
    SunLocation sunLocation() => SunLocation.fromJson(mockJson['sun']['sunlocations'][0]);
    test('sunLocation', () => expect(sunLocation, isNotNull));
    test('name', () => expect(sunLocation().name, 'Eichholz'));
    test('sunrise', () => expect(sunLocation().sunrise, DateTime(2024, 8, 19, 8, 30, 0)));
    test('sunriseLocal', () => expect((sunLocation() as dynamic).sunriseLocal, "08:30"));
    test('sunset', () => expect(sunLocation().sunset, DateTime(2024, 8, 19, 17, 57, 0)));
    test('sunsetLocal', () => expect(sunLocation().sunsetLocal, "17:57"));
    test('timeLeft', () => expect(sunLocation().timeLeft, 0));
    test('timeLeftString', () => expect(sunLocation().timeLeftString, "0:00:00"));
  });

  group('SwimmingChannel', () {
    SwimmingChannel swimmingChannel() => SwimmingChannel.fromJson(mockJson['bueber']);
    test('swimmingChannel', () => expect(swimmingChannel, isNotNull));
    test('state', () => expect(swimmingChannel().state, 'closed'));
    test('isOpen', () => expect(swimmingChannel().isOpen, false));
    test('source', () => expect(swimmingChannel().source, 'badmeister'));
    test('time', () => expect(swimmingChannel().time, DateTime(2024, 8, 17, 8, 14, 58)));
  });

  group('Notification', () {
    Notification notification() => Notification.fromJson(mockJson['notification']);
    test('notification', () => expect(notification, isNotNull));
    test('time', () => expect(notification().time, DateTime(2023, 9, 5, 14, 16, 30)));
    test('author', () => expect(notification().author, 'reto'));
    test('event', () => expect(notification().event, 'created'));

  });
}
