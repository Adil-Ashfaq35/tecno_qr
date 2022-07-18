import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';
import 'package:technoapp_qr/views/home_screen.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';
import 'package:technoapp_qr/views/widgets/options_widget.dart';
import '../constants/utils/apptheme.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Result Screen',
          iconButton: IconButton(
              onPressed: () {
                navigationController.getOffAll(RouteGenerator.customDrawer);
              },
              icon: const Icon(Icons.arrow_back))),
      body: Container(
        decoration: const BoxDecoration(color: AppTheme.lightBackgroundColor),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Result Text',
                  style: TextStyle(
                      color: Color.fromARGB(115, 33, 33, 33),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Expanded(
                flex: 1,
                child: Resultbox(),
              ),
              Column(
                children: [
                  OptionsWidget(
                      icon: Icons.link,
                      optionText: 'Navigate',
                      onTap: () {
                        bool _validURL =
                            Uri.parse(resultController.resultText.value)
                                .isAbsolute;
                        _validURL
                            ? resultController.navigatetoLink()
                            : ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    duration: Duration(seconds: 2),
                                    backgroundColor:
                                        Color.fromARGB(255, 186, 88, 98),
                                    content: Text(
                                        'Result Text type is not Url to navigate')),
                              );
                      }),
                  OptionsWidget(
                      icon: Icons.share,
                      optionText: 'Share',
                      onTap: () {
                        Share.share(
                            'Here is the Qr Result text:${resultController.resultText.value}');
                      }),
                  OptionsWidget(
                      icon: Icons.copy,
                      optionText: 'Copy',
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                                text: resultController.resultText.value))
                            .then((value) => ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                    duration: const Duration(microseconds: 1500),
                                    backgroundColor: Colors.greenAccent,
                                    content: Text(
                                        '${resultController.resultText.value} got Copied'))));
                      })
                ],
              )
            ]),
      ),
    );
  }
}

// ignore: camel_case_types
class Resultbox extends StatelessWidget {
  const Resultbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.25),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10.r)),
      child: Center(
        child: Text(
          resultController.resultText.value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
