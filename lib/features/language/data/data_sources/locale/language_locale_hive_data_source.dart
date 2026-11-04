abstract class LanguageLocaleHiveDataSource {

  Future<void> saveLanguageLocale({required String lang});

  Future<String> getLanguageLocale();

}