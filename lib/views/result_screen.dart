
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';
import 'package:technoapp_qr/models/language/lnaguage_constant.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';
import 'package:technoapp_qr/views/widgets/options_widget.dart';
import '../constants/utils/apptheme.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {

        navigationController.getOffAll(RouteGenerator.customDrawer);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBarWidget(
            title: translation(context).result_Screen,
            iconButton: IconButton(
                onPressed: () {
                  navigationController. flowFromhistory.value?
                   navigationController.goBack():
                  navigationController.getOffAll(RouteGenerator.customDrawer);
                },
                icon: const Icon(Icons.arrow_back))),
        body: Container(
          decoration: const BoxDecoration(color: AppTheme.lightBackgroundColor),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${translation(context).result_Language_Label}${translation(context).text}",
                    style: const TextStyle(
                        color: Color.fromARGB(115, 33, 33, 33),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              const   Expanded(
                  flex: 1,
                  child: Resultbox(),
                ),
                Column(
                  children: [
                    OptionsWidget(
                        icon: Icons.link,
                        optionText: translation(context).navigate_Button_Text,
                        onTap: () {
                          bool _validURL =
                              Uri.parse(resultController.resultText.value)
                                  .isAbsolute;
                          _validURL
                              ? resultController.navigatetoLink()
                              : Get.snackbar(
                                  translation(context).invalid_Url,
                                  translation(context).result_Text_Type_Is_Not_Url_To_Navigate,
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppTheme.errorColor,
                                  colorText: Colors.white,
                                );
                        }),
                    OptionsWidget(
                        icon: Icons.share,
                        optionText: translation(context).share_Button_Text,
                        onTap: () {
                          Share.share(
                              'Here is the Qr Result text:${resultController.resultText.value}');
                        }),
                    OptionsWidget(
                        icon: Icons.copy,
                        optionText: translation(context).copy_Button_Text,
                        onTap: () {
                          Clipboard.setData(ClipboardData(
                                  text: resultController.resultText.value))
                              .then((value) => ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      duration:
                                          const Duration(microseconds: 1500),
                                      backgroundColor: Colors.greenAccent,
                                      content: Text(
                                          '${resultController.resultText.value}  ${translation(context).copied}'))));
                        })
                  ],
                )
              ]),
        ),
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
      padding: EdgeInsets.all(20.sm),
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
      child: SingleChildScrollView(
        child: Text(
          resultController.resultText.value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
