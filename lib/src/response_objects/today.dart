import 'package:aareguru_api/src/date_time_seconds_parser.dart';

class Today {
  double? aareTemperature; // in API "aare"
  double? aarePreciceTemperature; // in API "aare_prec"
  String? text;
  String? textShort; // in API "text_short"
  DateTime? time;
  String? name;
  String? longName; // in API "longname"

  Today({
    this.aareTemperature,
    this.aarePreciceTemperature,
    this.text,
    this.textShort,
    this.time,
    this.name,
    this.longName,
  });

  factory Today.fromJson(Map<String, dynamic> json) {
    return Today(
      aareTemperature: double.tryParse(json['aare'].toString()),
      aarePreciceTemperature: double.tryParse(json['aare_prec'].toString()),
      text: json['text'].toString(),
      textShort: json['text_short'].toString(),
      time: DateTimeSecondsParser.tryParseSecondsSinceEpoch(
          int.parse(json['time'].toString())),
      name: json['name'].toString(),
      longName: json['longname'].toString(),
    );
  }

  @override
  String toString() {
    return 'Today{aareTemperature: $aareTemperature, aarePreciceTemperature: $aarePreciceTemperature, text: $text, textShort: $textShort, time: $time, name: $name, longName: $longName}';
  }
}
