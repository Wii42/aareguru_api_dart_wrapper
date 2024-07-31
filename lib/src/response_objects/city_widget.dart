import 'json_parser.dart';

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
    JsonParser p = JsonParser();
    return CityWidget(
      city: city,
      timestamp: p.parseDateTime(json['timestamp']),
      timeString: p.parseString(json['timestring']),
      waterTemperature: p.parseDouble(json['temperature']),
      waterTemperatureText: p.parseString(json['temperature_text']),
      waterTemperatureTextShort: p.parseString(json['temperature_text_short']),
      flow: p.parseDouble(json['flow']),
      flowText: p.parseString(json['flow_text']),
      flowDangerLevel: p.parseInt(json['flow_gefahrenstufe']),
      waterTemperatureForecast2h:
          double.tryParse(json['forecast2h'].toString()),
      airTemperature: p.parseDouble(json['tt']),
      sunTotal: p.parseString(json['suntotal']),
    );
  }

  @override
  String toString() {
    return 'CityWidget(city: $city, timestamp: $timestamp, timeString: $timeString, waterTemperature: $waterTemperature, waterTemperatureText: $waterTemperatureText, waterTemperatureTextShort: $waterTemperatureTextShort, flow: $flow, flowText: $flowText, flowDangerLevel: $flowDangerLevel, waterTemperatureForecast2h: $waterTemperatureForecast2h, airTemperature: $airTemperature, sunTotal: $sunTotal)';
  }
}
