String fileNameOf(String path) => path.split(RegExp(r'[\\/]')).last;

/// First letter of the first two words, e.g. "Mona Daoud" -> "MD".
String initialsOf(String fullName) {
  final words = fullName
      .trim()
      .split(RegExp(r'\s+'))
      .where((w) => w.isNotEmpty)
      .take(2);
  return words
      .map((w) => String.fromCharCode(w.runes.first).toUpperCase())
      .join();
}
