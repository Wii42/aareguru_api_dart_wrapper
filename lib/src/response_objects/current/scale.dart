import 'package:aareguru_api/aareguru_api.dart';

/// A scale is a list of [ScaleEntry] objects. The range of each ScaleEntry is defined by the [value] field at one side and the next ScaleEntry at the other side, the other side being defined by the [position] field.
class Scale<T extends ScaleEntry> {
  /// Entries of the scale, expected to be sorted.
  late List<T> _entries;

  Scale(Iterable<T> entries) {
    _entries = _prepareEntries(entries);
    _assertScaleIsValid();
  }

  List<T> _prepareEntries(Iterable<T> entries) => List.of(entries)..sort();

  /// Entries of the scale.
  ///
  /// Note that the getter returns a copy of the entries, so the original cannot be modified in place.
  List<T> get entries => List.of(_entries);

  set entries(List<T> entries) {
    _entries = _prepareEntries(entries);
    _assertScaleIsValid();
  }

  /// Returns the [ScaleEntry] object in the range of which the given [value] lies.
  /// If no such entry exists, null is returned.
  T? selectFittingScaleEntry(double value) {
    T? entryBelow;
    T? entryAbove;
    for (T entry in _entries) {
      if (entry.value == value) {
        return entry;
      }
      if (entry.value == null) {
        continue;
      }
      if (entry.value! <= value) {
        entryBelow = entry;
      } else {
        entryAbove = entry;
        break;
      }
    }
    if (entryAbove?.position == 'end') {
      return entryAbove;
    }
    if (entryBelow?.position == 'start') {
      return entryBelow;
    }
    return null;
  }

  /// Checks if the scale has no overlapping entries.
  bool isScaleValid() {
    T? entryBefore;
    for (T entry in _entries) {
      if (entryBefore?.position == 'start' && entry.position == 'end') {
        return false;
      }
      entryBefore = entry;
    }
    return true;
  }

  void _assertScaleIsValid() {
    assert(isScaleValid(), 'Scale is has overlapping entries');
  }
}
