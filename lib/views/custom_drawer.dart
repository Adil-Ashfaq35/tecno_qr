import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:share_plus/share_plus.dart';
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
          backgroundColor: Color.fromARGB(255, 28, 92, 146),
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
                      InkWell(
                        onTap: () async {
                          // navigationController
                          //     .navigateToNamed(RouteGenerator.myPhotos);
                          //TODO:: Change package name
                          // PackageInfo info = await getVersion();
                          // Share.share(
                          //     'Let me recommend you this Application: https://play.google.com/store/apps/details?id=com.geeklone.quitmustpro',
                          //     subject: 'Sharing App');
                          // // Share.share(
                          // //     'Let me recommend you this Application: https://play.google.com/store/apps/details?id=${info.packageName}',
                          // //     subject: 'Sharing App');
                        },
                        child: Row(
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.only(right: 10.sp),
                            //   child: SizedBox(
                            //     height: 0.055.sh,
                            //     child: Image.asset(
                            //       // ImagePath.myPhotos,
                            //       scale: 1.2,
                            //     ),
                            //   ),
                            // ),
                            Text(
                              "My Photos",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      color: Colors.white, fontSize: 16.sp),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      InkWell(
                        onTap: () async {
                          //    PackageInfo info = await getVersion();
                          Share.share(
                              'Let me recommend you this Application: https://play.google.com/store/apps/details?id=com.geeklone.toonapp',
                              subject: 'Sharing App');
                        },
                        child: Row(
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.only(right: 10.sp),
                            //   child: SizedBox(
                            //     height: 0.055.sh,
                            //     child: Image.asset(
                            //       ImagePath.shareIcon,
                            //       scale: 1.2,
                            //     ),
                            //   ),
                            // ),
                            Text(
                              "Share App",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      color: Colors.white, fontSize: 16.sp),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      InkWell(
                        onTap: () async {
                          // PackageInfo info = await getVersion();
                          // LaunchReview.launch(androidAppId: info.packageName);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10.sp),
                              child: SizedBox(
                                height: 0.055.sh,
                                child: Icon(Icons.star),
                              ),
                            ),
                            Text(
                              "Rate Us",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      color: Colors.white, fontSize: 16.sp),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      InkWell(
                        onTap: () {
                          // navigationController
                          //     .navigateToNamed(RouteGenerator.privacyPolicy);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10.sp),
                              child: SizedBox(
                                  height: 0.055.sh, child: Icon(Icons.policy)),
                            ),
                            Text(
                              "Privacy Policy",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      color: Colors.white, fontSize: 16.sp),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Column(
                  //   children: [
                  //     FutureBuilder(
                  //         future: myFuture,
                  //         builder: (context,
                  //             AsyncSnapshot<PackageInfo> versionNumber) {
                  //           return AnimatedOpacity(
                  //               opacity: visible ? 1.0 : 0.0,
                  //               duration: const Duration(milliseconds: 500),
                  //               child: Text(
                  //                 'App Version ${versionNumber.data?.version}',
                  //                 style: Theme.of(context)
                  //                     .textTheme
                  //                     .headline1
                  //                     ?.copyWith(
                  //                         color: Colors.white, fontSize: 13.sp),
                  //               ));
                  //         }),
                  //     SizedBox(height: 0.1.sh)
                  //   ],
                  // )
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
      builder: (context,widget) => Scaffold(
        backgroundColor:AppTheme.primaryColor,
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
