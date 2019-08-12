import 'dart:convert';

import 'package:dart_utils/dart_util.dart';
import 'package:dart_utils/src/regexps.dart';
import 'package:test/test.dart';

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
    expect(StringEx.toTitleCase('test_underscore_s'), 'Test_underscore_s');
    expect(StringEx.toTitleCase('test spaces is'), 'Test Spaces Is');
    expect(StringEx.toTitleCase('test.dots'), 'Test Dots');
    expect(StringEx.toTitleCase('test-num5ers'), 'Test Num5ers');
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
    String pattern = r'\[(?<one>.*)\]';
    RegExp r = RegExp(pattern);
    String in1 = 'Some input with [a match]';
    String in2 = 'Some input without a match';

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
}
