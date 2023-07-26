import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/models/auth/pinJson.dart';
import 'package:dldcoop/FollowMe/pages/auth/login.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/locals/dbFontSize.dart';
import 'package:dldcoop/FollowMe/locals/dbPin.dart';
import 'package:dldcoop/FollowMe/locals/dbTF.dart';
import 'package:dldcoop/FollowMe/locals/dbUser.dart';
import 'package:dldcoop/FollowMe/locals/dblg.dart';
import 'package:dldcoop/FollowMe/pages/settings/settings.dart';
import 'package:dldcoop/root/tabs.dart';
import 'package:dldcoop/FollowMe/models/sql/fontSizeDb.dart';
import 'package:dldcoop/FollowMe/models/sql/lgDb.dart';
import 'package:dldcoop/FollowMe/models/sql/pinDb.dart';
import 'package:dldcoop/FollowMe/models/sql/tfDb.dart';
import 'package:dldcoop/FollowMe/models/sql/userDb.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../lock/lockpin.dart';

class Param {
  String token;
  String name;
  String membership_no;
  String sex;
  String lgs;
  double fontsizeapps;
  String cooptoken;
  String baytoken;

  Param(
    this.token,
    this.name,
    this.membership_no,
    this.sex,
    this.lgs,
    this.fontsizeapps,
    this.cooptoken,
    this.baytoken,
  );
}

class Pins extends StatefulWidget {
  final String? gettitle;

  Pins({this.gettitle});

  @override
  _PinsState createState() => _PinsState();
}

class _PinsState extends State<Pins> {
  UserDb userref = UserDb();

  PinDb pin = PinDb();
  TFDb tf = TFDb();
  late DBLg dBLg;
  LGDb lg = LGDb();

  String? getlgs;
  String numberPin = '';
  String numberPin1 = '';
  String title = '';
  String titleE = '';

  late DBUser dBUser;
  late DBPin dBPin;
  late DBTf dBTf;

  late DBFs dBFs;
  FontSizeDb fs = FontSizeDb();

  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics = false;
  late List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  double _fontSizeApp = 1.0;

  _getversions() {
    Network.fetchVersions('{}').then((value) => _checkversion(value));
  }

  _checkversion(v) {
    if (Platform.isAndroid) {
      double.parse(v[0]['fandroid']) >= double.parse(MyClass.versionApp())
          ? _showfupdateversion(v, 'a')
          : double.parse(v[0]['vandroid']) > double.parse(MyClass.versionApp())
              ? _showupdateversion(v, 'a')
              : null;
      // : _authTF();
    } else if (Platform.isIOS) {
      double.parse(v[0]['fios']) >= double.parse(MyClass.versionApp())
          ? _showfupdateversion(v, 'i')
          : double.parse(v[0]['vios']) > double.parse(MyClass.versionApp())
              ? _showupdateversion(v, 'i')
              : null;
      // : _authTF();
    }
  }

  hiddenDialog(n) {
    Future.delayed(Duration(seconds: n), () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    });
  }

  hiddenDialogMillisec(n) {
    Future.delayed(Duration(milliseconds: n), () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    });
  }

  _showupdateversion(v, p) {
    setState(() {});
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(Language.pinLg('uversion', getlgs),
              style: CustomTextStyle.dataHTxt(context, 5, 'Bl')),
          content: Text(v[0]['msg'],
              style: CustomTextStyle.dataHTxt(context, 0, 'Bl')),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                Language.pinLg('no', getlgs),
                style: CustomTextStyle.dataHTxt(context, 3, 'R'),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                // _authTF();
              },
            ),
            CupertinoDialogAction(
              child: Text(
                Language.pinLg('yes', getlgs),
                style: CustomTextStyle.dataHTxt(context, 3, 'B'),
              ),
              onPressed: () {
                _launchURL(v[0][p == 'i' ? 'uios' : 'uandroid']);
              },
            ),
          ],
        );
      },
    );
  }

  _showfupdateversion(v, p) {
    setState(() {});
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(Language.pinLg('fversion', getlgs),
              style: CustomTextStyle.dataHTxt(context, 5, 'Bl')),
          content: Text(v[0]['fmsg'],
              style: CustomTextStyle.dataHTxt(context, 0, 'Bl')),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                Language.pinLg('update', getlgs),
                style: CustomTextStyle.dataHTxt(context, 4, 'B'),
              ),
              onPressed: () {
                _launchURL(v[0][p == 'i' ? 'uios' : 'uandroid']);
              },
            ),
          ],
        );
      },
    );
  }

  // _checkpassword() {
  //   dBUser.initDB().then((value) => {
  //     dBUser.getUsers().then((value) => {
  //       _gocheckpass(MyClass.json(value)[0]['user'],
  //           MyClass.json(value)[0]['password']),
  //     })
  //   });
  // }

  // _gocheckpass(user, pass) {
  //   Network.fetchCheckpassword(
  //       '{"membership_no": "' + user + '","password":"' + pass + '"}')
  //       .then(
  //         (value) => value.toString() == '1' ? _newlogin() : null,
  //     // (value) =>  print(value),
  //   );
  // }

  _newlogin() {
    setState(() {});
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Language.pinLg('changedpassword', getlgs)),
          content: Text(Language.pinLg('changedpasswordlogin', getlgs)),
          actions: <Widget>[
            Row(
              children: [
                TextButton(
                  child: Text(Language.pinLg('ok', getlgs)),
                  onPressed: () {
                    hiddenDialog(0);
                    _resetall();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  _checkAuthLock() async {
    var ObjAuth = '';
    var ObjAuth1 = '';
    await dBUser.initDB();
    await dBUser.getUsers().then((value) => {
          ObjAuth = '{"pass":"","mode": "5","membership_no":"' +
              MyClass.json(value)[0]['user'] +
              '"}',
          ObjAuth1 = '{"pass":"","mode": "7","membership_no":"' +
              MyClass.json(value)[0]['user'] +
              '"}',
          Network.fetchAuthCount(ObjAuth).then((v) => {
                if (MyClass.json(v)[0]["status"].toString() == '1')
                  {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                LockPin(user: MyClass.json(value)[0]['user'])),
                        (Route<dynamic> route) => false)
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         LockPin(user: MyClass.json(value)[0]['user']),
                    //   ),
                    // ),
                  }
                else
                  {
                    Network.fetchAuthCount(ObjAuth1).then((v1) => {
                          if (MyClass.json(v1)[0]["status"].toString() == '1')
                            {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Login()),
                                  (Route<dynamic> route) => false)
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => Login(),
                              //   ),
                              // ),
                            }
                        }),
                  }
              }),
        });
  }

  _resetall() async {
    await dBPin.initDB();
    await dBPin.deleteAll();
    await dBUser.initDB();
    await dBUser.deleteAll().then((value) => {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Login(
                  lgs: getlgs,
                ),
              ),
              (Route<dynamic> route) => false)
          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(
          //     builder: (context) => Login(
          //       lgs: getlgs,
          //     ),
          //   ),
          // )
        });
  }

  // Future<void> _getSystemClose() {
  //   Network.fetchSystemClose('{}').then((value) => {
  //     _checkSystemClose(value),
  //   });
  // }

  // _checkSystemClose(v) {
  //   if (v[0]['status'] == '1') {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => SystemClose(
  //           title: v[0]['title'],
  //           detail: v[0]['detail'],
  //         ),
  //       ),
  //     );
  //   }else{
  //     _authTF();
  //   }
  // }

  _oneSignal(user) async {
    await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    await OneSignal.shared.setAppId("1d2068e3-04ed-4d9d-aa01-0cad68057a6e");
    await OneSignal.shared.promptUserForPushNotificationPermission();
    await OneSignal.shared.sendTag('membership_no', user);
    // await OneSignal.shared
    //     .promptUserForPushNotificationPermission()
    //     .then((accepted) {
    //   MyClass.showToast(accepted);
    // });
    //
    // OneSignal.shared.setInAppMessageClickedHandler((OSInAppMessageAction action) {
    //   MyClass.showToast(action);
    // });
  }

  @override
  void initState() {
    dBUser = DBUser();
    dBPin = DBPin();
    dBTf = DBTf();
    dBLg = DBLg();
    dBFs = DBFs();
    imageCache.clear();
    imageCache.clearLiveImages();

    super.initState();
    // _getSystemClose();
    _checkAuthLock();
    _getfs();
    _authTF();
    _gettitles();
    _getversions();
  }

  @override
  void dispose() {
    dBUser.close();
    dBPin.close();
    dBTf.close();
    dBLg.close();
    dBFs.close();

    super.dispose();
  }

  _getfs() async {
    try {
      await dBFs.initDB();
      await dBFs.getFs().then((value) => {
            value.length > 0
                ? _fontSizeApp = double.parse(MyClass.json(value)[0]['fs'])
                : _fontSizeApp = 1.0,
          });
    } catch (err) {
      _fontSizeApp = 1.0;
    }
  }

  bool tabletMode1 = false;
  var counts = 0;
  bool isAlertPin = false;

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    tabletMode1 = tabletMode;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(context),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(
                  height: tabletMode
                      ? displayHeight(context) * 0.03
                      : displayHeight(context) * 0.05,
                ),
                CustomUI.appbarDetailUi3('assets/imgs/icon.png', context),
                SizedBox(
                  height: tabletMode
                      ? displayHeight(context) * 0.0275
                      : displayHeight(context) * 0.0275,
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        Text(MyClass.company('th'),
                            textScaleFactor: MyClass.fontSizeApp(),
                            textAlign: TextAlign.center,
                            style: CustomTextStyle.dataHeadTitleCTxt(
                                context, tabletMode == true ? 2 : 8, 'slide2')),
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
                              'Bl',
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
                const SizedBox(
                  height: 15,
                ),
                Text(_checktitle(),
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.dataBoldTxt2(
                        context, tabletMode ? -12 : -5, _checkkey()
                        // title == Language.pinLg('confirmPleaseTryAgain', getlgs)
                        //     ? 'R'
                        //     : 'B')),
                        )),
                const SizedBox(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    numberPin.length >= 1
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                    numberPin.length >= 2
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                    numberPin.length >= 3
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                    numberPin.length >= 4
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                    numberPin.length >= 5
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                    numberPin.length >= 6
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: tabletMode ? 2.8 : 1.8,
                    mainAxisSpacing: 10,
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      _buttompin('1'),
                      _buttompin('2'),
                      _buttompin('3'),
                      _buttompin('4'),
                      _buttompin('5'),
                      _buttompin('6'),
                      _buttompin('7'),
                      _buttompin('8'),
                      _buttompin('9'),
                      title == Language.pinLg('setPassword', getlgs)
                          ? _buttompin(Language.pinLg('reset', getlgs))
                          : title == Language.pinLg('confirmPassword', getlgs)
                              ? _buttompin(Language.pinLg('reset', getlgs))
                              : title ==
                                      Language.pinLg(
                                          'confirmPleaseTryAgain', getlgs)
                                  ? _buttompin(Language.pinLg('reset', getlgs))
                                  : title ==
                                          Language.pinLg(
                                              'originalPINCode', getlgs)
                                      ? Container()
                                      : _buttompin(
                                          Language.pinLg('forgot', getlgs)),
                      _buttompin('0'),
                      _buttompin(Language.pinLg('delete', getlgs)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              // child: AppBar(
              //   backgroundColor: Colors.transparent,
              //   elevation: 0.0,
              // ),
              child: CustomUI.appbarBackgroundUi(context)),
          // Container(
          //     alignment: Alignment.topCenter,
          //     padding: const EdgeInsets.only(top: 60),
          //     child: Image.asset('assets/imgs/icon.png',
          //         width: tabletMode
          //             ? displayWidth(context) * 0.2
          //             : displayWidth(context) * 0.3,
          //         height: tabletMode
          //             ? displayWidth(context) * 0.3
          //             : displayWidth(context) * 0.4)),
        ],
      ),
    );
  }

  // _checkkey() {
  //   return Container(
  //       child: Text(title,
  //           textScaleFactor: MyClass.fontSizeApp(),
  //           style: CustomTextStyle.dataBoldTxt2(context, 3, _()
  //               // title == Language.pinLg('confirmPleaseTryAgain', getlgs)
  //               //     ? 'R'
  //               //     : 'B')),
  //               )));
  // }

  _checkkey() {
    if (title == Language.pinLg('confirmPleaseTryAgain', getlgs) ||
        title == Language.pinLg('pleaseTryAgain', getlgs) ||
        title == Language.pinLg('incorrectOriginalPINCode', getlgs) ||
        title == Language.pinLg('incorrectconfirmTouchIDAndFaceID', getlgs)) {
      return 'R';
    } else {
      return 'B';
    }
  }

  _checktitle() {
    if (title == Language.pinLg('incorrectOriginalPINCode', getlgs) ||
        title == Language.pinLg('incorrectconfirmTouchIDAndFaceID', getlgs) ||
        title == Language.pinLg('pleaseTryAgain', getlgs)) {
      return '$title ($counts/3)';
    } else {
      return title;
    }
  }

  _buttompin(n) {
    return InkResponse(
      onTap: () {
        _onCodeClick(n);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: MyColor.color('buttongra2'),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, -2),
              ),
              BoxShadow(
                color: MyColor.color('buttongra2'),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              )
            ]),
        child: Center(
          child: Text(
            n.toString(),
            textScaleFactor: MyClass.fontSizeApp(),
            style: CustomTextStyle.dataHTxt(
                context, tabletMode1 == true ? 4 : 5, 'Bl'),
          ),
        ),
      ),
    );
  }

  _onCodeClick(n) {
    setState(() {
      numberPin += n;
      if (n == Language.pinLg('delete', getlgs)) {
        numberPin = '';
      }

      if (n.toString() == Language.pinLg('reset', getlgs)) {
        numberPin = '';
        numberPin1 = '';
        title = Language.pinLg('setPassword', getlgs);
      }

      if (n.toString() == Language.pinLg('forgot', getlgs)) {
        numberPin = '';
        numberPin1 = '';
        _resetall();
      }
    });
    if (numberPin.length >= 6) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return MyClass.loading();
        },
      );
      if (title == Language.pinLg('setPassword', getlgs)) {
        hiddenDialog(2);
        numberPin1 = numberPin;
        numberPin = '';
        title = Language.pinLg('confirmPassword', getlgs);
      } else if (title == Language.pinLg('confirmPassword', getlgs) ||
          title == Language.pinLg('confirmPleaseTryAgain', getlgs)) {
        hiddenDialog(0);
        if (numberPin == numberPin1) {
          pin.pinnumber = numberPin1;
          dBPin.initDB().then((value) => {
                dBPin.deleteAll().then((value) => {
                      dBPin.insertPins(pin).then((value) => {
                            numberPin = '',
                            _onLogin(''),
                            title = Language.pinLg('pinCode', getlgs),
                          })
                    })
              });
        } else {
          numberPin = '';
          // hiddenDialog(2);
          title = Language.pinLg('confirmPleaseTryAgain', getlgs);
        }
      } else if (title == Language.pinLg('pinCode', getlgs) ||
          title == Language.pinLg('pleaseTryAgain', getlgs)) {
        dBPin.initDB().then((value) => {
              dBPin.getPins().then(
                    (value) => {
                      _onCheckLogin(MyClass.json(value)[0]['pinnumber']),
                    },
                  )
            });
      } else if (title == Language.pinLg('originalPINCode', getlgs) ||
          title == Language.pinLg('incorrectOriginalPINCode', getlgs)) {
        dBPin.initDB().then((value) => {
              dBPin.getPins().then(
                    (value) => {
                      setState(() {}),
                      // hiddenDialog(2),
                      _onChangpin(
                          MyClass.json(value)[0]['pinnumber'], numberPin),
                    },
                  )
            });
      } else if (title == Language.pinLg('confirmTouchIDAndFaceID', getlgs) ||
          title == Language.pinLg('incorrectconfirmTouchIDAndFaceID', getlgs)) {
        dBPin.initDB().then((value) => {
              dBPin.getPins().then(
                    (value) => {
                      _onTouchIDAndFaceID(
                          MyClass.json(value)[0]['pinnumber'], numberPin),
                    },
                  )
            });
      }
    }
    // });
  }

  _onTouchIDAndFaceID(pin, pinnum) async {
    if (pin == pinnum) {
      var objAuth = '';
      await dBUser.initDB();
      await dBUser.getUsers().then((value) => {
            objAuth =
                '{"pass":"","mode": "4","membership_no":"${MyClass.json(value)[0]['user']}"}',
            Network.fetchAuthCount(objAuth).then((value) => {}),
          });
      numberPin = '';
      hiddenDialog(0);
      tf.tf = '1';
      dBTf.initDB().then((value) => {
            dBTf.insertTf(tf).then((value) => {
                  // _onCheckLogin(pin)
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text(
                            'Success',
                            style: CustomTextStyle.dataHTxt(context, 5, 'Bl'),
                          ),
                          content: Text(
                            'เปิดใช้งานระบบ Touch ID หรือ Face ID เรียบร้อยแล้ว',
                            style: CustomTextStyle.dataHTxt(context, 0, 'Bl'),
                          ),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text(
                                'ตกลง',
                                style:
                                    CustomTextStyle.dataHTxt(context, 3, 'B'),
                              ),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Pins()),
                                    (Route<dynamic> route) => false);
                              },
                            ),
                          ],
                        );
                      })

                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(
                  //     builder: (context) => Setting(),
                  //   ),
                  // )
                }),
          });
      numberPin = '';
    } else {
      var objAuth = '';
      hiddenDialogMillisec(150);
      await dBUser.initDB();
      await dBUser.getUsers().then((value) => {
            objAuth =
                '{"pass":"","mode": "3","membership_no":"${MyClass.json(value)[0]['user']}"}',
            Network.fetchAuthCount(objAuth).then((value) => {
                  title = Language.pinLg(
                      'incorrectconfirmTouchIDAndFaceID', getlgs),
                  numberPin = '',
                  _setcounts(value),
                }),
          });
    }
  }

  _onChangpin(pin, pinnum) async {
    if (pin == pinnum) {
      var objAuth = '';
      hiddenDialog(1);
      await dBUser.initDB();
      await dBUser.getUsers().then((value) => {
            objAuth =
                '{"pass":"","mode": "4","membership_no":"${MyClass.json(value)[0]['user']}"}',
            Network.fetchAuthCount(objAuth).then((value) => {}),
          });
      numberPin = '';
      title = Language.pinLg('setPassword', getlgs);
    } else {
      var objAuth = '';
      hiddenDialogMillisec(100);
      await dBUser.initDB();
      await dBUser.getUsers().then((value) => {
            objAuth =
                '{"pass":"","mode": "3","membership_no":"${MyClass.json(value)[0]['user']}"}',
            Network.fetchAuthCount(objAuth).then((value) => {
                  title = Language.pinLg('incorrectOriginalPINCode', getlgs),
                  numberPin = '',
                  _setcounts(value),
                }),
          });
    }
  }

  _onCheckLogin(pin) async {
    if (pin == numberPin) {
      var ObjAuth = '';
      await dBUser.initDB();
      await dBUser.getUsers().then((value) => {
            ObjAuth = '{"pass":"","mode": "4","membership_no":"' +
                MyClass.json(value)[0]['user'] +
                '"}',
            Network.fetchAuthCount(ObjAuth).then((value) => {}),
          });
      numberPin = '';
      _onLogin('n');
    } else {
      var ObjAuth = '';
      hiddenDialogMillisec(150);
      await dBUser.initDB();
      await dBUser.getUsers().then((value) => {
            ObjAuth = '{"pass":"","mode": "3","membership_no":"' +
                MyClass.json(value)[0]['user'] +
                '"}',
            Network.fetchAuthCount(ObjAuth).then((value) => {
                  title = Language.pinLg('pleaseTryAgain', getlgs),
                  numberPin = '',

                  // counts = MyClass.json(value)[0]["count"]
                  _setcounts(value),
                }),
          });
    }
  }

  _alertPin() {
    if (isAlertPin) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(
                'คำเตือน',
                style: CustomTextStyle.dataHTxt(context, 5, 'Bl'),
              ),
              content: Text(
                'คุณสามารถใส่ PIN CODE ได้อีกเพียง 1 ครั้ง หรือทำการกดลืม PIN CODE เพื่อ Login ใหม่',
                style: CustomTextStyle.dataHTxt(context, 0, 'Bl'),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text(
                    'OK',
                    style: CustomTextStyle.dataHTxt(context, 3, 'B'),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            );
          });
    }
  }

  _setcounts(v) {
    counts = MyClass.json(v)[0]["count"];
    _checkAuthLock();
    if (counts == 2) {
      setState(() {
        isAlertPin = true;
      });
    } else {
      setState(() {
        isAlertPin = false;
      });
    }
    _alertPin();
  }

  _onLogin(n) async {
    await dBUser.initDB();
    await dBUser.getUsers().then((value) => {
          _goMenu(MyClass.json(value)[0]['user'],
              MyClass.json(value)[0]['password'], n),
        });
  }

  _goMenu(user, pass, n) {
    n == 'n' ? Navigator.of(context, rootNavigator: true).pop('dialog') : null;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return MyClass.loading();
      },
    );

    Timer t = Timer(const Duration(seconds: 10), () {
      Navigator.of(context, rootNavigator: true).pop('AlertDialog');
      setState(() {
        numberPin = '';
      });
    });

    Network.fetchpinrefresh('{"refresh_token":"' + pass + '"}', context)
        .then((value) async => {
              userref.user = await user,
              userref.password = await value[0]["refresh_token"],
              await dBUser.initDB(),
              await dBUser.deleteAll(),
              await dBUser.insertUsers(userref).then((userdb) => {
                    Network.fetchpinloginInfo(
                            '{"mode": "1"}', value[0]['access_token'])
                        .then((val) => {
                              _getToken(
                                  value[0]['access_token'],
                                  val[0]['member_full_name'],
                                  MyClass.genmember(user).toString(),
                                  t),
                            }),
                  }),
            });
  }

  Future<List<PinModel>> _getToken(token, name, user, t) {
    var param;
    param = Param(
        token.toString(),
        name.toString(),
        user.toString(),
        'M'.toString(),
        'th'.toString(),
        _fontSizeApp,
        ''.toString(),
        ''.toString());
    Navigator.of(context, rootNavigator: true).pop('AlertDialog');
    _oneSignal(user.toString());
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Tabs(param)),
        (Route<dynamic> route) => false);
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) => Tabs(param),
    //   ),
    // );
    t.cancel();
    // Network.fetchToken('{}', token).then((value) => {
    //       param = Param(
    //           token.toString(),
    //           name.toString(),
    //           user.toString(),
    //           'M'.toString(),
    //           'th'.toString(),
    //           _fontSizeApp,
    //           value.length == 0
    //               ? ''.toString()
    //               : value[0].result.coopToken.accessToken.toString(),
    //           ''.toString()),
    //       Navigator.of(context, rootNavigator: true).pop('AlertDialog'),
    //       _oneSignal(user.toString()),
    //       Navigator.of(context).pushReplacement(
    //         MaterialPageRoute(
    //           builder: (context) => Tabs(param),
    //         ),
    //       ),
    //       t.cancel()
    //     });
    throw Exception('');
  }

  // value[0].result.coopToken.accessToken
  _codePanel(n) {
    if (n == 1) {
      return SizedBox(
          width: 18,
          height: 18,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFF5D512), width: 2.0),
                color: Color(0xFFF5D512)),
          ));
    } else {
      return SizedBox(
        width: 18,
        height: 18,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black87, width: 1.5),
              color: Colors.white),
        ),
      );
    }
  }

  Widget _joinCodePanel(n) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: _codePanel(n),
    );
  }

  _authTF() {
    dBPin.initDB().then((value) => {
          dBPin.getPins().then((value) => {_checkpin(MyClass.json(value))})
        });
  }

  _checkpin(pi) {
    if (title != Language.pinLg('setPassword', getlgs)) {
      try {
        if (pi[0]['pinnumber'].toString().length == 6) {
          if (title != Language.pinLg('originalPINCode', getlgs)) {
            dBTf.initDB().then((value) => {
                  dBTf.getTf().then((value) => {
                        if (value.isNotEmpty)
                          {_touchandface(MyClass.json(value)[0]['tf'])}
                      })
                });
          }
        }
      } catch (e) {
        throw Exception('Failed');
      }
    }
  }

  _touchandface(check) async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (check == '1') {
      if (Platform.isIOS) {
        if (availableBiometrics.contains(BiometricType.face)) {
          _authenticate();
        } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
          _isAuthenticating ? _cancelAuthentication() : _authenticate();
        }
      } else {
        if (availableBiometrics.contains(BiometricType.fingerprint) ||
            availableBiometrics.contains(BiometricType.strong)) {
          _isAuthenticating ? _cancelAuthentication() : _authenticate();
        }
      }
    }
  }

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {}
    if (!mounted) return;

    setState(() {
      // _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
      print(availableBiometrics);
      var localAuth = LocalAuthentication();
      // bool didAuthenticate = await localAuth.authenticateWithBiometrics(
      //     localizedReason: 'Please authenticate to show account balance');
    } on PlatformException catch (e) {}
    if (!mounted) return;

    setState(() {
      // _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      // authenticated = await auth.authenticateWithBiometrics(
      //     localizedReason: 'Scan your fingerprint to authenticate',
      //     useErrorDialogs: true,
      //     stickyAuth: true);
      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    print(authenticated);
    if (authenticated == true) {
      _onLogin('tf');
    }
    setState(() {
      _authorized = message;
    });
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  _gettitles() {
    getlgs = 'th';
    _gettitle('th');
  }

  _gettitle(l) {
    if (widget.gettitle == null) {
      setState(() {
        title = KeyPin.key('pinCode', l);
      });
    } else {
      setState(() {
        title = KeyPin.key(widget.gettitle, l);
      });
    }
  }
}

class KeyPin {
  static key(k, l) {
    if (k == 'pinCode') {
      return Language.pinLg('pinCode', l);
    }
    if (k == 'originalPINCode') {
      return Language.pinLg('originalPINCode', l);
    }
    if (k == 'setPassword') {
      return Language.pinLg('setPassword', l);
    }
    if (k == 'confirmTouchIDAndFaceID') {
      return Language.pinLg('confirmTouchIDAndFaceID', l);
    }
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    throw 'Could not launch $url';
  }
}
