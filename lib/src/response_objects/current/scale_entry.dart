import '../json_parser.dart';

/// A scale entry is a range within a scale.
///
/// Normally used in a [Scale] object.
/// The scale entry is defined by the [value] field as one bound of the range.
/// [position] defines if [value] is the lower or upper bound of the range.
class ScaleEntry implements Comparable<ScaleEntry> {
  /// One bound of the range of the scale entry.
  double? value;

  /// Text describing the range.
  String? text;

  /// Defines if [value] is the lower or upper bound of the range
  /// Is expected to be 'start' or 'end'.
  String? position;

  ScaleEntry({
    this.value,
    this.text,
    this.position,
  });

  /// Creates a [ScaleEntry] from a JSON object.
  factory ScaleEntry.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return ScaleEntry(
      value: p.parseDouble(json['value']),
      text: p.parseString(json['text']),
      position: p.parseString(json['position']),
    );
  }

  /// Creates a list of [ScaleEntry] from a JSON list.
  static List<ScaleEntry> listFromJson(List<dynamic> json) {
    return json.map((value) => ScaleEntry.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'ScaleEntry(value: $value, text: $text, position: $position)';
  }

  /// Compares two [ScaleEntry] objects by [value], [position] and [text].
  /// The order is value, position and text.
  /// If the value is equal, the position is compared, null is considered smaller than non null values.
  ///
  /// In position, 'start' is considered bigger than 'end', in the sense that when ordering
  /// ScaleEntry objects, this would mean both have the same value,
  /// but has to be interpreted differently, 'start' signifying as lower
  /// bound and 'end' as upper bound.
  /// if the position is null or something different, it is considered between 'end' and 'start'.
  ///
  /// If the position is equal, the text is compared by the [String.compareTo] method, so [a.compareTo(b) <=> a == b].
  /// null is considered smaller than non null values.
  @override
  int compareTo(ScaleEntry other) {
    int compare;
    compare = _compareField<num>(other, (e) => e.value);
    if (compare != 0) {
      return compare;
    }
    compare = _comparePositions(other);
    if (compare != 0) {
      return compare;
    }
    return _compareField<String>(other, (e) => e.text);
  }

  /// Compares two fields of two ScaleEntry objects.
  /// if the field is null, the object is considered smaller
  /// if the field is not null, the field is compared by the [compare] function
  /// if provided, otherwise by the [compareTo] method of the field is used
  /// if it is [Comparable]
  ///
  /// Throws an [AssertionError] if [T] is not comparable
  /// and no [compare] function is provided
  int _compareField<T>(ScaleEntry other, T? Function(ScaleEntry) getField,
      {int Function(T a, T b)? compare}) {
    T? thisField = getField(this);
    T? otherField = getField(other);

    if (thisField == null && otherField == null) {
      return 0;
    } else if (thisField == null) {
      return -1;
    } else if (otherField == null) {
      return 1;
    }
    assert(compare != null || thisField is Comparable,
        'T must be comparable or compare function must be provided');
    if (compare != null) {
      return compare(thisField, otherField);
    }
    return (thisField as Comparable).compareTo(otherField);
  }

  int _comparePositions(ScaleEntry other) {
    String? a = position;
    String? b = other.position;
    if (a == b) return 0;
    if (a == 'end' || b == 'start') return -1;
    if (a == 'start' || b == 'end') return 1;
    return _compareField<String>(other, (e) => e.position);
  }

  @override
  bool operator ==(Object other) {
    if (other is! ScaleEntry) {
      return false;
    }
    return value == other.value &&
        text == other.text &&
        position == other.position;
  }

  @override
  int get hashCode => Object.hash(value, text, position);
}
