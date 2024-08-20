import 'package:aareguru_api/aareguru_api.dart';
import 'package:test/test.dart';

void main() {
  group('scale entries', () {
    test('start positions correct', () {
      Scale scale = Scale([
        ScaleEntry(value: 1, position: 'start', text: '1'),
        ScaleEntry(value: 2, position: 'start', text: '2')
      ]);
      expect(scale.entries.map((e) => e.text), ['1', '2']);
    });

    test('start positions inverted', () {
      Scale scale = Scale([
        ScaleEntry(value: 2, position: 'start', text: '2'),
        ScaleEntry(value: 1, position: 'start', text: '1')
      ]);
      expect(scale.entries.map((e) => e.text), ['1', '2']);
    });

    test('end positions', () {
      Scale scale = Scale([
        ScaleEntry(value: 2, position: 'end', text: '2'),
        ScaleEntry(value: 1, position: 'end', text: '1')
      ]);
      expect(scale.entries.map((e) => e.text), ['1', '2']);
    });

    test('null values', () {
      Scale scale = Scale([
        ScaleEntry(value: 2, position: 'end', text: '2'),
        ScaleEntry(value: null, position: 'end', text: 'null')
      ]);
      expect(scale.entries.map((e) => e.text), ['null', '2']);
    });

    test('detect range overlap', () {
      expect(() => Scale([
        ScaleEntry(value: 1, position: 'start', text: '1'),
        ScaleEntry(value: 2, position: 'end', text: '2')
      ]), throwsA(isA<AssertionError>()));
    });

    test('multiple positions, same value', () {
      Scale scale = Scale([
        ScaleEntry(value: 1, position: '_', text: '_'),
        ScaleEntry(value: 1, position: 'start', text: 'start'),
        ScaleEntry(value: 1, position: null, text: 'null'),
        ScaleEntry(value: 1, position: 'end', text: 'end'),
        ScaleEntry(value: 1, position: 'unexpected', text: 'unexpected'),
      ]);
      expect(scale.entries.map((e) => e.text), ['end', 'null', '_','unexpected', 'start']);
    });

  });
  group('selectFittingScaleEntry', ()
  {
    test('fitting entry position all start', (){
      ScaleEntry fittingEntry = ScaleEntry(value: 2, position: 'start', text: 'fitting');
      Scale scale = Scale([
        ScaleEntry(value: 1, position: 'start', text: '1'),
        fittingEntry,
        ScaleEntry(value: 3, position: 'start', text: '3')
      ]);
      expect(scale.selectFittingScaleEntry(2), fittingEntry);
      expect(scale.selectFittingScaleEntry(2.5), fittingEntry);
    });

    test('value smaller than scale', (){
      Scale scale = Scale([
        ScaleEntry(value: 1, position: 'start', text: '1'),
        ScaleEntry(value: 2, position: 'start', text: '2')
      ]);
      expect(scale.selectFittingScaleEntry(0), isNull);
    });

    test('all end positions', (){
      ScaleEntry fittingEntry = ScaleEntry(value: 2, position: 'end', text: 'fitting');
      Scale scale = Scale([
        ScaleEntry(value: 1, position: 'end', text: '1'),
        fittingEntry,
        ScaleEntry(value: 3, position: 'end', text: '3')
      ]);
      expect(scale.selectFittingScaleEntry(2), fittingEntry);
      expect(scale.selectFittingScaleEntry(1.5), fittingEntry);
    });

    test('value bigger than scale', (){
      Scale scale = Scale([
        ScaleEntry(value: 1, position: 'end', text: '1'),
        ScaleEntry(value: 2, position: 'end', text: '2')
      ]);
      expect(scale.selectFittingScaleEntry(3), isNull);
    });

    test('value between entries', (){
      Scale scale = Scale([
        ScaleEntry(value: 1, position: 'end', text: '1'),
        ScaleEntry(value: 3, position: 'start', text: '3')
      ]);
      expect(scale.selectFittingScaleEntry(2), isNull);
    });

    test('hits entry with no position', (){
      ScaleEntry fittingEntry = ScaleEntry(value: 2, position: null, text: 'fitting');
      Scale scale = Scale([
        ScaleEntry(value: 1, position: 'start', text: '1'),
        fittingEntry,
        ScaleEntry(value: 3, position: 'end', text: '3')
      ]);
      expect(scale.selectFittingScaleEntry(2), fittingEntry);
    });
  });
}
