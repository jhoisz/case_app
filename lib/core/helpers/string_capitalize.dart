  String capitalize(String? str) {
    List<String> nonCapitalizedWords = ['em', 'de', 'e'];

    if (str == null || str.isEmpty) {
      return '';
    }
    return str
        .split(' ')
        .map((word) => nonCapitalizedWords.contains(word.toLowerCase())
            ? word.toLowerCase()
            : word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }