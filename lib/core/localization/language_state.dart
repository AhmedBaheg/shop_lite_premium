part of 'language_cubit.dart';

@immutable
sealed class LanguageState {}

final class LanguageInitial extends LanguageState {}
final class LanguageLoading extends LanguageState {}
final class LanguageChanged extends LanguageState {
  final Locale locale;

  LanguageChanged({required this.locale});
}
final class LanguageFailure extends LanguageState {
  final String errorMessage;

  LanguageFailure({required this.errorMessage});
}
