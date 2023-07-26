import 'dart:io';

import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/locals/dbTF.dart';
import 'package:dldcoop/FollowMe/locals/dblg.dart';
import 'package:dldcoop/FollowMe/pages/settings/about/about.dart';
import 'package:dldcoop/FollowMe/pages/settings/fontSize/fontSize.dart';
import 'package:dldcoop/FollowMe/pages/settings/security/security.dart';
import 'package:dldcoop/FollowMe/models/sql/lgDb.dart';
import 'package:dldcoop/FollowMe/models/sql/tfDb.dart';
import 'package:flutter/material.dart';

bool isSwitched = false;
double _fontsizeapps = 1.0;

class Setting extends StatefulWidget {
  Param param;
  Setting(this.param);

  @override
  _SettingState createState() => _SettingState();
}

var txtLanguage = '';
var numLanguage;
late DBLg dBLg;
LGDb lg = LGDb();

class _SettingState extends State<Setting> {
  TFDb tf = TFDb();
  late DBTf dBTf;
  var imgprofile = '';
  @override
  void initState() {
    dBTf = DBTf();
    dBLg = DBLg();
    super.initState();
    isSwitched = false;
    _inittf();
  }

  @override
  void dispose() {
    dBTf.close();
    super.dispose();
  }

  _getlg() async {
    var l;
    await dBLg.initDB();
    l = await dBLg.getLg();
    print(MyClass.json(l)[0]['lg']);
    if (MyClass.json(l)[0]['lg'] == '1') {
      txtLanguage = 'English';
      numLanguage = 1;
    } else {
      txtLanguage = 'ไทย';
      numLanguage = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    imgprofile =
        '${MyClass.hostApp()}/public/member/profile/${widget.param.membership_no}.jpg';
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    _getlg();

    return Scaffold(
      body: Stack(
        children: [
          // CustomTextStyle.headcolor(context, 0),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [],
            ),
          ),
          Container(
            decoration: MyClass.backGround(context),
            child: Column(
              children: [
                SizedBox(
                  height: tabletMode
                      ? displayHeight(context) * 0.29
                      : Platform.isAndroid
                          ? displayHeight(context) * 0.26
                          : displayHeight(context) * 0.27,
                ),
                Center(
                  child: CustomUI.headprofile(context, widget.param.lgs,
                      widget.param.fontsizeapps, widget.param.name),
                ),
                lineSizedBox(context, -30),
                // _getlg(),
                _about(context, widget.param),
                _passwordsecurity(context, widget.param),
                // _language(context, tabletMode, widget.param.lgs),
                _touchandface(context),
                // _adjustFontSize(context, widget.param),
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          // CustomUI.appbarUi(),
          CustomUI.appbarUi3(Language.settingLg('setting', widget.param.lgs),
              _fontsizeapps, context),
          // CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
          Stack(
            children: [
              CustomUI.appbarDetailUiPro1(imgprofile, context),
            ],
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     height: 50,
      //     child: Center(
      //       child: FlatButton(
      //         onPressed: () => {
      //           // Navigator.pushNamedAndRemoveUntil(
      //           //     context, '/page4', ModalRoute.withName('/page1')),
      //           Navigator.pushReplacement(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => Pins(gettitle: 'pinCode'),
      //             ),
      //           )
      //         },
      //         child: Text(
      //           Language.settingLg('logOut', widget.param.lgs),
      //           textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  TextStyle(color: Colors.red, fontSize: displaySize(context).height * 0.04),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Container _touchandface(context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.11,
      child: Card(
        elevation: 0,
        color: MyColor.color('SettingBackground'),
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: MyColor.color('LineColor'), width: 8))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    Language.settingLg('touchAndFace', widget.param.lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingHTxt(context, 0),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Switch(
                          activeColor: MyColor.color('LineColor'),
                          inactiveThumbColor: MyColor.color('LineColor'),
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              if (value == true) {
                                tf.tf = '1';
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Pins(
                                        gettitle: 'confirmTouchIDAndFaceID'),
                                  ),
                                );

                                // dBTf.initDB().then((value) => {
                                //       dBTf.insertTf(tf).then((value) => {}),
                                //     });
                              } else {
                                dBTf.initDB().then((value) => {
                                      dBTf.deleteAll().then((value) => {}),
                                    });
                              }
                            });
                          })

                      // Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _inittf() {
    try {
      dBTf.initDB().then((value) => {
            dBTf
                .getTf()
                .then((value) => {_checkTF(MyClass.json(value)[0]['tf'])})
          });
    } catch (error) {
      setState(() {
        isSwitched = false;
      });
    }
  }

  _checkTF(value) {
    if (value == '1') {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }
}

InkWell _language(context, tabletMode, lgs) {
  return InkWell(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            int? selectedRadio = numLanguage;
            return AlertDialog(
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List<Widget>.generate(2, (int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio<int>(
                                value: index,
                                groupValue: selectedRadio,
                                onChanged: (value) {
                                  setState(() => {
                                        selectedRadio = value,
                                        print(index),
                                      });
                                },
                              ),
                              index == 0 ? Text("   ไทย   ") : Text("English")
                            ],
                          );
                        }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            // color: Colors.brown[50],
                            child: Text(Language.settingLg('cancel', lgs)),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                          ),
                          ElevatedButton(
                            // color: Colors.blue,
                            child: Text(Language.settingLg('change', lgs)),
                            onPressed: () {
                              // print(selectedRadio);
                              lg.lg = selectedRadio.toString();
                              dBLg.initDB().then((value) => {
                                    dBLg.deleteAll().then((value) => {
                                          dBLg.insertLg(lg).then(
                                                (value) => {
                                                  Navigator.of(context)
                                                      .pop(true),
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Pins(),
                                                    ),
                                                  )
                                                },
                                              ),
                                        })
                                  });
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            );
          });
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => LanguageSettings(),
      //   ),
      // );
    },
    child: Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.11,
      child: Card(
        elevation: 0,
        color: MyColor.color('SettingBackground'),
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: MyColor.color('LineColor'), width: 8))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    Language.settingLg('language', lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingHTxt(context, 0),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Text(
                      //   txtLanguage,
                      //   textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.settingHTxt(context, 5),
                      // ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: iconnext(context, 0),
                        color: MyColor.color('Bl'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

InkWell _about(context, Param param) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          // builder: (context) => UploadImageDemo(),
          builder: (context) => About(param),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.11,
      child: Card(
        elevation: 0,
        color: MyColor.color('SettingBackground'),
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: MyColor.color('LineColor'), width: 8))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    Language.settingLg('about', param.lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingHTxt(context, 0),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: iconnext(context, 0),
                        color: MyColor.color('Bl'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

InkWell _passwordsecurity(context, Param param) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Security(param),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.11,
      child: Card(
        elevation: 0,
        color: MyColor.color('SettingBackground'),
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: MyColor.color('LineColor'), width: 8))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    Language.settingLg('passwordSecurity', param.lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingHTxt(context, 0),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: iconnext(context, 0),
                        color: MyColor.color('Bl'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

InkWell _adjustFontSize(context, Param param) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FontSize(param),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.11,
      child: Card(
        elevation: 0,
        color: MyColor.color('SettingBackground'),
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: MyColor.color('LineColor'), width: 8))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    Language.settingLg('adjustFontSize', param.lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingHTxt(context, 0),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: iconnext(context, 0),
                        color: MyColor.color('Bl'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
