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
    return Current(
      aare: json['aare'] != null ? River.fromJson(json['aare']) : null,
      aarePast: json['aarepast'] != null
          ? RiverAtTime.listFromJson(json['aarepast'])
          : null,
      weather:
          json['weather'] != null ? Weather.fromJson(json['weather']) : null,
      weatherPast: json['weatherpast'] != null
          ? WeatherAtTime.listFromJson(json['weatherpast'])
          : null,
      sun: json['sun'] != null ? Sun.fromJson(json['sun']) : null,
      bueber: json['bueber'] != null
          ? SwimmingChannel.fromJson(json['bueber'])
          : null,
      notification: json['notification'] != null
          ? Notification.fromJson(json['notification'])
          : null,
    );
  }

  @override
  String toString() {
    return 'Current(aare: $aare, aarePast: $aarePast, weather: $weather, weatherPast: $weatherPast, sun: $sun, bueber: $bueber, notification: $notification)';
  }
}
