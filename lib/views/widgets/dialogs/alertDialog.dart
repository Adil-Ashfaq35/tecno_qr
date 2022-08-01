import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/language/lnaguage_constant.dart';

class DialogWidget extends StatelessWidget {
  final VoidCallback cancelTap;
  final VoidCallback continueTap;
  final String title;
  String description;

  DialogWidget(
      {required this.cancelTap,
      required this.continueTap,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {


    return AlertDialog(
      title: Text(title,style: Theme.of(context).textTheme.headline3?.copyWith(
        fontWeight: FontWeight.bold,
      ),),
      content: Text(description,textAlign: TextAlign.start,softWrap: true,style: Theme.of(context).textTheme.headline3?.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 18.sm,
      )),

      actions: [
        TextButton(
        onPressed: cancelTap,
          child:  Text(translation(context).cancel),
        ),
        TextButton(
          onPressed:  continueTap,
          child:  Text(translation(context).grant_Access),
        ),
      ],
    );
  }
}
