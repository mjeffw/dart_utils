class JsonEx {
  static List<String> toListOfStrings(List<dynamic> json) =>
      json == null ? [] : json.map((it) => it.toString()).toList();
}
