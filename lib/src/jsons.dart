class JsonEx {
  static List<String> toListOfStrings(List<dynamic> json) =>
      json == null ? null : json.map((it) => it.toString()).toList();
}
