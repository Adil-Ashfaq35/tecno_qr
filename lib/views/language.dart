import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';
import 'package:technoapp_qr/models/language/lnaguage_constant.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';
import '../constants/controllers.dart';
import '../main.dart';
import '../models/language/language_model.dart';


class LanguagePage extends StatefulWidget {
  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  LanguageModel ?language;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(60.sm),
        child: AppBarWidget(
            title: '${AppLocalizations.of(context)?.language}',
            iconButton: IconButton(
                onPressed: () {
                  navigationController.getOffAll(RouteGenerator.customDrawer);
                },
                icon: const Icon(Icons.arrow_back))),
      ),
      body: OrientationBuilder(builder: (BuildContext context, Orientation orientation) {
        return  Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(12.sm),
              child: SingleChildScrollView(
                child: SizedBox(
                  height:orientation==Orientation.portrait? 0.86.sh:0.7.sh,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: LanguageModel.languageList().length,
                      itemBuilder:(context,index){
                        return ListTile(
                            leading: Text(LanguageModel.languageList()[index].flag),
                            title: Text(LanguageModel.languageList()[index].name,style: Theme.of(context).textTheme.headline2?.copyWith(
                              fontSize: 20.sm,
                            ),),
                            onTap: () async {
                              Locale locale =await setLocale(LanguageModel.languageList()[index].languageCode);

                              setState(() {
                                MyApp.setLocale(context, locale);
                              });
                              if (kDebugMode) {
                                print(LanguageModel.languageList()[index].languageCode);
                              }
                            }
                        );
                      }

                  ),
                ),
              ),
            ),

          ],


        );
      },

      ),

    );
  }
}
