import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'language_storage.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit({required this._storage}) : super(LanguageInitial());

  final LanguageStorage _storage;

  Future<void> changeLanguage(String lang) async {
    emit(LanguageLoading());

    try {
      await _storage.saveLanguage(lang);
      emit(LanguageChanged(locale: Locale(lang)));
    } catch (e) {
      emit(LanguageFailure(errorMessage: e.toString()));
    }
  }

  Future<void> getLanguage() async {
    emit(LanguageLoading());

    try {
      final lang = await _storage.getLanguage();
      emit(LanguageChanged(locale: Locale(lang)));
    } catch (e) {
      emit(LanguageFailure(errorMessage: e.toString()));
    }
  }
}
