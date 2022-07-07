
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:technoapp_qr/models/qr_model.dart';

part 'imagesqr_model.freezed.dart';

@freezed
abstract class QrImage with _$QrImage{
  const factory QrImage({
    required String imageName,

bool ? isExpanded,

  }) = _QrImage;
}