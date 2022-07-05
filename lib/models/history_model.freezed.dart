// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoryModel {
  String get title => throw _privateConstructorUsedError;
  List<QRModel> get qrsList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryModelCopyWith<HistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryModelCopyWith<$Res> {
  factory $HistoryModelCopyWith(
          HistoryModel value, $Res Function(HistoryModel) then) =
      _$HistoryModelCopyWithImpl<$Res>;
  $Res call({String title, List<QRModel> qrsList});
}

/// @nodoc
class _$HistoryModelCopyWithImpl<$Res> implements $HistoryModelCopyWith<$Res> {
  _$HistoryModelCopyWithImpl(this._value, this._then);

  final HistoryModel _value;
  // ignore: unused_field
  final $Res Function(HistoryModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? qrsList = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      qrsList: qrsList == freezed
          ? _value.qrsList
          : qrsList // ignore: cast_nullable_to_non_nullable
              as List<QRModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_HistoryModelCopyWith<$Res>
    implements $HistoryModelCopyWith<$Res> {
  factory _$$_HistoryModelCopyWith(
          _$_HistoryModel value, $Res Function(_$_HistoryModel) then) =
      __$$_HistoryModelCopyWithImpl<$Res>;
  @override
  $Res call({String title, List<QRModel> qrsList});
}

/// @nodoc
class __$$_HistoryModelCopyWithImpl<$Res>
    extends _$HistoryModelCopyWithImpl<$Res>
    implements _$$_HistoryModelCopyWith<$Res> {
  __$$_HistoryModelCopyWithImpl(
      _$_HistoryModel _value, $Res Function(_$_HistoryModel) _then)
      : super(_value, (v) => _then(v as _$_HistoryModel));

  @override
  _$_HistoryModel get _value => super._value as _$_HistoryModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? qrsList = freezed,
  }) {
    return _then(_$_HistoryModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      qrsList: qrsList == freezed
          ? _value._qrsList
          : qrsList // ignore: cast_nullable_to_non_nullable
              as List<QRModel>,
    ));
  }
}

/// @nodoc

class _$_HistoryModel implements _HistoryModel {
  const _$_HistoryModel(
      {required this.title, required final List<QRModel> qrsList})
      : _qrsList = qrsList;

  @override
  final String title;
  final List<QRModel> _qrsList;
  @override
  List<QRModel> get qrsList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_qrsList);
  }

  @override
  String toString() {
    return 'HistoryModel(title: $title, qrsList: $qrsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryModel &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other._qrsList, _qrsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(_qrsList));

  @JsonKey(ignore: true)
  @override
  _$$_HistoryModelCopyWith<_$_HistoryModel> get copyWith =>
      __$$_HistoryModelCopyWithImpl<_$_HistoryModel>(this, _$identity);
}

abstract class _HistoryModel implements HistoryModel {
  const factory _HistoryModel(
      {required final String title,
      required final List<QRModel> qrsList}) = _$_HistoryModel;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  List<QRModel> get qrsList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryModelCopyWith<_$_HistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
