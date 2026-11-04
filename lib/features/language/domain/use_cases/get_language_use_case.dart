import '../../../../core/network/result.dart';
import '../repo/language_repo.dart';

class GetLanguageUseCase {
  final LanguageRepo _languageRepo;

  GetLanguageUseCase({required this._languageRepo});

  Future<Result<void>> call() async {
    return await _languageRepo.getLanguage();
  }
}
