class Language {
  int id;
  final String flag;
  final String name;
  final String languageCode;
  final String countryCode;

  Language(this.id, this.flag, this.name, this.languageCode, this.countryCode);

  static List<Language> languageList = <Language>[
    Language(0, "🇺🇸", "English", "en", "US"),
    Language(1, "🇮🇳", "हिंदी", "hi", "IN"),
    Language(2, "🇸🇦", "اَلْعَرَبِيَّةُ", "ar", "SA"),
    Language(3, "🇫🇷", "française", "fr", "FR"),
  ];
}
