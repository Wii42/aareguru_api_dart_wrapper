import 'package:aareguru_api/aareguru_api.dart';
import 'package:test/test.dart';

void main() {
  group('compareTo', () {
    test('smaller Value', () {
      ScaleEntry smallerEntry =
          ScaleEntry(value: 1, position: 'start', text: '1');
      ScaleEntry biggerEntry =
          ScaleEntry(value: 2, position: 'end', text: '2');
      expect(smallerEntry.compareTo(biggerEntry), isNegative);
      expect(smallerEntry == biggerEntry, isFalse);
    });

    test('bigger Value', () {
      ScaleEntry smallerEntry =
          ScaleEntry(value: 1, position: 'start', text: '1');
      ScaleEntry biggerEntry =
          ScaleEntry(value: 2, position: 'start', text: '2');
      expect(biggerEntry.compareTo(smallerEntry), isPositive);
    });

    test('null Value', () {
      ScaleEntry entry = ScaleEntry(value: 1, position: 'end', text: '1');
      ScaleEntry nullEntry =
          ScaleEntry(value: null, position: 'start', text: '1');
      expect(entry.compareTo(nullEntry), isPositive);
    });

    test('order by position, ', () {
      ScaleEntry startEntry =
          ScaleEntry(value: 1, position: 'start', text: '1');
      ScaleEntry endEntry = ScaleEntry(value: 1, position: 'end', text: '1');
      expect(startEntry.compareTo(endEntry), isPositive, reason: 'start should come after end');
      expect(endEntry.compareTo(startEntry), isNegative);
      expect(startEntry == endEntry, isFalse);
    });

    test('null position', () {
      ScaleEntry startEntry = ScaleEntry(value: 1, position: 'start', text: '1');
      ScaleEntry endEntry = ScaleEntry(value: 1, position: 'end', text: '1');
      ScaleEntry nullEntry = ScaleEntry(value: 1, position: null, text: '1');
      expect(startEntry.compareTo(nullEntry), isPositive, reason: 'start should come after null');
      expect(nullEntry.compareTo(startEntry), isNegative);
      expect(endEntry.compareTo(nullEntry), isNegative, reason: 'end should come before null');
      expect(nullEntry.compareTo(endEntry), isPositive);
    });

    test('unexpected position', () {
      ScaleEntry startEntry =
          ScaleEntry(value: 1, position: 'start', text: '1');
      ScaleEntry endEntry = ScaleEntry(value: 1, position: 'end', text: '1');
      ScaleEntry unexpectedEntry =
          ScaleEntry(value: 1, position: 'unexpected', text: '1');
      expect(startEntry.compareTo(unexpectedEntry), isPositive, reason: 'start should come after unexpected');
      expect(endEntry.compareTo(unexpectedEntry), isNegative, reason: 'end should come before unexpected');
      expect(unexpectedEntry.compareTo(startEntry), isNegative);
    });

    test('compare text', () {
      ScaleEntry entry1 = ScaleEntry(value: 1, position: 'start', text: '1');
      ScaleEntry entry2 = ScaleEntry(value: 1, position: 'start', text: '2');
      expect(entry1.compareTo(entry2), isNegative);
      expect(entry1 == entry2, isFalse);
    });

    test('equals', () {
      ScaleEntry entry1 = ScaleEntry(value: 1, position: 'start', text: '1');
      ScaleEntry entry2 = ScaleEntry(value: 1, position: 'start', text: '1');
      expect(entry1.compareTo(entry2), 0);
      expect(entry1 == entry2, isTrue);
    });
  });

}
