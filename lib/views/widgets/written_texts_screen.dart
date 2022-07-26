

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/controllers.dart';
import '../../constants/utils/apptheme.dart';


class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              navigationController.goBack();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 18.sp,
              color: Colors.black,
            )),
        title: Text("Privacy Policy",
            style: Theme.of(context).textTheme.headline6?.copyWith(
              fontSize: 15.sm,
              color: AppTheme.darkTextColor,
              fontWeight: FontWeight.w700,
            )),
        centerTitle: true,
      ),
      body:  Container(
        padding: EdgeInsets.all(20),
        child: Center(child: Text('Sample Data of Privacy Policy ')),
      )
    );
  }
}
