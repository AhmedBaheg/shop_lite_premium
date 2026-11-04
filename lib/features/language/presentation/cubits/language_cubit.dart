import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shop_lite_premium/core/network/result.dart';

import '../../domain/use_cases/change_language_use_case.dart';
import '../../domain/use_cases/get_language_use_case.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit({this._changeLanguageUseCase, this._getLanguageUseCase})
    : super(LanguageInitial());

  final ChangeLanguageUseCase? _changeLanguageUseCase;
  final GetLanguageUseCase? _getLanguageUseCase;

  Future<void> changeLanguage(String lang) async {
    emit(LanguageLoading());

    final result = await _changeLanguageUseCase!.call(lang);

    if (result is Success<void>) {
      emit(LanguageChanged(locale: Locale(lang)));
    } else if (result is Failure) {
      emit(LanguageFailure(errorMessage: result.errorMessage));
    }
  }

  Future<void> getLanguage() async {
    emit(LanguageLoading());

    final result = await _getLanguageUseCase!.call();

    if (result is Success<String>) {
      emit(LanguageChanged(locale: Locale(result.data)));
    } else if (result is Failure) {
      emit(LanguageFailure(errorMessage: result.errorMessage));
    }
  }
}
