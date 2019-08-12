class JsonEx {
  static List<String> toListOfStrings(List<dynamic> json) {
    return json.map((it) => it.toString()).toList();
  }
}
