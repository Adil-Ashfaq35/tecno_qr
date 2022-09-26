

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';
import 'package:technoapp_qr/models/language/lnaguage_constant.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';
import 'package:technoapp_qr/views/widgets/dialogs/alertDialog.dart';
import 'package:technoapp_qr/views/widgets/options_widget.dart';
import '../constants/utils/apptheme.dart';
import '../main.dart';

class EnterText extends StatelessWidget {
  final TextEditingController _inputController = TextEditingController();
  EnterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(

      builder: (BuildContext context, Orientation orientation) {
        return
        Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.sm),
            child: AppBarWidget(
                title: translation(context).enter_Qr,
                iconButton: IconButton(
                    onPressed: () {
                      navigationController.goBack();
                    },
                    icon: const Icon(Icons.arrow_back)),
            orientation: orientation,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              height:orientation==Orientation.landscape? 1.5.sh:0.9.sh,
              decoration: const BoxDecoration(color: AppTheme.lightBackgroundColor),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
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
                    SizedBox(
                      height: orientation==Orientation.landscape? 0.8.sh:0.4.sh,
                      width:  orientation==Orientation.landscape?0.8.sw:null,
                      child: TextField(
                        inputController: _inputController,
                      ),
                    ),
                    SizedBox(
                       height:orientation==Orientation.landscape? 0.49.sh:null,
                      child: Column(
                        children: [
                          OptionsWidget(
                              icon: Icons.qr_code,
                              optionText: translation(context).generate_Button_Text,
                              onTap: () async {
                                PermissionStatus status=  await Permission.storage.request();
                                if(status.isDenied){
                                  await showDialog(context: context, builder: (context){
                                    return DialogWidget(
                                      title: translation(context).local_Permission_Alert,
                                      description: translation(context).local_Alert_Description,
                                      cancelTap: (){
                                        navigationController.goBack();
                                      },
                                      continueTap: () async {
                                        navigationController.goBack();
                                        await openAppSettings(
                                        );
                                        navigationController.getOffAll(homeRoute);
                                      },
                                    );
                                  });
                                }
                                else if(status.isPermanentlyDenied){
                                  await showDialog(context: context, builder: (context){
                                    return DialogWidget(
                                      title: translation(context).local_Permission_Alert,
                                      description: translation(context).local_Alert_Description,
                                      cancelTap: (){
                                        navigationController.goBack();
                                      },
                                      continueTap: () async {
                                        navigationController.goBack();
                                        await openAppSettings(
                                        );
                                        navigationController.getOffAll(RouteGenerator.customDrawer);
                                      },
                                    );
                                  });
                                }
                                else if(status.isGranted){
                                  if (_inputController.text.isNotEmpty) {
                                    qrProvider.setTexttogenerate(_inputController.text);
                                    navigationController.flowFromhistory.value = false;
                                    navigationController
                                        .navigateToNamed(RouteGenerator.createQr);
                                  }
                                }
                              },
                          orientation: orientation,
                          ),
                          OptionsWidget(
                              icon: Icons.paste,
                              optionText: translation(context).paste,
                              onTap: () async {
                                _inputController.text = (await _getClipboardText())!;
                              },
                          orientation: orientation,
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        );
      },

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
                  padding: const EdgeInsets.all(5.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight( Size(400.sm, 400.sm)),
                    child: SingleChildScrollView(
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
