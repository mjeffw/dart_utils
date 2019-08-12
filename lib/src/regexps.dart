class RegExpEx {
  static String R_DIGITS = r'\d+'; // all positive integers
  static String R_SIGN = r'[+|-]';
  static String R_NUMBER = '$R_SIGN$R_DIGITS';

  ///
  /// Return ```true``` if the match contains a group with the name.
  ///
  static bool hasNamedGroup(RegExpMatch match, String name) =>
      match != null &&
      match.groupNames.contains(name) &&
      match.namedGroup(name) != null;

  ///
  /// Null-aware get named group match.
  ///
  static String getNamedGroup(RegExpMatch match, String name) =>
      hasNamedGroup(match, name) ? match.namedGroup(name) : null;
}
