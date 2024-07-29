import 'api_request.dart';
import 'response_objects/city.dart';
import 'response_objects/current/current.dart';
import 'response_objects/today.dart';
import 'response_objects/widget.dart';

/// Wrapper for Aare.guru API v2018 (current)
class AareGuruApi {
  static const String host = 'aareguru.existenz.ch';
  static const String apiPath = '/v2018';

  /// Name of the app which uses the API
  String? appName;

  /// Version of the app which uses the API
  String? appVersion;

  AareGuruApi({this.appName, this.appVersion});

  Future<List<City>> cities() =>
      CitiesRequest(host, apiPath, appName: appName, appVersion: appVersion)
          .request();

  Future<List<String>> citiesValues(List<String> values) =>
      CitiesRequest(host, apiPath, appName: appName, appVersion: appVersion)
          .requestWithValues(values);

  Future<Today> today(String city) => TodayRequest(host, apiPath,
          appName: appName, appVersion: appVersion, city: city)
      .request();

  Future<List<String>> todayValues(String city, List<String> values) =>
      TodayRequest(host, apiPath,
              appName: appName, appVersion: appVersion, city: city)
          .requestWithValues(values);

  Future<Current> current(String city) => CurrentRequest(host, apiPath,
          appName: appName, appVersion: appVersion, city: city)
      .request();

  Future<List<String>> currentValues(String city, List<String> values) =>
      CurrentRequest(host, apiPath,
              appName: appName, appVersion: appVersion, city: city)
          .requestWithValues(values);

  Future<WidgetData> widget() =>
      WidgetRequest(host, apiPath, appName: appName, appVersion: appVersion)
          .request();

  Future<List<String>> widgetValues(List<String> values) =>
      WidgetRequest(host, apiPath, appName: appName, appVersion: appVersion)
          .requestWithValues(values);
}
