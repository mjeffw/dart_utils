import 'package:dart_utils/dart_util.dart';
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
}
