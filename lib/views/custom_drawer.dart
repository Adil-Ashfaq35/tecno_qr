import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:share_plus/share_plus.dart';
import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/views/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/const_settings.dart';
import '../constants/utils/apptheme.dart';
import '../core/router/router_generator.dart';
import '../models/language/lnaguage_constant.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  bool visible = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
  }
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to exit this App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              exit(0);
         }, // <-- SEE HERE
            child: const Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }
  @override
  Widget build(BuildContext context) {
    Widget _buildDrawer() => Drawer(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 28, 92, 146),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: 1.sh,
              padding: EdgeInsets.symmetric(
                horizontal: 20.sp,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 0.12.sh,
                      ),
                      Menuitem(
                        callback: () {
                          navigationController
                              .getOffAll(RouteGenerator.customDrawer);
                        },
                        title: translation(context).home,
                        iconData: Icons.home,
                      ),
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      Menuitem(
                        callback: () {
                          navigationController
                              .navigateToNamed(RouteGenerator.historyScreen);
                        },
                        title:  translation(context).history,
                        iconData: Icons.history,
                      ),
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      Menuitem(
                        callback: () {
                          navigationController
                              .navigateToNamed(RouteGenerator.languagePage);
                        },
                        title: translation(context).language,
                        iconData: Icons.language,
                      ),
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      Menuitem(
                        callback: () async {
                          //    PackageInfo info = await getVersion();
                          Share.share(
                              'Let me recommend you this Application: https://play.google.com/store/apps/details?id=com.geeklone.toonapp',
                              subject: 'Sharing App');
                        },
                        title: translation(context).share_App,
                        iconData: Icons.share,
                      ),
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      Menuitem(
                          callback: () async {
                            //    PackageInfo info = await getVersion();
                            launchUrl(Uri.parse(ConstantSettings.helpUrl));
                          },
                          title:  translation(context).privacy_Policy,
                          iconData: Icons.privacy_tip),
                      SizedBox(
                        height: 0.05.sh,
                      ),

                      Menuitem(
                        callback: () async {
                          //    PackageInfo info = await getVersion();
                            launchUrl(Uri.parse(ConstantSettings.helpUrl));
                        },
                        title: translation(context).help,
                        iconData: Icons.help,
                      ),
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      Menuitem(
                          callback: () {
                            navigationController
                                .navigateToNamed(RouteGenerator.aboutScreen);
                          },
                          title:  translation(context).about,
                          iconData: Icons.person),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );

    Widget _buildHome() => WillPopScope(
      onWillPop:_onWillPop,
      child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.25),
              spreadRadius: 10,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ], borderRadius: BorderRadius.circular(25.r)),
          child: HomeScreen(
            animation: toggleAnimation,
          )),
    );
    return ScreenUtilInit(
      builder: (context, widget) => Scaffold(
        backgroundColor: AppTheme.lightBackgroundColor,
        // body: Center(child: Text(),),
        body: AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {
              double slide = 200.0 * animationController.value;
              double scale = 1 - (animationController.value * 0.15);
              return Stack(
                children: [
                  _buildDrawer(),
                  Transform(
                      transform: Matrix4.identity()
                        ..translate(slide)
                        ..scale(scale),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        child: _buildHome(),
                        onTap: () {
                          //  animationController.reverse();
                        },
                        onPanUpdate: (details) {
                          // if (details.delta.dx < 0) {
                          //   animationController.reverse();
                          // }
                        },
                      )),
                ],
              );
            }),
      ),
    );
  }

  void toggleAnimation() {
    animationController.isDismissed
        ? animationController.forward()
        : animationController.reverse();
  }
}

class Menuitem extends StatelessWidget {
  const Menuitem({
    Key? key,
    required this.title,
    required this.callback,
    required this.iconData,
  }) : super(key: key);
  final String title;
  final VoidCallback callback;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        callback();
      },
      child: Row(
        //   mainAxisAlignment: MainAxisAlignment.s,
        children: [
          Padding(
            padding:  EdgeInsets.only(right: 8.sm,),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 160.sm, //color: Colors.white,
            child: Text(
              title,
              overflow: TextOverflow.clip,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: Colors.white, fontSize: 16.sp),
            ),
          )
        ],
      ),
    );
  }
}
