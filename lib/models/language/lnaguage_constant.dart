// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/utils/shared_pref.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String URDU = 'ur';
const String ARABIC = 'ar';
const String FRENCH = 'fr';
const String SPANISH = 'es';
const String RUSSIAN = 'ru';
const String TURKISH = 'tr';
const String INDONESIAN = 'id';
const String MALAY = 'ms';
const String CHINESE_SM = 'zh';
const String CHINESE_TW = 'zh_TW';
const String GERMAN = 'de';
const String DUTCH = 'nl';
const String ITALIAN = 'it';

Future<Locale> setLocale(String languageCode ) async {
  await SharedPref().saveString(LAGUAGE_CODE, languageCode);
 return _locale(languageCode);
}

Future<Locale> getLocale()async  {
  String languageCode =await SharedPref().readString(LAGUAGE_CODE);
return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, '');
    case URDU:
      return const Locale(URDU, '');
    case ARABIC:
      return const Locale(ARABIC, '');
    case FRENCH:
      return const Locale(FRENCH, "");
    case SPANISH:
      return const Locale(SPANISH, "");
    case RUSSIAN:
      return const Locale(RUSSIAN, "");
    case TURKISH:
      return const Locale(TURKISH, "");
    case INDONESIAN:
      return const Locale(INDONESIAN, "");
    case MALAY:
      return const Locale(MALAY, "");
    case CHINESE_SM:
      return const  Locale.fromSubtags(languageCode: CHINESE_SM,scriptCode: "Hans",countryCode: "CN");
    case CHINESE_TW:
      return  const Locale.fromSubtags(languageCode: CHINESE_TW,scriptCode: "Hant",countryCode: "TW");
    case GERMAN:
      return const Locale(GERMAN, "");
    case DUTCH:
      return const Locale(DUTCH, "");
    case ITALIAN:
      return const Locale(ITALIAN, "");

    default:
      return const Locale(ENGLISH, '');
  }
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}