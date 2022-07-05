// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/constants/utils/apptheme.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';

import '../models/qr_model.dart';

class HistoryScreen extends StatefulWidget {
  ScrollController _scrollController = ScrollController();

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final ScrollController _scrollController = ScrollController();

  bool? get kDebugMode => null;
  @override
  void initState() {
    super.initState();
    historyController.getItem();
  }

  List<String> options = ['Scan History', 'Read History', 'Generate History'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
          title: 'History screen',
          iconButton: IconButton(
              onPressed: () {
                navigationController.goBack();
              },
              icon: const Icon(Icons.arrow_back))),
      body: Container(
        // color: Colors.black,

        padding: EdgeInsets.symmetric(
          horizontal: 15.sp,
        ),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                  height: 0.76.sh,
                  child: RefreshIndicator(
                    onRefresh: () async {},
                    child: CustomScrollView(
                        physics: BouncingScrollPhysics(),
                        controller: _scrollController,
                        // scrollDirection: Axis.vertical,
                        // shrinkWrap: true,
                        slivers: [
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int typeindex) {
                              return CustomScrollView(
                                  controller: _scrollController,
                                  shrinkWrap: true,
                                  slivers: [
                                    SliverToBoxAdapter(
                                      child: Card(
                                        elevation: 0,
                                        color: AppTheme.lightBackgroundColor,
                                        child: ExpansionTile(
                                          backgroundColor: Colors.white,
                                          title: ListTile(
                                            title: Align(
                                              alignment:
                                                  Alignment(-1.0.sp, 0.sp),
                                              child: Text(
                                                historyController
                                                    .qrHistory[typeindex].title,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15.sp,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          children: [
                                            ExpansionPanelhistory(
                                                qrslist: historyController
                                                    .qrHistory[typeindex]
                                                    .qrsList)
                                          ],
                                        ),
                                      ),
                                    )
                                  ]);
                            },
                            childCount: historyController.qrHistory.length,
                          )),
                        ]),
                  )),
            ])),

            //           ],
            //         )
            //     ),
            //   ],
            // ),

            // ),
          ],
        ),
      ),
    );
  }
}

class ExpansionPanelhistory extends StatefulWidget {
  const ExpansionPanelhistory({Key? key, required this.qrslist})
      : super(key: key);
  final List<QRModel> qrslist;
  @override
  // ignore: library_private_types_in_public_api
  _ExpansionPanelhistoryState createState() => _ExpansionPanelhistoryState();
}

class _ExpansionPanelhistoryState extends State<ExpansionPanelhistory> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
        historyController.images.length,
      // widget.qrslist.length,
      itemBuilder: (BuildContext context, int index) {
        return  Image.file(File(historyController.images[index]));
        
        
        
      //    Obx(
      //     () => ExpansionPanelList(
      //       animationDuration: Duration(milliseconds: 1000),
      //       dividerColor: Colors.red,
      //       elevation: 1,
      //       children: [
      //         ExpansionPanel(
      //           body: Container(
      //             padding: EdgeInsets.all(10),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: <Widget>[
      //                 Text(
      //                   widget.qrslist[index].qrData,
      //                   style: TextStyle(
      //                       color: Colors.grey[700],
      //                       fontSize: 15,
      //                       letterSpacing: 0.3,
      //                       height: 1.3),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           isExpanded: widget.qrslist[index].isExpanded,
      //           headerBuilder: (BuildContext context, bool isExpanded) {
      //             return Container(
      //               padding: const EdgeInsets.all(10),
      //               child: Text(
      //                 widget.qrslist[index].dateTime.toString(),
      //                 style: const TextStyle(
      //                   color: AppTheme.primaryColor,
      //                   fontSize: 18,
      //                 ),
      //               ),
      //             );
      //           },
      //         )
      //       ],
      //       expansionCallback: (int item, bool status) {
      //         widget.qrslist[index].isExpanded =
      //             !widget.qrslist[index].isExpanded;
      //       },
      //     ),
      //   );
     },
    );
  }
}
