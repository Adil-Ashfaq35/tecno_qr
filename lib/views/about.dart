import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';

import '../constants/controllers.dart';
import '../constants/utils/apptheme.dart';

import '../models/language/lnaguage_constant.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown', buildNumber: 'Unknown',
  );
  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }
  @override
  void initState() {
    _initPackageInfo();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBarWidget(
          title: translation(context).about,
          iconButton: IconButton(
              onPressed: () {
                navigationController.goBack();
              },
              icon: const Icon(Icons.arrow_back))),
      body: Column(
        children:  [
          SizedBox(
            height: 0.03.sh,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:Column(
              children: [
                Text(translation(context).second_Line,
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                    color: AppTheme.darkTextColor,
                    fontSize: 20.sm,
                  ),
                ),
                Text(translation(context).third_Line,
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                    color: AppTheme.darkTextColor,
                    fontSize: 20.sm,
                  ),
                ),
              ],
            )
          ),
          SizedBox(
            height: 0.04.sh,
          ),
          Center(
         child:Text("TecnoCode Version:  ${_packageInfo.version}",style: Theme.of(context).textTheme.bodyText1?.copyWith(
           color: AppTheme.darkTextColor,
           fontSize: 20.sm,
           fontWeight: FontWeight.bold,
         ),),
       )
        ],
      ),
    );
  }
}
