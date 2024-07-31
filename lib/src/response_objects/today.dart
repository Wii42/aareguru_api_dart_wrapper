import 'json_parser.dart';

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
    JsonParser p = JsonParser();
    return Today(
      aareTemperature: p.parseDouble(json['aare']),
      aarePreciceTemperature: p.parseDouble(json['aare_prec']),
      text: json['text'].toString(),
      textShort: json['text_short'].toString(),
      time: p.parseDateTime(json['time']),
      name: p.parseString(json['name']),
      longName: p.parseString(json['longname']),
    );
  }

  @override
  String toString() {
    return 'Today{aareTemperature: $aareTemperature, aarePreciceTemperature: $aarePreciceTemperature, text: $text, textShort: $textShort, time: $time, name: $name, longName: $longName}';
  }
}
