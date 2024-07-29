import 'package:aareguru_api/src/date_time_seconds_parser.dart';

class CityWidget {
  String? city;
  DateTime? timestamp;
  String? timeString; // in API "timestring"
  double? waterTemperature; // in API "temperature"
  String? waterTemperatureText; // in API "temperature_text"
  String? waterTemperatureTextShort; // in API "temperature_text_short"
  double? flow;
  String? flowText; // in API "flow_text"
  int? flowDangerLevel; // in API "flow_gefahrenstufe"
  double? waterTemperatureForecast2h; // in API "forecast2h"
  double? airTemperature; // in API "tt"
  String? sunTotal; // in API "suntotal"

  CityWidget({
    this.city,
    this.timestamp,
    this.timeString,
    this.waterTemperature,
    this.waterTemperatureText,
    this.waterTemperatureTextShort,
    this.flow,
    this.flowText,
    this.flowDangerLevel,
    this.waterTemperatureForecast2h,
    this.airTemperature,
    this.sunTotal,
  });

  factory CityWidget.fromJson(Map<String, dynamic> json, String? city) {
    return CityWidget(
      city: city,
      timestamp: DateTimeSecondsParser.tryParseSecondsSinceEpoch(
          int.parse(json['timestamp'].toString())),
      timeString: json['timestring'].toString(),
      waterTemperature: double.tryParse(json['temperature'].toString()),
      waterTemperatureText: json['temperature_text'].toString(),
      waterTemperatureTextShort: json['temperature_text_short'].toString(),
      flow: double.tryParse(json['flow'].toString()),
      flowText: json['flow_text'].toString(),
      flowDangerLevel: int.tryParse(json['flow_gefahrenstufe'].toString()),
      waterTemperatureForecast2h:
          double.tryParse(json['forecast2h'].toString()),
      airTemperature: double.tryParse(json['tt'].toString()),
      sunTotal: json['suntotal'].toString(),
    );
  }

  @override
  String toString() {
    return 'CityWidget(city: $city, timestamp: $timestamp, timeString: $timeString, waterTemperature: $waterTemperature, waterTemperatureText: $waterTemperatureText, waterTemperatureTextShort: $waterTemperatureTextShort, flow: $flow, flowText: $flowText, flowDangerLevel: $flowDangerLevel, waterTemperatureForecast2h: $waterTemperatureForecast2h, airTemperature: $airTemperature, sunTotal: $sunTotal)';
  }
}
