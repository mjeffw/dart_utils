class ListEx {
  ///
  /// Regrettable that we have to do this because this project is pure Dart.
  /// Flutter has a collection utility package with this method.
  ///
  // static bool listEquals(List<dynamic> one, List<dynamic> other) {
  //   if (identical(one, other)) return true;
  //   if (one.runtimeType != other.runtimeType || one.length != other.length) {
  //     return false;
  //   }
  //   for (var i = 0; i < one.length; i++) {
  //     if (one[i] != other[i]) return false;
  //   }
  //   return true;
  // }
}
