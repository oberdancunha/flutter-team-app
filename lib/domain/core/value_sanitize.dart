String removeExcessiveWhitspaces(String input) {
  return input.trim().replaceAll(RegExp(' +'), ' ');
}
