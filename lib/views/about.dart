import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
    DateTime Year =DateTime(DateTime.now().year);
    String currentYear =Year.toString().substring(0,4) ;
    int NYear =int.parse(currentYear)+1;

    return OrientationBuilder(

      builder: (BuildContext context, Orientation orientation) {
        return
        Scaffold(
            appBar:  PreferredSize(
              preferredSize: Size.fromHeight(50.sm),
              child: AppBarWidget(
                  title: translation(context).about,
                  iconButton: IconButton(
                      onPressed: () {
                        navigationController.goBack();
                      },
                      icon: const Icon(Icons.arrow_back)),

                orientation: orientation,
              ),
            ),
            body:currentYear=="2022"?
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                SizedBox(
                  height: 0.2.sh,
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text("© 2022",
                            style: Theme.of(context).textTheme.headline1?.copyWith(
                              color: AppTheme.darkTextColor,
                              fontSize: 25.sm,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.sm,
                        ),
                        Text(translation(context).second_Line,
                          style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: AppTheme.darkTextColor,
                            fontSize: 18.sm,
                          ),
                        ),
                        SizedBox(
                          height: 0.2.sh,
                        ),
                        Text("TecnoCode Version :",textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: AppTheme.darkTextColor,
                          fontSize: 20.sm,
                          fontWeight: FontWeight.bold,
                        )),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        Center(
                          child:Text(_packageInfo.version,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color:const Color(0XFF434343),
                            fontSize: 16.sm,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),

                      ],
                    )
                ),
              ],
            ):Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [

                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("© 2022-${NYear.toString()}",
                          style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: AppTheme.darkTextColor,
                            fontSize: 25.sm,
                          ),
                        ),
                        SizedBox(
                          height: 10.sm,
                        ),
                        Text(" ${translation(context).third_Line}",
                          style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: AppTheme.darkTextColor,
                            fontSize: 20.sm,
                          ),
                        ),
                        SizedBox(
                          height: 0.2.sh,
                        ),
                        Text("TecnoCode Version :",textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: AppTheme.darkTextColor,
                          fontSize: 20.sm,
                          fontWeight: FontWeight.bold,
                        )),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        Center(
                          child:Text(_packageInfo.version,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color:const Color(0XFF434343),
                            fontSize: 18.sm,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ],
                    )
                ),


              ],
            )
        );
      },

    );
  }
}
