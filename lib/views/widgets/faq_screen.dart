
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/controllers.dart';
import '../../constants/utils/apptheme.dart';


class FAQPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FAQPageState();
  }
}

class FAQPageState extends State<FAQPage> {
  bool isExpand = false;


  @override
  void initState() {

    super.initState();
    isExpand = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              navigationController.goBack();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 18.sp,
              color: Colors.black,
            )),
        title: Text("FAQ'S",
            style: Theme.of(context).textTheme.headline6?.copyWith(
              fontSize: 15.sm,
              color: AppTheme.darkTextColor,
              fontWeight: FontWeight.w700,
            )),
        centerTitle: true,
      ),
      body:  ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset:const  Offset(1.0, 1.0),
                          spreadRadius: 0.2)
                    ]),
                    child: Card(
                      elevation: 0,
                      shadowColor: Colors.grey,
                      margin: const EdgeInsets.only(
                        bottom: 3,
                      ),
                      child: ExpansionTile(
                          key: Key(index.toString()),
                          backgroundColor: const Color(0xfff6f7f9),
                          initiallyExpanded: true,
                          iconColor: Colors.grey,
                          title: const Text(
                            'Question No ',
                            style: TextStyle(
                                color: Color(0xFF444444),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          onExpansionChanged: ((newState) {
                            // isExpand = newState;
                            // print(newState);
                            // if (newState)
                            //   setState(() {
                            //     Duration(seconds: 20000);
                            //     selected = index;
                            //     // isExpand=newState;
                            //   });
                            // else
                            //   setState(() {
                            //     selected = -1;
                            //     // isExpand=newState;
                            //   });
                            // print(selected);
                          }),
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10, left: 17, right: 17),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                        style: TextStyle(
                                          color: Color(0xFF444444),
                                          fontSize: 13,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ))
                          ]),
                    ),
                  ),
                ]);
              }),
    );
  }
}
