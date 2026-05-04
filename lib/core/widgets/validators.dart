import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../translation/translation_keys.dart';

String? validateEmail(String? value) {
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool result = emailRegex.hasMatch(value ?? '');
  return result ? null : TranslationKeys.invalidEmail.tr;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return TranslationKeys.passwordRequired.tr;
  }

  if (value.length < 6) {
    return TranslationKeys.passwordShort.tr;
  }

  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return TranslationKeys.passwordUppercase.tr;
  }

  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return TranslationKeys.passwordLowercase.tr;
  }

  if (!RegExp(r'\d').hasMatch(value)) {
    return TranslationKeys.passwordNumber.tr;
  }

  if (!RegExp(r'[@$!%*?&]').hasMatch(value)) {
    return TranslationKeys.passwordSymbol.tr;
  }

  return null;
}