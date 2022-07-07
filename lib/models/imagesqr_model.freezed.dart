// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'imagesqr_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QrImage {
  String get imageName => throw _privateConstructorUsedError;
  bool? get isExpanded => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QrImageCopyWith<QrImage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrImageCopyWith<$Res> {
  factory $QrImageCopyWith(QrImage value, $Res Function(QrImage) then) =
      _$QrImageCopyWithImpl<$Res>;
  $Res call({String imageName, bool? isExpanded});
}

/// @nodoc
class _$QrImageCopyWithImpl<$Res> implements $QrImageCopyWith<$Res> {
  _$QrImageCopyWithImpl(this._value, this._then);

  final QrImage _value;
  // ignore: unused_field
  final $Res Function(QrImage) _then;

  @override
  $Res call({
    Object? imageName = freezed,
    Object? isExpanded = freezed,
  }) {
    return _then(_value.copyWith(
      imageName: imageName == freezed
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
      isExpanded: isExpanded == freezed
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_QrImageCopyWith<$Res> implements $QrImageCopyWith<$Res> {
  factory _$$_QrImageCopyWith(
          _$_QrImage value, $Res Function(_$_QrImage) then) =
      __$$_QrImageCopyWithImpl<$Res>;
  @override
  $Res call({String imageName, bool? isExpanded});
}

/// @nodoc
class __$$_QrImageCopyWithImpl<$Res> extends _$QrImageCopyWithImpl<$Res>
    implements _$$_QrImageCopyWith<$Res> {
  __$$_QrImageCopyWithImpl(_$_QrImage _value, $Res Function(_$_QrImage) _then)
      : super(_value, (v) => _then(v as _$_QrImage));

  @override
  _$_QrImage get _value => super._value as _$_QrImage;

  @override
  $Res call({
    Object? imageName = freezed,
    Object? isExpanded = freezed,
  }) {
    return _then(_$_QrImage(
      imageName: imageName == freezed
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
      isExpanded: isExpanded == freezed
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_QrImage implements _QrImage {
  const _$_QrImage({required this.imageName, this.isExpanded});

  @override
  final String imageName;
  @override
  final bool? isExpanded;

  @override
  String toString() {
    return 'QrImage(imageName: $imageName, isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QrImage &&
            const DeepCollectionEquality().equals(other.imageName, imageName) &&
            const DeepCollectionEquality()
                .equals(other.isExpanded, isExpanded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imageName),
      const DeepCollectionEquality().hash(isExpanded));

  @JsonKey(ignore: true)
  @override
  _$$_QrImageCopyWith<_$_QrImage> get copyWith =>
      __$$_QrImageCopyWithImpl<_$_QrImage>(this, _$identity);
}

abstract class _QrImage implements QrImage {
  const factory _QrImage(
      {required final String imageName, final bool? isExpanded}) = _$_QrImage;

  @override
  String get imageName => throw _privateConstructorUsedError;
  @override
  bool? get isExpanded => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_QrImageCopyWith<_$_QrImage> get copyWith =>
      throw _privateConstructorUsedError;
}
