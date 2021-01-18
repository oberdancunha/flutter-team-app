class ValueSanitize {
  String removeExcessiveWhiteSpaces(String input) {
    return input.trim().replaceAll(RegExp(' +'), ' ');
  }
}
