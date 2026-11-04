import '../../../../core/network/result.dart';
import '../repo/language_repo.dart';

class ChangeLanguageUseCase {
  final LanguageRepo _languageRepo;

  ChangeLanguageUseCase({required this._languageRepo});

  Future<Result<void>> call(String lang) async {
    return await _languageRepo.changeLanguage(lang: lang);
  }
}
