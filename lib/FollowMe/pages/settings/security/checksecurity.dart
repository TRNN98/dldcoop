import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/pages/auth/checkRegister.dart';
import 'package:dldcoop/FollowMe/pages/auth/login.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/locals/dbPin.dart';
import 'package:dldcoop/FollowMe/locals/dbUser.dart';
import 'package:dldcoop/FollowMe/pages/auth/otpF.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';

double _fontsizeapps = 1.0;

class Checksecurity extends StatefulWidget {
  Param param;
  String type;
  Checksecurity({required this.type, required this.param});

  @override
  _ChecksecurityState createState() => _ChecksecurityState();
}

class CheckSecuritys {
  String title;
  String detail;

  CheckSecuritys({required this.title, required this.detail});
}

class _ChecksecurityState extends State<Checksecurity> {
  late DBPin dBPin;
  late DBUser dBUser;
  Devices getdeviceall = Devices();

  // DeviceDb dv = DeviceDb();
  // DBDevice dbDevice;

  @override
  void initState() {
    dBPin = DBPin();
    dBUser = DBUser();
    // dbDevice = DBDevice();

    super.initState();
  }

  @override
  void dispose() {
    dBPin.close();
    dBUser.close();
    // dbDevice.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    List<CheckSecuritys> checkSecuritys = <CheckSecuritys>[
      CheckSecuritys(
          title: Language.settingLg('changePin', widget.param.lgs),
          detail: Language.settingLg('changePinDetail', widget.param.lgs)),
      CheckSecuritys(
          title: Language.settingLg('forgotPassword1', widget.param.lgs),
          detail: Language.settingLg('forgotPasswordDetail', widget.param.lgs)),
      CheckSecuritys(
          title: Language.settingLg('deactivate', widget.param.lgs),
          detail: Language.settingLg('deactivateDetail', widget.param.lgs)),
    ];
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: MyClass.backGround(context),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  tabletMode
                      ? hSizedBox(context, 250)
                      : hSizedBox(context, 180),
                  Center(
                      child: Text(
                    checkSecuritys[int.parse(widget.type)].title,
                    textAlign: TextAlign.center,
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.dataBoldTxtC(context, 4, 'Bl'),
                  )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                    child: Center(
                        child: Text(
                      checkSecuritys[int.parse(widget.type)].detail,
                      textAlign: TextAlign.center,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.dataBoldTxtC(context, -3, 'Bl'),
                    )),
                  ),
                  lineSizedBox(context, 0),
                  Stack(
                    children: [
                      Text(
                        Language.settingLg('youWant', widget.param.lgs) +
                            "${checkSecuritys[int.parse(widget.type)].title} " +
                            Language.settingLg('yesOrNo', widget.param.lgs),
                        textScaleFactor: MyClass.fontSizeApp(),
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.dataHeadTitleCTxt1Paint(
                            context,
                            tabletMode == true ? 2 : 4,
                            'W',
                            tabletMode == true ? 5 : 3),
                      ),
                      Text(
                          Language.settingLg('youWant', widget.param.lgs) +
                              "${checkSecuritys[int.parse(widget.type)].title} " +
                              Language.settingLg('yesOrNo', widget.param.lgs),
                          textScaleFactor: MyClass.fontSizeApp(),
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, tabletMode == true ? 2 : 4, 'R')),
                    ],
                  ),
                  _buttom()
                ],
              ),
            ),
          ),
          Container(
            padding: tabletMode
                ? EdgeInsets.only(top: displayHeight(context) * 0.25)
                : EdgeInsets.only(
                    top: Platform.isAndroid
                        ? displayHeight(context) * 0.22
                        : displayHeight(context) * 0.26),
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Text(
                        MyClass.company('th'),
                        textScaleFactor: MyClass.fontSizeApp(),
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.dataHeadTitleCTxt1Paint(
                            context,
                            tabletMode == true ? 2 : 8,
                            'W',
                            tabletMode == true ? 5 : 3),
                      ),
                      Text(MyClass.company('th'),
                          textScaleFactor: MyClass.fontSizeApp(),
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, tabletMode == true ? 2 : 8, 'slide1')),
                    ],
                  ),
                  SizedBox(
                    height: tabletMode
                        ? displayHeight(context) * 0.001
                        : displayHeight(context) * 0.005,
                  ),
                  Stack(
                    children: [
                      Text(
                        MyClass.company('en'),
                        textScaleFactor: MyClass.fontSizeApp(),
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.dataHeadTitleTxtEnPaint(
                            context,
                            tabletMode == true ? -10 : -5,
                            'W',
                            tabletMode == true ? 5 : 3),
                      ),
                      Text(MyClass.company('en'),
                          textScaleFactor: MyClass.fontSizeApp(),
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.dataHeadTitleTxtEn(
                            context,
                            tabletMode == true ? -10 : -5,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi(),
          CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
        ],
      ),
    );
  }

  Widget _buttom() {
    return Container(
      // width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 32),
      child: Row(
        children: [
          Expanded(
            child: Text(''),
          ),
          Container(
            width: displayWidth(context) * 0.4,
            height: displayHeight(context) * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                colors: <Color>[
                  MyColor.color('W'),
                  MyColor.color('W'),
                ],
              ),
            ),
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Text(
                  Language.settingLg('no', widget.param.lgs),
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.buttonCTxt(context, 5, 'R'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(''),
          ),
          Container(
            width: displayWidth(context) * 0.4,
            height: displayHeight(context) * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                colors: <Color>[
                  MyColor.color('buttongra'),
                  MyColor.color('buttongra1'),
                ],
              ),
            ),
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: _submit,
              child: Center(
                child: Text(
                  Language.settingLg('yes', widget.param.lgs),
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.buttonCTxt(context, 5, 'ButtonBl'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(''),
          ),
        ],
      ),
    );
  }

  void getDevice() async {
    String udid = await FlutterUdid.udid;
    getdeviceall.model = udid;
    getDeviceStatus();
  }

  getDeviceStatus() async {
    print(widget.param.membership_no);
    // ignore: prefer_interpolation_to_compose_strings
    var Obj = '{"mode": "3","imei":"' +
        getdeviceall.model.toString() +
        '","platform":"' +
        '' +
        ' ","model":"' +
        '' +
        '","phone":"' +
        '' +
        '","bank":"' +
        '' +
        '","type":"' +
        '' +
        '","membership_no":"' +
        widget.param.membership_no +
        '"}';
    await Network.fetchDeviceStatus(Obj, context).then((value) => {});
  }

  _submit() {
    if (int.parse(widget.type) == 0) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'originalPINCode'),
        ),
      );
      // dbDevice.initDB().then((value) => {
      //   dbDevice.deleteAll().then((value) => {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (context) => Pins(gettitle: 'originalPINCode'),
      //       ),
      //     ),
      //   })
      // });
    } else if (int.parse(widget.type) == 1) {
      dBPin.initDB().then(
            (value) => {
              dBPin.deleteAll().then(
                    (value) => {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) => Checkregister(
                      //         title: Language.loginLg(
                      //             'forgotPassword', widget.param.lgs)),
                      //   ),
                      // )
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => Checkregister(
                                  title: Language.loginLg(
                                      'forgotPassword', widget.param.lgs))),
                          (Route<dynamic> route) => false)
                    },
                  )
            },
          );
    } else if (int.parse(widget.type) == 2) {
      dBPin.initDB().then(
            (value) => {
              dBPin.deleteAll().then(
                    (value) => {
                      dBUser.initDB().then(
                            (value) => {
                              dBUser.deleteAll().then((value) => {
                                    setState(() {}),
                                    getDevice(),
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) => Login(
                                            lgs: widget.param.lgs,
                                          ),
                                        ),
                                        (Route<dynamic> route) => false)
                                  })
                            },
                          ),
                    },
                  )
            },
          );
    }
  }
}
