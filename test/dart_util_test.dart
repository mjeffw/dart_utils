import 'package:dart_utils/dart_util.dart';
import 'package:test/test.dart';

void main() {
  test('regex', () {
    RegExp(R_DIGITS);
    RegExp(R_SIGN);
    RegExp(R_NUMBER);
  });
}
