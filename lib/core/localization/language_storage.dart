import 'package:hive/hive.dart';
import 'package:shop_lite_premium/core/utils/constant.dart';

class LanguageStorage {

  static const String langKey = "language";

  Future<void> saveLanguage(String lang) async {
    final hive = Hive.box<String>(Constant.langBox);
    hive.put(langKey, lang);
  }

  Future<String> getLanguage() async {
    final hive = Hive.box<String>(Constant.langBox);
    return hive.get(langKey) ?? "en";
  }

}