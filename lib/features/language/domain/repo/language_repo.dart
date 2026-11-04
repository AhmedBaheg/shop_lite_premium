import 'package:shop_lite_premium/core/network/result.dart';

abstract class LanguageRepo {
  Future<Result<void>> changeLanguage({required String lang});

  Future<Result<String>> getLanguage();

}
