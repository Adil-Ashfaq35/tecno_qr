class QrImage {
  final String imageName;
  bool isExpanded;
  final String qrName;
  final String dateString;

  QrImage(
      {required this.imageName,
      required this.dateString, 
      required this.isExpanded,
      required this.qrName});
}
