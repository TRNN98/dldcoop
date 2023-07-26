import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/pages/InTro/introScreen.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/locals/dbPin.dart';
import 'package:dldcoop/FollowMe/models/sql/pinDb.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  PinDb pin = PinDb();

  late DBPin dBPin;

  @override
  void initState() {
    dBPin = DBPin();
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      _authCheckPinCode();
    });
  }

  @override
  void dispose() {
    dBPin.close();
    super.dispose();
  }

  _authCheckPinCode() async {
    await dBPin.initDB();
    await dBPin
        .getPins()
        .then((value) => {print(value), _checkpin(MyClass.json(value))});
  }

  _checkpin(pi) {
    print(pi.length);
    if (pi.length > 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => IntroScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    // bool lightMode =
    //     MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: tabletMode
                    ? AssetImage("assets/imgs/tablet_sp.png")
                    : AssetImage("assets/imgs/splash.png"),
                fit: BoxFit.cover,
              ),
            ),
            // child: Form(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         SizedBox(
            //           height: tabletMode == true
            //               ? displayHeight(context) * 0
            //               : displayHeight(context) * 0,
            //         ),
            //         CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
            //         Container(
            //           padding: EdgeInsets.only(top: displayHeight(context) * 0),
            //           alignment: Alignment.topCenter,
            //           child: Padding(
            //             padding: EdgeInsets.fromLTRB(16, 16, 16, 30),
            //             child: Column(
            //               children: [
            //                 // Stack(
            //                 //   children: [
            //                 //     Text(
            //                 //       Language.menuLg('welcomeTo', 'th'),
            //                 //       textScaleFactor: MyClass.fontSizeApp(),
            //                 //       textAlign: TextAlign.center,
            //                 //       style:
            //                 //           CustomTextStyle.dataHeadTitleCTxt1Paint(
            //                 //               context,
            //                 //               tabletMode == true ? 20 : 15,
            //                 //               'W',
            //                 //               tabletMode == true ? 5 : 3),
            //                 //     ),
            //                 //     Text(Language.menuLg('welcomeTo', 'th'),
            //                 //         textScaleFactor: MyClass.fontSizeApp(),
            //                 //         textAlign: TextAlign.center,
            //                 //         style: CustomTextStyle.dataHeadTitleCTxt(
            //                 //             context,
            //                 //             tabletMode == true ? 20 : 15,
            //                 //             'R')),
            //                 //   ],
            //                 // ),
            //                 const SizedBox(
            //                   height: 10,
            //                 ),
            //                 Stack(
            //                   children: [
            //                     Text(
            //                       MyClass.company('th'),
            //                       textScaleFactor: MyClass.fontSizeApp(),
            //                       textAlign: TextAlign.center,
            //                       style:
            //                           CustomTextStyle.dataHeadTitleCTxt1Paint(
            //                               context,
            //                               tabletMode == true ? 2 : 0,
            //                               'W',
            //                               tabletMode == true ? 5 : 3),
            //                     ),
            //                     Text(MyClass.company('th'),
            //                         textScaleFactor: MyClass.fontSizeApp(),
            //                         textAlign: TextAlign.center,
            //                         style: CustomTextStyle.dataHeadTitleCTxt(
            //                             context,
            //                             tabletMode == true ? 2 : 0,
            //                             'R')),
            //                   ],
            //                 ),
            //                 tabletMode == true
            //                     ? const SizedBox(
            //                         height: 10,
            //                       )
            //                     : const SizedBox(
            //                         height: 5,
            //                       ),
            //                 Stack(
            //                   children: [
            //                     Text(
            //                       MyClass.company('en'),
            //                       textScaleFactor: MyClass.fontSizeApp(),
            //                       textAlign: TextAlign.center,
            //                       style:
            //                           CustomTextStyle.dataHeadTitleTxtEnPaint(
            //                               context,
            //                               tabletMode == true ? -15 : -7,
            //                               'W',
            //                               tabletMode == true ? 5 : 3),
            //                     ),
            //                     Text(MyClass.company('en'),
            //                         textScaleFactor: MyClass.fontSizeApp(),
            //                         textAlign: TextAlign.center,
            //                         style: CustomTextStyle.dataHeadTitleTxtEn(
            //                           context,
            //                           tabletMode == true ? -15 : -7,
            //                         )),
            //                   ],
            //                 ),
            //                 // tabletMode == true
            //                 //     ? const SizedBox(
            //                 //         height: 80,
            //                 //       )
            //                 //     : const SizedBox(
            //                 //         height: 100,
            //                 //       ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           height: displayHeight(context) * 0.45,
            //         ),
            //         Center(
            //           child: Stack(
            //             children: [
            //               Text(
            //                 "\"สร้างชีวิตกับราชทัณฑ์ สร้างหลักประกันด้วยสหกรณ์\"",
            //                 textScaleFactor: MyClass.fontSizeApp(),
            //                 textAlign: TextAlign.center,
            //                 style: CustomTextStyle.dataHeadTitleCTxt1Paint(
            //                     context,
            //                     tabletMode == true ? 2 : -2,
            //                     'W',
            //                     tabletMode == true ? 5 : 3),
            //               ),
            //               Text(
            //                   "\"สร้างชีวิตกับราชทัณฑ์ สร้างหลักประกันด้วยสหกรณ์\"",
            //                   textScaleFactor: MyClass.fontSizeApp(),
            //                   textAlign: TextAlign.center,
            //                   style: CustomTextStyle.dataHeadTitleCTxt(context,
            //                       tabletMode == true ? 2 : -2, 'buttongra')),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ),
        ],
      ),
    );

    // Scaffold(
    //   body: Container(
    //     height: double.infinity,
    //     decoration: MyClass.splash(),
    //   ),
    // );
  }
}
