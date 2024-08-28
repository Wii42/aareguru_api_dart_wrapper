import '../json_parser.dart';
import 'notification.dart';
import 'river.dart';
import 'river_at_time.dart';
import 'sun.dart';
import 'swimming_channel.dart';
import 'weather.dart';
import 'weather_at_time.dart';

/// Maximal data for a given city, with current, past and predicted data.
///
/// Contains data about the Aare, the weather, the sun and the swimming channel.
class Current {
  /// Current data of the Aare. For more details see [River].
  River? aare;

  /// Past flow and temperature data of the Aare. Usually for the last 48 hours.
  ///
  /// Original API field name: <code>aarepast</code>
  List<RiverAtTime>? aarePast;

  /// Current weather data prognoses. For more details see [Weather].
  Weather? weather;

  /// Past air temperature data. Usually for the last 48 hours.
  ///
  /// Original API field name: <code>weatherpast</code>
  List<WeatherAtTime>? weatherPast;

  /// Current sun data and prognoses. For more details see [Sun].
  Sun? sun;

  /// Infos about the swimming channel 'bueber' to exit the Aare in the Marzili.
  SwimmingChannel? bueber;

  Notification? notification;

  Current({
    this.aare,
    this.aarePast,
    this.weather,
    this.weatherPast,
    this.sun,
    this.bueber,
    this.notification,
  });

  /// Creates a [Current] from a JSON object.
  factory Current.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return Current(
      aare: p.parseObject(json['aare'], (dynamic e) => River.fromJson(e)),
      aarePast:
          p.parseList(json['aarepast'], (dynamic e) => RiverAtTime.fromJson(e)),
      weather:
          p.parseObject(json['weather'], (dynamic e) => Weather.fromJson(e)),
      weatherPast: p.parseList(
          json['weatherpast'], (dynamic e) => WeatherAtTime.fromJson(e)),
      sun: p.parseObject(json['sun'], (dynamic e) => Sun.fromJson(e)),
      bueber: p.parseObject(
          json['bueber'], (dynamic e) => SwimmingChannel.fromJson(e)),
      notification: p.parseObject(
          json['notification'], (dynamic e) => Notification.fromJson(e)),
    );
  }

  @override
  String toString() {
    return 'Current(aare: $aare, aarePast: $aarePast, weather: $weather, weatherPast: $weatherPast, sun: $sun, bueber: $bueber, notification: $notification)';
  }
}
