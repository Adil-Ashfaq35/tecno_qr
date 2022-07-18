import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import 'package:share_plus/share_plus.dart';
import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/views/home_screen.dart';

import '../constants/utils/apptheme.dart';
import '../core/router/router_generator.dart';

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
                        title: 'Home',
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
                        title: 'History',
                        iconData: Icons.history,
                      ),
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      Menuitem(
                        callback: () {},
                        title: 'Language',
                        iconData: Icons.language,
                      ),
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      Menuitem(
                          callback: () {
                            navigationController
                                .navigateToNamed(RouteGenerator.faqPage);
                          },
                          title: 'FAQ',
                          iconData: Icons.question_answer),
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
                        title: 'Share App',
                        iconData: Icons.share,
                      ),
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      Menuitem(
                          callback: () async {
                            //    PackageInfo info = await getVersion();
                            navigationController
                                .navigateToNamed(RouteGenerator.policyScreen);
                          },
                          title: 'Privacy Policy',
                          iconData: Icons.privacy_tip),
                      SizedBox(
                        height: 0.05.sh,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );

    Widget _buildHome() => Container(
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
        ));
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
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline2
                ?.copyWith(color: Colors.white, fontSize: 16.sp),
          )
        ],
      ),
    );
  }
}
