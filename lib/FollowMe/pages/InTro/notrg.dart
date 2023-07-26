import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/pages/auth/checkRegister.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/pages/auth/login.dart';
import 'package:flutter/material.dart';

class Notrg extends StatefulWidget {
  @override
  _NotrgState createState() => _NotrgState();
}

class _NotrgState extends State<Notrg> {
  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //   child: ClipPath(
          //     clipper: DiagonalPathClipperTwo(),
          //     child: Container(
          //       height: 170,
          //       color: MyColor.color('colorheader'),
          //     ),
          //   ),
          // ),
          // Container(
          //   alignment: Alignment.topCenter,
          //   padding: const EdgeInsets.only(top: 70),
          //   child: Column(
          //     children: [
          //       Image.asset('assets/imgs/regitconfirm.png', width: 120, height: 120),
          //     ],
          //   ),
          // ),
          Container(
            decoration: MyWidget.bgApp(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: tabletMode
                        ? displayHeight(context) * 0.10
                        : displayHeight(context) * 0.20,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    padding:
                        EdgeInsets.only(top: displayHeight(context) * 0.01),
                    child: Image.asset(
                      'assets/imgs/regitconfirm.png',
                      width: tabletMode
                          ? displayWidth(context) * 0.5
                          : displayWidth(context) * 0.5,
                      height: tabletMode
                          ? displayWidth(context) * 0.5
                          : displayWidth(context) * 0.5,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Text(
                    'ยินดีต้อนรับเข้าสู่แอปพลิเคชัน',
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.dataBoldTxtC(context, -1, 'slide1'),
                  ),
                  // lineSizedBox(context, 0),

                  Center(
                      child: Text(
                    MyClass.company('th'),
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.dataBoldTxtC(context, -1, 'slide1'),
                  )),

                  // Center(
                  //     child: Text(
                  //   'แบบออนไลน์',
                  //   textScaleFactor: MyClass.fontSizeApp(),
                  //   style: CustomTextStyle.dataBoldTxtC(context, -1, 'slide1'),
                  // )),
                  Center(
                      child: Text(
                    '(กรุณาลงทะเบียนสมัครสมาชิก หรือ เข้าสู่ระบบ)',
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.dataBoldTxtC(context, -1, 'slide1'),
                  )),
                  // lineSizedBox(context, 0),
                  // Center(
                  //     child: Text(
                  //   'แล้ว ใช่หรือไม่ ?',
                  //   textScaleFactor: MyClass.fontSizeApp(),
                  //   style: CustomTextStyle.dataBoldTxtC(context, -1, 'slide1'),
                  // )),
                  hSizedBoxButton(context, 0),
                  _onSubmit()
                ],
              ),
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          // CustomUI.appbarTxtTitleUi('ข้อมูลส่วนตัว', context),
          // CustomUI.appbarDetailUi('assets/imgs/regitconfirm.png', context),
          // CustomUI.appbarDetailUi('assets/imgs/icon.png', context),
        ],
      ),
    );
  }

  Widget _onSubmit() {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // margin: EdgeInsets.only(top: 32),
      child: Row(
        children: [
          Expanded(
            child: Text(''),
          ),
          Container(
            width: displayWidth(context) * 0.33,
            height: displayHeight(context) * 0.055,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Checkregister(
                        title: Language.loginLg('memberRegis', 'th'),
                        lgs: 'th'),
                  ),
                );
              },
              child: Center(
                child: Text(
                  'ลงทะเบียน',
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.defaultTxt1(context, 5, 'R'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(''),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 5),
          //   child: RaisedButton(
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(30.0)),
          //     color: MyColor.color('button'),
          //     onPressed: () {
          //       Navigator.of(context).pushReplacement(
          //         MaterialPageRoute(
          //           builder: (context) => Checkregister(
          //               title: Language.loginLg('memberRegis', 'th'),
          //               lgs: 'th'),
          //         ),
          //       );
          //     },
          //     child: Text(
          //       '    ลงทะเบียน    ',
          //       textScaleFactor: MyClass.fontSizeApp(),
          //       style: CustomTextStyle.buttonTxt(context, 5),
          //     ),
          //   ),
          // ),
          Container(
            width: displayWidth(context) * 0.33,
            height: displayHeight(context) * 0.055,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                colors: <Color>[
                  MyColor.color('slide2'),
                  MyColor.color('slide2')
                ],
              ),
            ),
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
              child: Center(
                child: Text(
                  'เข้าสู่ระบบ',
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.defaultTxt1(context, 5, 'Bl'),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 5),
          //   child: RaisedButton(
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(30.0)),
          //     color: Colors.red,
          //     onPressed: () {
          //       Navigator.of(context).pushReplacement(
          //         MaterialPageRoute(
          //           builder: (context) => Checkrg(),
          //         ),
          //       );
          //     },
          //     child: Text(
          //       '      ยกเลิก      ',
          //       textScaleFactor: MyClass.fontSizeApp(),
          //       style: CustomTextStyle.defaultTxt1(context, 5, 'w'),
          //     ),
          //   ),
          // ),
          Expanded(
            child: Text(''),
          ),
        ],
      ),
    );
  }
}
