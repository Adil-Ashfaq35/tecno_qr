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

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get fAQ {
    return Intl.message(
      'FAQ',
      name: 'fAQ',
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

  /// `Terms of use`
  String get terms_Of_Use {
    return Intl.message(
      'Terms of use',
      name: 'terms_Of_Use',
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

  /// `Scan From Camera`
  String get scan_Button_Text {
    return Intl.message(
      'Scan From Camera',
      name: 'scan_Button_Text',
      desc: '',
      args: [],
    );
  }

  /// `Read From Local Image`
  String get read_Button_Text {
    return Intl.message(
      'Read From Local Image',
      name: 'read_Button_Text',
      desc: '',
      args: [],
    );
  }

  /// `Generate From Text`
  String get generate_Button_Text {
    return Intl.message(
      'Generate From Text',
      name: 'generate_Button_Text',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get result_Language_Label {
    return Intl.message(
      'Result',
      name: 'result_Language_Label',
      desc: '',
      args: [],
    );
  }

  /// `Navigate`
  String get navigate_Button_Text {
    return Intl.message(
      'Navigate',
      name: 'navigate_Button_Text',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy_Button_Text {
    return Intl.message(
      'Copy',
      name: 'copy_Button_Text',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download_Button_Text {
    return Intl.message(
      'Download',
      name: 'download_Button_Text',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share_Button_Text {
    return Intl.message(
      'Share',
      name: 'share_Button_Text',
      desc: '',
      args: [],
    );
  }

  /// `Scan History`
  String get scan_Tree_Item {
    return Intl.message(
      'Scan History',
      name: 'scan_Tree_Item',
      desc: '',
      args: [],
    );
  }

  /// `Generate History`
  String get generate_Tree_item {
    return Intl.message(
      'Generate History',
      name: 'generate_Tree_item',
      desc: '',
      args: [],
    );
  }

  /// `TecnoCode Version 6.0.1.0`
  String get first_Line {
    return Intl.message(
      'TecnoCode Version 6.0.1.0',
      name: 'first_Line',
      desc: '',
      args: [],
    );
  }

  /// ` TecnoWays LLC All rights reserved`
  String get second_Line {
    return Intl.message(
      ' TecnoWays LLC All rights reserved',
      name: 'second_Line',
      desc: '',
      args: [],
    );
  }

  /// `TecnoWays LLC All rights reserved`
  String get third_Line {
    return Intl.message(
      'TecnoWays LLC All rights reserved',
      name: 'third_Line',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get oK_Button_Text {
    return Intl.message(
      'OK',
      name: 'oK_Button_Text',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel_Button_Text {
    return Intl.message(
      'Cancel',
      name: 'cancel_Button_Text',
      desc: '',
      args: [],
    );
  }

  /// `Save `
  String get save_Button_Text {
    return Intl.message(
      'Save ',
      name: 'save_Button_Text',
      desc: '',
      args: [],
    );
  }

  /// `By installing or using this application you are accepting the privacy policy`
  String get shown_Only_On_The_Early_First_Time {
    return Intl.message(
      'By installing or using this application you are accepting the privacy policy',
      name: 'shown_Only_On_The_Early_First_Time',
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

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `TecnoCode`
  String get tecno_Code {
    return Intl.message(
      'TecnoCode',
      name: 'tecno_Code',
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

  /// `Text`
  String get text {
    return Intl.message(
      'Text',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `paste`
  String get paste {
    return Intl.message(
      'paste',
      name: 'paste',
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

  /// `History Screen`
  String get history_Screen {
    return Intl.message(
      'History Screen',
      name: 'history_Screen',
      desc: '',
      args: [],
    );
  }

  /// `Qr not found in image`
  String get qr_Not_Found_In_Image {
    return Intl.message(
      'Qr not found in image',
      name: 'qr_Not_Found_In_Image',
      desc: '',
      args: [],
    );
  }

  /// `Result Screen`
  String get result_Screen {
    return Intl.message(
      'Result Screen',
      name: 'result_Screen',
      desc: '',
      args: [],
    );
  }

  /// `Invalid url`
  String get invalid_Url {
    return Intl.message(
      'Invalid url',
      name: 'invalid_Url',
      desc: '',
      args: [],
    );
  }

  /// `Result Text type is not Url to navigate`
  String get result_Text_Type_Is_Not_Url_To_Navigate {
    return Intl.message(
      'Result Text type is not Url to navigate',
      name: 'result_Text_Type_Is_Not_Url_To_Navigate',
      desc: '',
      args: [],
    );
  }

  /// `Copied`
  String get copied {
    return Intl.message(
      'Copied',
      name: 'copied',
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

  /// `Local Storage Permission is Required`
  String get local_Permission_Alert {
    return Intl.message(
      'Local Storage Permission is Required',
      name: 'local_Permission_Alert',
      desc: '',
      args: [],
    );
  }

  /// `Allow access to local storage to enable this feature or you can follow the following steps to use the application without permission:\n1- Capture the QR Code image via your camera application or select a local image from your local files.\n2- Share the image to TecnoCode application.\n3- The result will be displayed directly in the TecnoCode application.`
  String get local_Alert_Description {
    return Intl.message(
      'Allow access to local storage to enable this feature or you can follow the following steps to use the application without permission:\n1- Capture the QR Code image via your camera application or select a local image from your local files.\n2- Share the image to TecnoCode application.\n3- The result will be displayed directly in the TecnoCode application.',
      name: 'local_Alert_Description',
      desc: '',
      args: [],
    );
  }

  /// `Camera Permission is Required`
  String get camera_Permission_Alert {
    return Intl.message(
      'Camera Permission is Required',
      name: 'camera_Permission_Alert',
      desc: '',
      args: [],
    );
  }

  /// `Allow access to camera to enable this feature or you can follow the following steps to use the application without permission:\n1- Capture the QR Code image via your camera application or select a local image from your local files.\n2- Share the image to TecnoCode application.\n3- The result will be displayed directly in the TecnoCode application.`
  String get camera_Alert_Description {
    return Intl.message(
      'Allow access to camera to enable this feature or you can follow the following steps to use the application without permission:\n1- Capture the QR Code image via your camera application or select a local image from your local files.\n2- Share the image to TecnoCode application.\n3- The result will be displayed directly in the TecnoCode application.',
      name: 'camera_Alert_Description',
      desc: '',
      args: [],
    );
  }

  /// `Grant Access`
  String get grant_Access {
    return Intl.message(
      'Grant Access',
      name: 'grant_Access',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `By installing or using this application you are accepting the `
  String get privacy_Policy_Confirmation {
    return Intl.message(
      'By installing or using this application you are accepting the ',
      name: 'privacy_Policy_Confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get camera_Permission_Cancel_Message_Button {
    return Intl.message(
      'Continue',
      name: 'camera_Permission_Cancel_Message_Button',
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
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ms'),
      Locale.fromSubtags(languageCode: 'nl'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'tr'),
      Locale.fromSubtags(languageCode: 'ur'),
      Locale.fromSubtags(languageCode: 'zh'),
      Locale.fromSubtags(languageCode: 'zh'),
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
