// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Techno App`
  String get techno_App {
    return Intl.message(
      'Techno App',
      name: 'techno_App',
      desc: '',
      args: [],
    );
  }

  /// `Read from Local Storage`
  String get read_From_Local_Storage {
    return Intl.message(
      'Read from Local Storage',
      name: 'read_From_Local_Storage',
      desc: '',
      args: [],
    );
  }

  /// `Scan from Camera`
  String get scan_From_Camera {
    return Intl.message(
      'Scan from Camera',
      name: 'scan_From_Camera',
      desc: '',
      args: [],
    );
  }

  /// `Generate From Text`
  String get generate_From_Text {
    return Intl.message(
      'Generate From Text',
      name: 'generate_From_Text',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Share App`
  String get share_App {
    return Intl.message(
      'Share App',
      name: 'share_App',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_Policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_Policy',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Paste`
  String get paste {
    return Intl.message(
      'Paste',
      name: 'paste',
      desc: '',
      args: [],
    );
  }

  /// `Navigate`
  String get navigate {
    return Intl.message(
      'Navigate',
      name: 'navigate',
      desc: '',
      args: [],
    );
  }

  /// `Generate`
  String get generate {
    return Intl.message(
      'Generate',
      name: 'generate',
      desc: '',
      args: [],
    );
  }

  /// `Text`
  String get text {
    return Intl.message(
      'Text',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `Write text here...`
  String get write_Text_Here {
    return Intl.message(
      'Write text here...',
      name: 'write_Text_Here',
      desc: '',
      args: [],
    );
  }

  /// `Enter Qr`
  String get enter_Qr {
    return Intl.message(
      'Enter Qr',
      name: 'enter_Qr',
      desc: '',
      args: [],
    );
  }

  /// `Qr Code`
  String get qr_Code {
    return Intl.message(
      'Qr Code',
      name: 'qr_Code',
      desc: '',
      args: [],
    );
  }

  /// `Result QR code`
  String get result_Qr_Code {
    return Intl.message(
      'Result QR code',
      name: 'result_Qr_Code',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `Result Text`
  String get result_Text {
    return Intl.message(
      'Result Text',
      name: 'result_Text',
      desc: '',
      args: [],
    );
  }

  /// `History screen`
  String get history_Screen {
    return Intl.message(
      'History screen',
      name: 'history_Screen',
      desc: '',
      args: [],
    );
  }

  /// `Scan History`
  String get scan_History {
    return Intl.message(
      'Scan History',
      name: 'scan_History',
      desc: '',
      args: [],
    );
  }

  /// `Read History`
  String get read_History {
    return Intl.message(
      'Read History',
      name: 'read_History',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'ur'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
