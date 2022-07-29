import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technoapp_qr/models/language/lnaguage_constant.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';
import '../constants/controllers.dart';
import '../main.dart';
import '../models/language/language_model.dart';


class LanguagePage extends StatelessWidget {
  LanguageModel ?language;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBarWidget(
          title: '${AppLocalizations.of(context)?.language}',
          iconButton: IconButton(
              onPressed: () {
                navigationController.goBack();
              },
              icon: const Icon(Icons.arrow_back))),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(12.sm),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 0.8.sh,
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
                          MyApp.setLocale(context, locale);
                          MyApp.currentLocale();
                          if (kDebugMode) {
                            print(LanguageModel.languageList()[index].languageCode);
                          }
                          }
                      );
                    }

                ),
              ),
            ),
          )
        ],


      ),

    );
  }
}
