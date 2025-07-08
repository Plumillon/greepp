extension StringExtensions on String? {
  bool get nullOrEmpty => this == null || this != null && this!.isEmpty;

  String get sanitize => this == null
      ? ''
      : this!
          .toLowerCase()
          .replaceAll(RegExp(r'[^\w\s]+'), '')
          .runes
          .where((rune) => String.fromCharCode(rune).codeUnitAt(0) < 128)
          .map((rune) => String.fromCharCode(rune))
          .join();

  bool get isLocal =>
      this != null &&
      (this!.startsWith('blob:') ||
          this!.startsWith('file://') ||
          this!.startsWith('content://') ||
          this!.startsWith('/'));
}
