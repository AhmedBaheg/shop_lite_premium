import 'package:shop_lite_premium/core/network/result.dart';

import '../../domain/repo/language_repo.dart';
import '../data_sources/locale/language_locale_hive_data_source.dart';

class LanguageRepoImpl implements LanguageRepo{

  final LanguageLocaleHiveDataSource _languageLocaleHiveDataSource;

  new({required this._languageLocaleHiveDataSource});

  @override
  Future<Result<void>> changeLanguage({required String lang}) async {
    try{
      await _languageLocaleHiveDataSource.saveLanguageLocale(lang: lang);
      return Success(data: null);
    } catch(e){
      return Failure(errorMessage: e.toString());
    }
  }

  @override
  Future<Result<String>> getLanguage() async {
    try {
      final lang = await _languageLocaleHiveDataSource.getLanguageLocale();
      return Success(data: lang);
    }  catch (e) {
      return Failure(errorMessage: e.toString());
    }
  }
}