import 'package:hive/hive.dart';

part 'qr_model.g.dart';

@HiveType(typeId: 0)
class QRModel {
  @HiveField(0)
  final String qrData;
  @HiveField(1)
  final DateTime dateTime;
  @HiveField(2)
  final bool iscreate;
  @HiveField(3)
 bool isExpanded=false;

  QRModel(
    this.qrData,
    this.dateTime,
    this.iscreate, this.isExpanded,
  );
}
