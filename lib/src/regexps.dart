const String R_DIGITS = r'\d+'; // all positive integers
const String R_SIGN = r'[+|-]';
const String R_NUMBER = '$R_SIGN$R_DIGITS';

class RegExpEx {
  /// Null-aware check for named group.
  static bool hasNamedGroup(RegExpMatch match, String name) =>
      match == null ? false : match.hasNamedGroup(name);

  ///
  /// Null-aware get named group match.
  ///
  static String getNamedGroup(RegExpMatch match, String name) =>
      match?.getNamedGroup(name);
}

extension RegExpMatchMethods on RegExpMatch {
  /// Evaluates to [true] if there exists a groupName that matches [name].
  bool hasNamedGroup(String name) =>
      groupNames.contains(name) && namedGroup(name) != null;

  String getNamedGroup(String name) =>
      hasNamedGroup(name) ? namedGroup(name) : null;
}
