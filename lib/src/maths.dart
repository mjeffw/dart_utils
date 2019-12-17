import 'dart:math';

extension DoubleMethods on double {
  double toPrecision(int precision) =>
      (this * pow(10, precision)).round() / pow(10, precision);
}
