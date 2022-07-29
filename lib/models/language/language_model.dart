class LanguageModel {
  final int id;
  final String flag;
  final String name;
  final String languageCode;


  LanguageModel(this.id, this.flag, this.name, this.languageCode);

  static List<LanguageModel> languageList() {
    return <LanguageModel>[
      LanguageModel(1, "🇺🇸", "English", "en"),
      LanguageModel(2, "🇸🇦", "اَلْعَرَبِيَّةُ", "ar"),
      LanguageModel(3, "🇵🇰", "اردو", "ur"),
      LanguageModel(4, "🇫🇷", "Français", "fr"),
      LanguageModel(5, "🇫🇷", "Español", "es"),
      LanguageModel(6, "🇷🇺", "Русский", "ru"),
      LanguageModel(7, "🇹🇷", "Türkçe", "tr"),
      LanguageModel(8, "🇮🇩", "Bahasa Indonesia", "id"),
      LanguageModel(9, "🇲🇾", "Bahasa Melayu", "ms"),
      LanguageModel(10, "🇩🇪", "Deutsch", "de"),
      LanguageModel(11, "🇳🇱", "Nertherland", "nl"),
      LanguageModel(12, "🇮🇹", "Italiana", "it"),
      LanguageModel(13, "🇨🇳", "中国人", "zh"),
      LanguageModel(14, "🇭🇰", "中國人", "zh_TW"),

    ];
  }
}