// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that looks up messages for specific locales by
// delegating to the appropriate library.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:implementation_imports, file_names, unnecessary_new
// ignore_for_file:unnecessary_brace_in_string_interps, directives_ordering
// ignore_for_file:argument_type_not_assignable, invalid_assignment
// ignore_for_file:prefer_single_quotes, prefer_generic_function_type_aliases
// ignore_for_file:comment_references

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
import 'package:intl/src/intl_helpers.dart';

import 'messages_ar.dart' as messages_ar;
import 'messages_de.dart' as messages_de;
import 'messages_en.dart' as messages_en;
import 'messages_es.dart' as messages_es;
import 'messages_fr.dart' as messages_fr;
import 'messages_id.dart' as messages_id;
import 'messages_it.dart' as messages_it;
import 'messages_ms.dart' as messages_ms;
import 'messages_nl.dart' as messages_nl;
import 'messages_ru.dart' as messages_ru;
import 'messages_tr.dart' as messages_tr;
import 'messages_ur.dart' as messages_ur;
import 'messages_zh.dart' as messages_zh;
import 'messages_zh_tw.dart' as messages_zh_tw;

typedef Future<dynamic> LibraryLoader();
Map<String, LibraryLoader> _deferredLibraries = {
  'ar': () => new Future.value(null),
  'de': () => new Future.value(null),
  'en': () => new Future.value(null),
  'es': () => new Future.value(null),
  'fr': () => new Future.value(null),
  'id': () => new Future.value(null),
  'it': () => new Future.value(null),
  'ms': () => new Future.value(null),
  'nl': () => new Future.value(null),
  'ru': () => new Future.value(null),
  'tr': () => new Future.value(null),
  'ur': () => new Future.value(null),
  'zh': () => new Future.value(null),
  'zh_TW': () => new Future.value(null),
};

MessageLookupByLibrary? _findExact(String localeName) {
  switch (localeName) {
    case 'ar':
      return messages_ar.messages;
    case 'de':
      return messages_de.messages;
    case 'en':
      return messages_en.messages;
    case 'es':
      return messages_es.messages;
    case 'fr':
      return messages_fr.messages;
    case 'id':
      return messages_id.messages;
    case 'it':
      return messages_it.messages;
    case 'ms':
      return messages_ms.messages;
    case 'nl':
      return messages_nl.messages;
    case 'ru':
      return messages_ru.messages;
    case 'tr':
      return messages_tr.messages;
    case 'ur':
      return messages_ur.messages;
    case 'zh':
      return messages_zh.messages;
    case 'zh_TW':
      return messages_zh_tw.messages;
    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) async {
  var availableLocale = Intl.verifiedLocale(
      localeName, (locale) => _deferredLibraries[locale] != null,
      onFailure: (_) => null);
  if (availableLocale == null) {
    return new Future.value(false);
  }
  var lib = _deferredLibraries[availableLocale];
  await (lib == null ? new Future.value(false) : lib());
  initializeInternalMessageLookup(() => new CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);
  return new Future.value(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

MessageLookupByLibrary? _findGeneratedMessagesFor(String locale) {
  var actualLocale =
      Intl.verifiedLocale(locale, _messagesExistFor, onFailure: (_) => null);
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}
