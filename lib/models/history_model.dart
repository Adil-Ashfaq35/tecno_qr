
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:technoapp_qr/models/qr_model.dart';

part 'history_model.freezed.dart';

@freezed
abstract class HistoryModel with _$HistoryModel{
  const factory HistoryModel({
    required String title,
   required  List<QRModel> qrsList, 
  }) = _HistoryModel;
}

 