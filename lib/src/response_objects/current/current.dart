import '../json_parser.dart';
import 'notification.dart';
import 'river.dart';
import 'river_at_time.dart';
import 'sun.dart';
import 'swimming_channel.dart';
import 'weather.dart';
import 'weather_at_time.dart';

class Current {
  River? aare;
  List<RiverAtTime>? aarePast; // in API "aarepast"
  Weather? weather;
  List<WeatherAtTime>? weatherPast; // in API "weatherpast"
  Sun? sun;
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
