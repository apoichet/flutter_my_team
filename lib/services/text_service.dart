
isNullOrEmpty(String text) {
  return text == null || text == "";
}

isNotNullAndNotEmpty(String text) {
  return !isNullOrEmpty(text);
}
