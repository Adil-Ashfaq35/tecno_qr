// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/constants/utils/apptheme.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';
import 'package:technoapp_qr/models/imagesqr_model.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';
import 'package:path/path.dart';
import '../models/language/lnaguage_constant.dart';
import '../models/qr_model.dart';

// ignore: must_be_immutable
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
    qrProvider.getQrs();
    historyController.getItem();
    historyController.getimageformLocal();
  }

  //List<String> options = ['Scan History', 'Read History', 'Generate History'];
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
                  height: 0.90.sh,
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
                              return HistoryScroll(
                                scrollController: _scrollController,
                                index: typeindex,
                                title: historyController
                                    .qrHistory[typeindex].title,
                                children: ExpansionPanelhistory(
                                  qrslist: historyController
                                      .qrHistory[typeindex].qrsList,
                                  images: historyController.images,
                                  isQRCreated: false,
                                ),
                              );
                            },
                            childCount: historyController.qrHistory.length,
                          )),
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int typeindex) {
                            return HistoryScroll(
                              scrollController: _scrollController,
                              index: typeindex,
                              title: translation(context).generate_Button_Text,
                              children: ExpansionPanelhistory(
                                qrslist: historyController
                                    .qrHistory[typeindex].qrsList,
                                images: historyController.images,
                                isQRCreated: true,
                              ),
                            );
                          }, childCount: 1)),
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

class HistoryScroll extends StatelessWidget {
  const HistoryScroll({
    Key? key,
    required ScrollController scrollController,
    required this.index,
    required this.children,
    required this.title,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;
  final int index;
  final Widget children;
  final String title;
  @override
  Widget build(BuildContext context) {
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
                    alignment: Alignment(-1.0.sp, 0.sp),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                    ),
                  ),
                ),
                children: [children],
              ),
            ),
          )
        ]);
  }
}

class ExpansionPanelhistory extends StatefulWidget {
  const ExpansionPanelhistory(
      {Key? key,
      required this.qrslist,
      required this.images,
      required this.isQRCreated})
      : super(key: key);
  final List<QRModel> qrslist;
  final List<QrImage> images;
  final bool isQRCreated;
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
          widget.isQRCreated ? widget.images.length : widget.qrslist.length,
      itemBuilder: (BuildContext context, int index) {
        return ExpansionPanelList(
          animationDuration: Duration(milliseconds: 1000),

          //  dividerColor: Colors.red,
          elevation: 1,
          children: [
            ExpansionPanel(
              canTapOnHeader: true,
              body: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    widget.isQRCreated
                        ? Image.file(File(widget.images[index].imageName))
                        : Text(
                            widget.qrslist[index].qrData,
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 15,
                                letterSpacing: 0.3,
                                height: 1.3),
                          ),
                  ],
                ),
              ),
              isExpanded: widget.isQRCreated
                  ? widget.images[index].isExpanded
                  : widget.qrslist[index].isExpanded,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      widget.isQRCreated
                          ? widget.images[index].qrName
                          : DateFormat('yyyy-MM-dd – kk:mm a')
                              .format(widget.qrslist[index].dateTime),
                      style: const TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: 18,
                      ),
                    ),
                    trailing: NeumorphicText(
                      'Pushed',
                      style: NeumorphicStyle(
                        //depth: 4, //customize depth here
                        color: Colors.green, //customize color here
                      ),
                      textStyle: NeumorphicTextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold

                          //customize size here
                          // AND others usual text style properties (fontFamily, fontWeight, ...)
                          ),
                    ),
                  ),
                );
              },
            )
          ],
          expansionCallback: (int item, bool status) {
            if (widget.isQRCreated) {
              setState(() {
                widget.images[index].isExpanded =
                    !widget.images[index].isExpanded;
              });
            } else {
              setState(() {
                widget.qrslist[index].isExpanded =
                    !widget.qrslist[index].isExpanded;
              });
            }
          },
        );
      },
    );
  }
}
