import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';
import 'package:technoapp_qr/models/language/lnaguage_constant.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';
import 'package:technoapp_qr/views/widgets/options_widget.dart';
import '../constants/utils/apptheme.dart';

class EnterText extends StatelessWidget {
  final TextEditingController _inputController = TextEditingController();
  EnterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarWidget(
          title: translation(context).enter_Qr,
          iconButton: IconButton(
              onPressed: () {
                navigationController.goBack();
              },
              icon: const Icon(Icons.arrow_back))),
      body: Container(
        decoration: const BoxDecoration(color: AppTheme.lightBackgroundColor),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  translation(context).text,
                  style: const TextStyle(
                      color: Color.fromARGB(115, 33, 33, 33),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              TextField(
                inputController: _inputController,
              ),
              Column(
                children: [
                  OptionsWidget(
                      icon: Icons.qr_code,
                      optionText: translation(context).generate_Button_Text,
                      onTap: () {
                        if (_inputController.text.isNotEmpty) {
                          qrProvider.setTexttogenerate(_inputController.text);
                          navigationController.flowFromhistory.value = false;
                          navigationController
                              .navigateToNamed(RouteGenerator.createQr);
                        }
                      }),
                  OptionsWidget(
                      icon: Icons.paste,
                      optionText: translation(context).paste,
                      onTap: () async {
                        _inputController.text = (await _getClipboardText())!;
                      }),
                ],
              )
            ]),
      ),
    );
  }

  Future<String?> _getClipboardText() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    String? clipboardText = clipboardData?.text;
    return clipboardText;
  }
}

// ignore: camel_case_types
class TextField extends StatelessWidget {
  const TextField({
    Key? key,
    required this.inputController,
  }) : super(key: key);
  final TextEditingController inputController;
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
            child: Form(
                autovalidateMode: AutovalidateMode.always,
                onChanged: () {
                  Form.of(primaryFocus!.context!)!.save();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight( Size(400.sm, 400.sm)),
                    child: Expanded(
                      child: TextFormField(
                        controller: inputController,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Write text here...'),
                        keyboardType: TextInputType.multiline,
                        onSaved: (String? value) {
                          debugPrint('Value for field  saved as "$value"');
                        },
                        maxLines: 20,
                      ),
                    ),
                  ),
                ))));
  }
}
