// import 'dart:io';

// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:dldcoop/FollowMe/class/language.dart';
// import 'package:dldcoop/FollowMe/class/myclass.dart';
// import 'package:dldcoop/FollowMe/class/textstyle.dart';
// import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
// import 'package:dldcoop/FollowMe/pages/deposit/deposit.dart';
// import 'package:dldcoop/FollowMe/pages/dividend/dividend.dart';
// import 'package:dldcoop/FollowMe/pages/gain/gain.dart';
// import 'package:dldcoop/FollowMe/pages/guarantee/guarantee.dart';
// import 'package:dldcoop/FollowMe/pages/kept/kept.dart';
// import 'package:dldcoop/FollowMe/pages/loan/loan.dart';
// import 'package:dldcoop/FollowMe/pages/location/location.dart';
// import 'package:dldcoop/FollowMe/pages/mainmenu.dart';
// import 'package:dldcoop/FollowMe/pages/memberref/memberref.dart';
// import 'package:dldcoop/FollowMe/pages/news/news.dart';
// import 'package:dldcoop/FollowMe/pages/offset/offset.dart';
// import 'package:dldcoop/FollowMe/pages/profile/profile.dart';
// import 'package:dldcoop/FollowMe/pages/share/share.dart';
// import 'package:dldcoop/ProMoney/locals/device.dart';
// import 'package:dldcoop/ProMoney/models/sql/deviceDB.dart';
// import 'package:dldcoop/ProMoney/pages/admin/calculate/calculate.dart';
// import 'package:dldcoop/ProMoney/pages/admin/diluteShares/diluteShares.dart';
// import 'package:dldcoop/ProMoney/pages/admin/trackStatus/trackStatus.dart';
// import 'package:dldcoop/ProMoney/pages/auth/otp.dart';
// import 'package:dldcoop/ProMoney/pages/coops/buyChare/buyChare.dart';
// import 'package:dldcoop/ProMoney/pages/promoney.dart';
// import 'package:dldcoop/ProMoney/sevices/networdPro.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:async';

// import '../ProMoney/pages/banks/tranbank/tranBank.dart';
// import '../ProMoney/pages/banks/withDrawBank/withDrawBank.dart';
// import '../ProMoney/pages/banks/withDrawLoan/withDrawLoan.dart';
// import '../ProMoney/pages/coops/pay/pay.dart';
// import '../ProMoney/pages/coops/tran/tran.dart';
// import '../ProMoney/pages/history/history.dart';

// int _selectedPage = 0;

// class Tabs extends StatefulWidget {
//   Param param;

//   Tabs(this.param);

//   @override
//   _TabsState createState() => _TabsState();
// }

// class Devices {
//   Devices() {
//     this.name = '';
//     this.platform = '';
//     this.version = '';
//     this.model = '';
//   }

//   String? name;
//   String? platform;
//   String? version;
//   String? model;
// }

// DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

// class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
//   final autoSizeGroup = AutoSizeGroup();
//   late AnimationController _animationController;
//   late Animation<double> animation;
//   late CurvedAnimation curve;
//   Devices getdevicealls = Devices();

//   _Device() async {
//     print('dd');
//     if (Platform.isAndroid) {
//       print('dd1');
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       getdevicealls.name = androidInfo.device;
//       getdevicealls.platform = androidInfo.product;
//       getdevicealls.version = androidInfo.version.release;
//       getdevicealls.model = androidInfo.id;
//       print(androidInfo.model);
//     } else if (Platform.isIOS) {
//       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//       getdevicealls.name = iosInfo.name;
//       getdevicealls.platform = iosInfo.systemName;
//       getdevicealls.version = iosInfo.systemVersion;
//       getdevicealls.model = iosInfo.identifierForVendor;
//     }
//     await _getChackPD(getdevicealls.model);
//     setState(() {});
//   }

//   final iconListA = [
//     'assets/imgs/menu1.png',
//     'assets/imgs/news1.png',
//     'assets/imgs/location1.png',
//     'assets/imgs/profile1.png',
//   ];
//   final iconList = [
//     'assets/imgs/menu2.png',
//     'assets/imgs/news2.png',
//     'assets/imgs/location2.png',
//     'assets/imgs/profile2.png',
//   ];
//   final nameList = [
//     Language.tabsLg('menu', 'th'),
//     Language.tabsLg('news', 'th'),
//     Language.tabsLg('address', 'th'),
//     Language.tabsLg('profile', 'th'),
//   ];
//   var _bottomNavIndex = 0;

//   DeviceDb dv = DeviceDb();
//   late DBDevice dbDevice;
//   var StatusDevice;
//   var StatusDevice1;

//   _getDevice() {
//     dbDevice.initDB().then((value) => {
//           dbDevice.getDevice().then((value) => {
//                 if (value.length > 0)
//                   {
//                     StatusDevice = MyClass.json(value)[0]['status'],
//                   }
//               }),
//         });
//   }

//   List ChackMemList = [];
//   List ChackPDList = [];
//   String gphone_NO = '';
//   String gbank_NO = '';
//   String gtimeout = '';
//   String gmsg = '';

//   Future _getChackMem() async {
//     var Obj = '{"mode": "2","imei":"' +
//         '' +
//         '","platform":"' +
//         '' +
//         ' ","model":"' +
//         '' +
//         ' ","phone":"' +
//         '' +
//         '"}';
//     await NetworkPro.fetchDeviceStatus(Obj, widget.param.token, context)
//         .then((value) => {
//               ChackMemList = value,
//               gphone_NO = value[0]['phone'],
//               gbank_NO = value[0]['bank'],
//               gtimeout = value[0]['timeout'],
//               gmsg = value[0]['msg'],
//             });
//     // throw Exception('ddde');
//   }

//   _getChackPD(model) {
//     var Obj = '{"mode": "3","imei":"' +
//         model.toString() +
//         '","platform":"' +
//         '' +
//         ' ","model":"' +
//         '' +
//         '"}';
//     NetworkPro.fetchDeviceStatus(Obj, widget.param.token, context)
//         .then((value) => {
//               StatusDevice1 = value[0]['status'],
//             });
//     throw Exception('');
//   }

//   @override
//   void initState() {
//     dbDevice = DBDevice();
//     super.initState();
//     _Device();
//     _getChackMem();
//     _getDevice();

//     final systemTheme = SystemUiOverlayStyle.light.copyWith(
//       systemNavigationBarColor: HexColor('#ffffff'),
//       systemNavigationBarIconBrightness: Brightness.dark,
//     );
//     SystemChrome.setSystemUIOverlayStyle(systemTheme);

//     _animationController = AnimationController(
//       duration: Duration(seconds: 1),
//       vsync: this,
//     );
//     curve = CurvedAnimation(
//       parent: _animationController,
//       curve: const Interval(
//         0.5,
//         1.0,
//         curve: Curves.fastOutSlowIn,
//       ),
//     );
//     animation = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(curve);

//     Future.delayed(
//       Duration(seconds: 1),
//       () => _animationController.forward(),
//     );
//   }

//   @override
//   void dispose() {
//     dbDevice.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool tabletMode = MediaQuery.of(context).size.width > 600;
//     final _page = [
//       MainMenu(widget.param),
//       News(widget.param),
//       Location(widget.param),
//       Profile(widget.param),
//       Promoney(
//           imei: getdevicealls.model.toString(),
//           param: widget.param,
//           bank_No: ''),
//     ];
//     final _route = <String, WidgetBuilder>{
//       '/loan': (BuildContext context) => Loan(widget.param),
//       '/share': (BuildContext context) => Share(widget.param),
//       '/deposit': (BuildContext context) => Deposit(widget.param),
//       '/guarantee': (BuildContext context) => Guarantee(widget.param),
//       '/kept': (BuildContext context) => Kept(widget.param),
//       '/dividend': (BuildContext context) => Dividend(widget.param),
//       '/gain': (BuildContext context) => Gain(widget.param),
//       '/new': (BuildContext context) => News(widget.param),
//       '/offset': (BuildContext context) => Offsets(widget.param),
//       '/memberref': (BuildContext context) => MemberRef(widget.param),
//       '/tran': (BuildContext context) => TranAccount(
//           param: widget.param, imei: getdevicealls.model.toString()),
//       '/tranbank': (BuildContext context) =>
//           TranBank(param: widget.param, imei: getdevicealls.model.toString()),
//       '/drawLoan': (BuildContext context) =>
//           DrawLoan(param: widget.param, imei: getdevicealls.model.toString()),
//       '/withDrawBank': (BuildContext context) => WithDrawBank(
//           param: widget.param, imei: getdevicealls.model.toString()),
//       '/pay': (BuildContext context) =>
//           Pay(param: widget.param, imei: getdevicealls.model.toString()),
//       '/bychare': (BuildContext context) =>
//           BuyChare(param: widget.param, imei: getdevicealls.model.toString()),
//       '/history': (BuildContext context) => History(
//           param: widget.param,
//           imei: getdevicealls.model.toString(),
//           dateS: DateTime.now().year.toString() +
//               '-' +
//               DateTime.now().month.toString() +
//               '-1'),
//       // // '/admin': (BuildContext context) => Admin(
//       // //       token: param.token,
//       // //       name: param.name,
//       // //       membership_no: param.membership_no,
//       // //       lgs: param.lgs,
//       // //       fontsizeapps: param.fontsizeapps,
//       // //       cooptoken: param.cooptoken,
//       // //     ),
//       '/diluteShares': (BuildContext context) => DiluteShares(
//           param: widget.param, imei: getdevicealls.model.toString()),
//       '/calculate': (BuildContext context) => CalculateBorrow(
//           param: widget.param, imei: getdevicealls.model.toString()),
//       // '/saveBorrow': (BuildContext context) => SaveBorrow(
//       //       token: param.token,
//       //       name: param.name,
//       //       membership_no: param.membership_no,
//       //       lgs: param.lgs,
//       //       fontsizeapps: param.fontsizeapps,
//       //       cooptoken: param.cooptoken,
//       //       param: param,
//       //     ),
//       '/trackStatus': (BuildContext context) => TrackStatus(
//           param: widget.param, imei: getdevicealls.model.toString()),
//       // '/editprofile': (BuildContext context) => EditProfile(param: param),
//     };

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: new ThemeData(
//         fontFamily: 'FC_Lamoon',
//       ),
//       routes: _route,
//       home: Scaffold(
//         body: _page[_selectedPage],
//         floatingActionButton: ScaleTransition(
//           scale: animation,
//           child: FloatingActionButton(
//             elevation: 8,
//             backgroundColor: HexColor('#D37A29'),
//             child: Image.asset(
//               'assets/imgPro/menuPro.png',
//               width: 40,
//             ),
//             onPressed: () {
//               // setState(() {
//               //   _selectedPage = 4;
//               //   _bottomNavIndex = 4;
//               // });
//               setState(() {
//                 // if (ChackMemList[0]['type'].toString() == '1') {
//                 if (StatusDevice.toString() == '1' &&
//                     StatusDevice1.toString() == '1') {
//                   _selectedPage = 4;
//                   _bottomNavIndex = 4;
//                 } else if (gphone_NO == '') {
//                   MyClass.showToast(
//                       "ยังไม่สามารถใช้งานได้เนื่องจากเป็นการทดลองใช้ในบาง ผู้ใช้งานเท่านั้น");
//                 } else {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Otp(
//                           type: 'pro',
//                           token_otp: 'asdf',
//                           // token_otp: value[0]['result']['token'],
//                           timeout: gtimeout,
//                           phone_no: gphone_NO,
//                           bank: gbank_NO,
//                           param: widget.param),
//                     ),
//                   );
//                   // NetworkPro.fetchSentOtp(
//                   //         '{"MobileNumber": "' + gphone_NO + '"}',
//                   //         widget.param.token,
//                   //         context)
//                   //     .then((value) {
//                   //   if (value[0]['code'] == '000') {
//                   //     Navigator.pushReplacement(
//                   //       context,
//                   //       MaterialPageRoute(
//                   //         builder: (context) => Otp(
//                   //             type: 'pro',
//                   //             token_otp : 'asdf',
//                   //             // token_otp: value[0]['result']['token'],
//                   //             timeout: gtimeout,
//                   //             phone_no: gphone_NO,
//                   //             bank: gbank_NO,
//                   //             param: widget.param),
//                   //       ),
//                   //     );
//                   //         } else {
//                   //           MyClass.showToast('otp error');
//                   //         }
//                   //       });
//                 }
//                 // } else {
//                 //   MyClass.showToast(ChackMemList[0]['msg'].toString());
//                 // }
//               });
//             },
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: AnimatedBottomNavigationBar.builder(
//           itemCount: iconList.length,
//           tabBuilder: (int index, bool isActive) {
//             final color = isActive ? Colors.blue : Colors.white;
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   isActive == true ? iconListA[index] : iconList[index],
//                   width: tabletMode ? 40 : 30,
//                 ),
//                 const SizedBox(height: 4),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 0),
//                   child: Text(
//                     nameList[index].toString(),
//                     textScaleFactor: MyClass.fontSizeApp(),
//                     style: CustomTextStyle.defaultTxt(
//                         context, tabletMode ? -15 : -7),
//                   ),
//                 )
//               ],
//             );
//           },
//           backgroundColor: Colors.white,
//           activeIndex: _bottomNavIndex,
//           notchAndCornersAnimation: animation,
//           splashSpeedInMilliseconds: 300,
//           notchSmoothness: NotchSmoothness.sharpEdge,
//           gapLocation: GapLocation.center,
//           leftCornerRadius: 32,
//           rightCornerRadius: 32,
//           height: tabletMode ? 100 : 70,
//           onTap: (index) => setState(() => {
//                 _bottomNavIndex = index,
//                 _selectedPage = index,
//               }),
//         ),
//       ),
//     );
//   }
// }

// class HexColor extends Color {
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll('#', '');
//     if (hexColor.length == 6) {
//       hexColor = 'FF' + hexColor;
//     }
//     return int.parse(hexColor, radix: 16);
//   }
// }
