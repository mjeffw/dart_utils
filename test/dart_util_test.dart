import 'package:dart_utils/dart_util.dart';
import 'package:dart_utils/src/regexps.dart';
import 'package:quiver/collection.dart';
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

  group('listEquals', () {
    List<int> intList = [1, 3, 5, 8, 13];
    test('identical', () {
      expect(listsEqual(intList, intList), true);
    });

    test('equivalent', () {
      List<int> another = [1, 3, 5, 8, 13];
      expect(listsEqual(intList, another), true);
    });
    
    test('different lengths', () {
      List<int> another = [1, 2, 3, 5, 8, 13];
      expect(listsEqual(intList, another), false);
    });
    
    test('same length, different members', () {
      List<int> another = [1, 3, 5, 8, 11];
      expect(listsEqual(intList, another), false);
    });

    test('different types', () {
      List<String> another = ['1', '3', '5', '8', '13'];
      expect(listsEqual(intList, another), false);
    });
  });
}
