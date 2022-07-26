import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/utils/shared_pref.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String URDU = 'ur';
const String ARABIC = 'ar';

Future<Locale> setLocale(String languageCode ) async {
  await SharedPref().saveString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  String languageCode = SharedPref().readString(LAGUAGE_CODE).toString();
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, '');
    case URDU:
      return const Locale(URDU, "");
    case ARABIC:
      return const Locale(ARABIC, "");
    default:
      return const Locale(ENGLISH, '');
  }
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}