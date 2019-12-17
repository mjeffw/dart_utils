import 'dart:convert';
import 'dart:math';

import 'package:test/test.dart';

import 'package:dart_utils/dart_utils.dart';

void main() {
  test('regex', () {
    expect(RegExp(R_DIGITS), isNotNull);
    expect(RegExp(R_SIGN), isNotNull);
    expect(RegExp(R_NUMBER), isNotNull);
  });

  test('splitNullSafe', () {
    expect(StringEx.splitNullSafe(null, null), isEmpty);
    expect(StringEx.splitNullSafe(null, 'delim'), isEmpty);
    expect(
        StringEx.splitNullSafe('source', null), containsAllInOrder(['source']));
    expect(StringEx.splitNullSafe('*moose**and*squirell', '\*'),
        containsAllInOrder(['moose', '', 'and', 'squirell']));
  });

  test('toTitleCase', () {
    expect('test_underscore_s'.toTitleCase(), 'Test_underscore_s');
    expect('test spaces is'.toTitleCase(), 'Test Spaces Is');
    expect('test.dots'.toTitleCase(), 'Test Dots');
    expect('test-num5ers'.toTitleCase(), 'Test Num5ers');
  });

  test('deleteTrailing', () {
    expect('test_underscore_s'.deleteTrailing('_s'), 'test_underscore');
    expect('test spaces is'.deleteTrailing(''), 'test spaces is');
    expect('test.dots'.deleteTrailing('test'), 'test.dots');
  });

  test('isEmpty', () {
    expect(ListEx.isEmpty(null), true);
    expect(ListEx.isEmpty([]), true);
    expect(ListEx.isEmpty(['list']), false);
  });

  test('toListOfString', () {
    var text = '{"list": [1,2,3,4]}';
    var temp = json.decode(text);
    expect(JsonEx.toListOfStrings(temp['list']),
        containsAllInOrder(['1', '2', '3', '4']));
  });

  group('RegExpEx', () {
    final pattern = r'\[(?<one>.*)\]';
    final r = RegExp(pattern);
    final in1 = 'Some input with [a match]';
    final in2 = 'Some input without a match';

    test('hasNamedGroup', () {
      expect(RegExpEx.hasNamedGroup(r.firstMatch(in1), 'one'), true);
      expect(RegExpEx.hasNamedGroup(r.firstMatch(in1), 'two'), false);
      expect(RegExpEx.hasNamedGroup(r.firstMatch(in2), 'two'), false);
      expect(RegExpEx.hasNamedGroup(r.firstMatch(in2), 'one'), false);
    });

    test('getNamedGroup', () {
      expect(RegExpEx.getNamedGroup(r.firstMatch(in1), 'one'), 'a match');
      expect(RegExpEx.getNamedGroup(r.firstMatch(in1), 'two'), isNull);
      expect(RegExpEx.getNamedGroup(r.firstMatch(in2), 'two'), isNull);
      expect(RegExpEx.getNamedGroup(r.firstMatch(in2), 'one'), isNull);
    });
  });

  test('double.toPrecision', () {
    expect((0.1 + 0.2).toPrecision(4), 0.3);
    expect((0.1234567890).toPrecision(4), 0.1235);
    expect(pi.toPrecision(4), 3.1416);
  });
}
