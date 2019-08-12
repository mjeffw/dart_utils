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

  static String toTitleCase(String text) => RegExp(r'\w+')
      .allMatches(text)
      .map((match) => match.group(0))
      .map(capitalizeWord)
      .reduce((a, b) => '$a $b');

  ///
  /// Convert the first character of this word to UpperCase.
  ///
  static String capitalizeWord(String word) =>
      word.replaceRange(0, 1, word.substring(0, 1).toUpperCase());
}
