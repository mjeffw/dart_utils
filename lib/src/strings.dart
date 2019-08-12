class StringEx {
  ///
  /// A null-safe implementation of the [String.split()] method.
  ///
  /// * If ```source``` is null, return the empty list.
  /// * If ```pattern``` is null, return ```[source]```.
  /// * Otherwise, return ```source.split(pattern)```
  ///
  static List<String> splitNullSafe(String source, String pattern) =>
      (source == null)
          ? []
          : pattern == null ? [source] : source.split(pattern);
}
