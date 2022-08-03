enum Language { ENGLISH, ARABIC }

const String ARABIC = 'ar';
const String ENGLISH = 'en';

extension LanguageExtension on Language {
  String getValue() {
    switch (this) {
      case Language.ENGLISH:
        return ENGLISH;
      case Language.ARABIC:
        return ARABIC;
    }
  }
}
