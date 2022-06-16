// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // ignore: depend_on_referenced_packages

// import 'package:get/get.dart';

// import 'package:qr_flutter/qr_flutter.dart';

// import '../core/providers/qr_provider.dart';
// import '../providers/qr_provider.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   static const List<Tab> myTabs = <Tab>[
//     Tab(text: 'LEFT'),
//     Tab(text: 'RIGHT'),
//   ];
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(vsync: this, length: myTabs.length);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {

//     // final tabController = useTabController(initialLength: 2);
//     // final qrdata = useTextEditingController();

//     final qrData = Get.put(QrCodeProvider());
//     TextEditingController qrdata = TextEditingController();
//     // useEffect(() {
//     //   qrData.getQrs();
//     //   return () {};
//     // }, []);
//      _tabController.addListener(() => index.value = _tabController.index);
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Spacer(),
//               index == 1
//                   ? CupertinoButton(
//                       child: const Text('Create Qr'),
//                       onPressed: () => showDialog(
//                         context: context,
//                         builder: (context) {
//                           return Dialog(
//                             elevation: 0,
//                             child: Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   const Text('Your Qr Data'),
//                                   const SizedBox(height: 20),
//                                   TextField(
//                                       controller: qrdata, autofocus: true),
//                                   const SizedBox(height: 20),
//                                   CupertinoButton(
//                                     child: const Text('Create Qr'),
//                                     onPressed: () {
//                                       qrData.qrData = qrdata.text;
//                                       Navigator.pushNamed(context, '/CreateQr');
//                                     },
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     )
//                   : CupertinoButton(
//                       child: const Text('Scan Qr'),
//                       onPressed: () async {
//                         // await scanqr.qrScan();
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //       builder: (context) => const ScanQr()),
//                         // );
//                       },
//                     )
//             ],
//           ),
//           bottom: TabBar(
//             controller: _tabController,
//             isScrollable: true,
//             indicatorWeight: 4,
//             indicatorSize: TabBarIndicatorSize.label,
//             indicatorColor: Colors.blue,
//             unselectedLabelColor: Colors.grey,
//             labelColor: Colors.black87,
//             tabs: const [
//               Tab(text: 'Scans'),
//               Tab(text: 'Createds'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           controller: _tabController,
//           children: [
//             const Center(
//               child: Text(
//                 '',
//                 //  canqr.qrResult.toString()
//               ),
//             ),

//             //
//             qrData.createdQrs.isEmpty
//                 ? const Center(
//                     child: Text("There isn't any created Qr's yet."),
//                   )
//                 : ListView.builder(
//                     itemCount: qrData.createdQrs.length,
//                     itemBuilder: (_, i) => GestureDetector(
//                       child: Card(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               QrImage(
//                                 data: qrData.createdQrs[i],
//                                 size: 75,
//                                 backgroundColor: Colors.white,
//                                 version: QrVersions.auto,
//                               ),
//                               Text(qrData.createdQrs[i]),
//                             ],
//                           ),
//                         ),
//                       ),
//                       onTap: () {
//                         qrData.qrData = qrData.createdQrs[i];
//                         Navigator.pushNamed(context, '/CreateQr');
//                       },
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }
