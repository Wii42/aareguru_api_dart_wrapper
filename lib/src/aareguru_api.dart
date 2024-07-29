import 'requests/cities_request.dart';
import 'requests/current_request.dart';
import 'requests/today_request.dart';
import 'requests/widget_request.dart';
import 'response_objects/city.dart';
import 'response_objects/current/current.dart';
import 'response_objects/today.dart';
import 'response_objects/widget.dart';

/// Wrapper for Aare.guru API v2018 (current)
/// [OpenAPI documentation](https://aareguru.existenz.ch/openapi/)
/// [Aare.guru API homepage](https://aareguru.existenz.ch/)
/// If the [values] parameter shall be used, use the method ending with 'Values'  for example [citiesValues].
class AareGuruApi {
  /// Host of the API
  static const String host = 'aareguru.existenz.ch';

  /// Path to the API on the host
  static const String apiPath = '/v2018';

  /// Name of the app which uses the API
  String? appName;

  /// Version of the app which uses the API
  String? appVersion;

  AareGuruApi({this.appName, this.appVersion});

  /// Ortsliste <br>
  /// Alle verfügbaren Orte in der API, inklusiver der wichtigsten Daten zur Übersicht.
  /// [API reference](https://aareguru.existenz.ch/openapi/#/v2018/get_v2018_cities)
  Future<List<City>> cities() =>
      CitiesRequest(host, apiPath, appName: appName, appVersion: appVersion)
          .request();

  /// Ortsliste <br>
  /// Alle verfügbaren Orte in der API, inklusiver der wichtigsten Daten zur Übersicht.
  /// [API reference](https://aareguru.existenz.ch/openapi/#/v2018/get_v2018_cities)
  Future<List<String>> citiesValues(List<String> values) =>
      CitiesRequest(host, apiPath, appName: appName, appVersion: appVersion)
          .requestWithValues(values);

  /// Aktuelle Aare-Temperatur und Spruch für einen Ort <br>
  /// Minimale Response.
  /// [API reference](https://aareguru.existenz.ch/openapi/#/v2018/get_v2018_today)
  Future<Today> today(String city) => TodayRequest(host, apiPath,
          appName: appName, appVersion: appVersion, city: city)
      .request();

  /// Aktuelle Aare-Temperatur und Spruch für einen Ort <br>
  /// Minimale Response.
  /// [API reference](https://aareguru.existenz.ch/openapi/#/v2018/get_v2018_today)
  Future<List<String>> todayValues(String city, List<String> values) =>
      TodayRequest(host, apiPath,
              appName: appName, appVersion: appVersion, city: city)
          .requestWithValues(values);

  /// Sämtliche Aare-Daten für einen Ort <br>
  /// Maximale Response mit aktuellen Daten, vergangenen Daten, Prognosen, Beigemüse.
  /// [API reference](https://aareguru.existenz.ch/openapi/#/v2018/get_v2018_current)
  Future<Current> current(String city) => CurrentRequest(host, apiPath,
          appName: appName, appVersion: appVersion, city: city)
      .request();

  /// Sämtliche Aare-Daten für einen Ort <br>
  /// Maximale Response mit aktuellen Daten, vergangenen Daten, Prognosen, Beigemüse.
  /// [API reference](https://aareguru.existenz.ch/openapi/#/v2018/get_v2018_current)
  Future<List<String>> currentValues(String city, List<String> values) =>
      CurrentRequest(host, apiPath,
              appName: appName, appVersion: appVersion, city: city)
          .requestWithValues(values);

  /// Aktuelle Aare-Daten, Spruch und anders für alle Orte auf einmal <br>
  /// Mittlere Response mit aktuellen Daten, Prognosen, Beigemüse für Widgets.
  /// [API reference](https://aareguru.existenz.ch/openapi/#/v2018/get_v2018_widget)
  Future<WidgetData> widget() =>
      WidgetRequest(host, apiPath, appName: appName, appVersion: appVersion)
          .request();

  /// Aktuelle Aare-Daten, Spruch und anders für alle Orte auf einmal <br>
  /// Mittlere Response mit aktuellen Daten, Prognosen, Beigemüse für Widgets.
  /// [API reference](https://aareguru.existenz.ch/openapi/#/v2018/get_v2018_widget)
  Future<List<String>> widgetValues(List<String> values) =>
      WidgetRequest(host, apiPath, appName: appName, appVersion: appVersion)
          .requestWithValues(values);
}
