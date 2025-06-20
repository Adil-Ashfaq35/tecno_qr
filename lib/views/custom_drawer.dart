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
  Future<bool> onWillPop() async {

    return (await
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text(translation(context).are_You_Sure),
        content:  Text(translation(context).do_You_Want_To_Exit_This_Application),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
            child:  Text(translation(context).no),
          ),
          TextButton(
            onPressed: () {
              exit(0);
            }, // <-- SEE HERE
            child:  Text(translation(context).yes),
          ),
        ],
      ),
    )) ??
        false;
  }
  @override
  Widget build(BuildContext context) {

    Widget _buildDrawer() => OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return  Drawer(
          elevation: 0,
          backgroundColor: Colors.blueGrey.shade100,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
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
                        orientation: orientation,
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
                        orientation: orientation,
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
                        orientation: orientation,
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
                        orientation: orientation,
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
                          iconData: Icons.privacy_tip,
                        orientation: orientation,
                      ),

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
                        orientation: orientation,
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
                          iconData: Icons.person,
                        orientation: orientation,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );

      },

    );

    Widget _buildHome() => WillPopScope(
      onWillPop:onWillPop,
      child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.25),
              spreadRadius: 10,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ], borderRadius: BorderRadius.circular(25.r)),
          child: OrientationBuilder(

            builder: (BuildContext context, Orientation orientation) {
              return  HomeScreen(
                animation: toggleAnimation, orientation: orientation,
              );
            },

          )),
    );
    return ScreenUtilInit(
      builder: (context, widget) => Scaffold(
        backgroundColor: AppTheme.lightBackgroundColor,
        // body: Center(child: Text(),),
        body: AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {

              double slide = behaviourController.IsLtr.value? 200.0 * animationController.value: 1- (200.0 * animationController.value);
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
    required this.iconData, required this.orientation,

  }) : super(key: key);
  final String title;
  final VoidCallback callback;
  final IconData iconData;
  final Orientation orientation;
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
              color: AppTheme.primaryColor,
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
                  ?.copyWith( color: AppTheme.primaryColor, fontSize: orientation == Orientation.portrait ? 16.sp:10.sp,
                  fontWeight: FontWeight.w700
              ),
            ),
          )
        ],
      ),
    );
  }
}
