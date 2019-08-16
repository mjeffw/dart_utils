import 'dart:math';

class Maths {
  static double setPrecision(double value, int precision) {
    int fac = pow(10, precision);
    return (value * fac).round() / fac;
  }
}
