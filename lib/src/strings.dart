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

///
extension StringMethods on String {
  /// Remove any trailing characters that match [other].
  String deleteTrailing(String other) =>
      (endsWith(other)) ? substring(0, length - other.length) : this;

  /// Create a string with the first character uppercased.
  String capitalizeWord() => replaceRange(0, 1, substring(0, 1).toUpperCase());

  /// Uppercase the first character of each word of this string.
  String toTitleCase() => RegExp(r'\w+')
      .allMatches(this)
      .map((match) => match.group(0))
      .map((f) => f.capitalizeWord())
      .reduce((a, b) => '$a $b');
}
