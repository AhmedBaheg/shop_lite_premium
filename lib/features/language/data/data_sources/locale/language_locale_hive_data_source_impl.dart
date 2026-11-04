import 'package:hive_flutter/adapters.dart';

import '../../../../../core/utils/constant.dart';
import 'language_locale_hive_data_source.dart';

class LanguageLocaleHiveDataSourceImpl implements LanguageLocaleHiveDataSource{

  @override
  Future<void> saveLanguageLocale({required String lang}) async{
    final hive = Hive.box<String>(Constant.langBox);
    await hive.put(Constant.langKey, lang);
  }

  @override
  Future<String> getLanguageLocale() async {
    final hive = Hive.box<String>(Constant.langBox);
    return hive.get(Constant.langKey) ?? "en";
  }


}