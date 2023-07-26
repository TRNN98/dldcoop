import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/pages/auth/checkRegister.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/locals/dbPin.dart';
import 'package:dldcoop/FollowMe/locals/dbTF.dart';
import 'package:dldcoop/FollowMe/locals/dbUser.dart';
import 'package:dldcoop/FollowMe/models/sql/userDb.dart';
import 'package:dldcoop/FollowMe/pages/auth/otpF.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../lock/lockpin.dart';

DeviceInfoPlugin device1 = DeviceInfoPlugin();

class Login extends StatefulWidget {
  String? lgs;

  Login({this.lgs});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  UserDb user = UserDb();
  final _formKey = GlobalKey<FormState>();

  late DBUser dBUser;
  late DBPin dBPin;
  late DBTf dBTf;

  Devices getdeviceall = Devices();

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void getDevice(Obj1) async {
    String udid = await FlutterUdid.udid;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await device1.androidInfo;
      getdeviceall.model = udid;
      getDeviceStatus(Obj1);
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await device1.iosInfo;
      getdeviceall.model = udid;
      getDeviceStatus(Obj1);
    }
    // setState(() {});
  }

  getDeviceStatus(Obj1) {
    var ObjAuth1 = '';
    var m = '';
    var Obj =
        '{"mode": "2","imei":"${getdeviceall.model}","platform":" ","model":"","phone":"","bank":"","type":"","membership_no":"${user.user!}"}';
    Network.fetchDeviceStatus(Obj, context).then((value) => {
          if (MyClass.json(value)[0]['status'] == '0')
            {
              Network.fetchGetTel(Obj1).then((value1) => {
                    if (value1[0]['telephone'] == '0')
                      {
                        // Navigator.pop(context),
                        MyClass.showToast(MyClass.json(value1)[0]['msg']),
                      }
                    else
                      {
                        m = value1[0]['telephone'],
                        Obj = '{"MobileNumber": "${m}"}',
                        Network.fetchSendOtp(Obj).then((value) => {
                              if (value[0]['status'] == 'success')
                                {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Otp(
                                          type: 'pro',
                                          token_otp: value[0]['token'],
                                          refno: value[0]['refno'],
                                          timeout: '5',
                                          phone_no: m,
                                          lgs: 'th',
                                          membership_no: user.user!,
                                          password: '',
                                          idcard: '',
                                          brithday: '',
                                          title: ''),
                                    ),
                                  )
                                }
                              else
                                {
                                  // Navigator.pop(context),
                                  MyClass.showToast(
                                      'OTP ผิดพลาด กรุณาติดต่อสหกรณ์')
                                }
                            }),
                      }
                  }),
            }
          else if (MyClass.json(value)[0]['status'] == '1')
            {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Pins(
                      gettitle: 'setPassword',
                    ),
                  ),
                  (Route<dynamic> route) => false)
            }
          else
            {
              // Navigator.pop(context),
              MyClass.showToast(MyClass.json(value)[0]['msg']),
            }
        });
  }

  List checkMemList = [];
  List checkPDList = [];
  String gphoneNo = '';
  String gbankNo = '';
  String gtimeout = '';
  String gbankAccNo = '';

  @override
  void initState() {
    dBUser = DBUser();
    dBPin = DBPin();
    dBTf = DBTf();

    super.initState();
  }

  @override
  void dispose() {
    dBUser.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    _initusers();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: tabletMode
                      ? AssetImage("assets/imgs/bg_tablet.png")
                      : AssetImage("assets/imgs/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: tabletMode
                            ? displayHeight(context) * 0.01
                            : displayHeight(context) * 0.001,
                      ),
                      CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
                      Container(
                        padding: EdgeInsets.only(
                            top: displayHeight(context) * 0.015),
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Text(MyClass.company('th'),
                                      textScaleFactor: MyClass.fontSizeApp(),
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyle.dataHeadTitleCTxt(
                                          context,
                                          tabletMode == true ? 2 : 8,
                                          'slide2')),
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
                                    style:
                                        CustomTextStyle.dataHeadTitleTxtEnPaint(
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
                        ),
                      ),
                      SizedBox(
                        height: tabletMode
                            ? displayHeight(context) * 0.01
                            : displayHeight(context) * 0.04,
                      ),
                      // Padding(
                      //   padding: tabletMode
                      //       ? const EdgeInsets.only(left: 55, top: 0, bottom: 5)
                      //       : const EdgeInsets.only(left: 35, bottom: 5),
                      //   child: Text(Language.loginLg('member', widget.lgs),
                      //       textAlign: TextAlign.left,
                      //       textScaleFactor: MyClass.fontSizeApp(),
                      //       style:
                      //           CustomTextStyle.defaultTxt1(context, 0, 'Bl')),
                      // ),
                      Padding(
                        padding: tabletMode
                            ? const EdgeInsets.only(
                                left: 55, right: 55, top: 0, bottom: 2)
                            : const EdgeInsets.only(
                                left: 30, right: 30, top: 0, bottom: 2),
                        child: MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                            textScaleFactor: MyClass.fontSizeApp(),
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            style: CustomTextStyle.defaultTxt(context, 0),
                            // keyboardType: const TextInputType.numberWithOptions(
                            //     decimal: false, signed: true),
                            textInputAction: TextInputAction.done,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(
                                  MyClass.lengthmember()),
                            ],
                            decoration: InputDecoration(
                              errorStyle: const TextStyle(height: 0),
                              hintText:
                                  Language.loginLg('memberNumber', widget.lgs),
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Opacity(
                                opacity: 0,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.visibility,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              prefixIcon: Icon(Icons.account_circle,
                                  size: tabletMode ? 40 : 30),
                              // labelText: Language.loginLg('member', widget.lgs),
                              labelStyle: TextStyle(
                                  color:
                                      MyColor.color('TextFormFieldTextStyle')),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (String? value) {
                              return _validatUser(value);
                            },
                            onSaved: (String? value) {
                              user.user = MyClass.genmember(value);
                            },
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: tabletMode
                      //       ? displayHeight(context) * 0.01
                      //       : displayHeight(context) * 0.025,
                      // ),
                      Padding(
                        padding: tabletMode
                            ? const EdgeInsets.only(left: 55)
                            : const EdgeInsets.only(left: 50),
                        child: Text(
                            Language.loginLg('memberDetail', widget.lgs),
                            textScaleFactor: MyClass.fontSizeApp(),
                            style:
                                CustomTextStyle.defaultTxt1(context, -3, 'R')),
                      ),
                      Padding(
                        padding: tabletMode
                            ? const EdgeInsets.only(
                                left: 55, top: 20, bottom: 5)
                            : const EdgeInsets.only(
                                left: 35, top: 20, bottom: 5),
                        // child: Text(
                        //   Language.loginLg('password', widget.lgs),
                        //   textAlign: TextAlign.left,
                        //   textScaleFactor: MyClass.fontSizeApp(),
                        //   style: CustomTextStyle.defaultTxt1(context, 0, 'Bl'),
                        // ),
                      ),
                      Padding(
                        padding: tabletMode
                            ? const EdgeInsets.only(
                                left: 55, right: 55, top: 0, bottom: 2)
                            : const EdgeInsets.only(
                                left: 30, right: 30, top: 0, bottom: 2),
                        child: MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                            textScaleFactor: MyClass.fontSizeApp(),
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            style: CustomTextStyle.defaultTxt(context, 0),
                            decoration: InputDecoration(
                              errorStyle: const TextStyle(height: 0),
                              hintText:
                                  Language.loginLg('password', widget.lgs),
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: IconButton(
                                  icon: _obscureText == true
                                      ? Icon(
                                          Icons.visibility_off,
                                          size: tabletMode ? 40 : 30,
                                          color: Colors.grey,
                                        )
                                      : Icon(
                                          Icons.visibility,
                                          size: tabletMode ? 40 : 30,
                                          color: Colors.blue.shade600,
                                        ),
                                  onPressed: () {
                                    _toggle();
                                  },
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                size: tabletMode ? 40 : 30,
                              ),
                              // labelText: Language.loginLg('password', widget.lgs),
                              labelStyle: TextStyle(
                                  color:
                                      MyColor.color('TextFormFieldTextStyle')),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      MyColor.color('TextFormFieldBorderSide'),
                                  width: 2.0,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            obscureText: _obscureText,
                            validator: (String? value) {
                              return _validatPassword(value);
                            },
                            onSaved: (String? value) {
                              user.password = value;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: tabletMode
                            ? const EdgeInsets.only(left: 55)
                            : const EdgeInsets.only(left: 50),
                        child: Text(
                          Language.loginLg('pleaseYourpassword', widget.lgs),
                          textScaleFactor: MyClass.fontSizeApp(),
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.defaultTxt1(context, -3, 'R'),
                        ),
                      ),
                      hSizedBoxButton(context, 0),
                      Center(child: _buildsubmitButton()),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(child: _buildRegitResetButton()),
                      const SizedBox(
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegitResetButton() {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: tabletMode
          ? const EdgeInsets.only(left: 55, right: 55, top: 10, bottom: 5)
          : const EdgeInsets.fromLTRB(35, 5, 35, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: displayWidth(context) * 0.47,
            height: displayHeight(context) * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              gradient: LinearGradient(
                colors: <Color>[
                  MyColor.color('W'),
                  MyColor.color('W'),
                ],
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Checkregister(
                        title: Language.loginLg('memberRegis', widget.lgs),
                        lgs: widget.lgs),
                  ),
                );
              },
              child: Center(
                child: Text(
                  Language.loginLg('memberRegis', widget.lgs),
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.dataBoldTxtC(context, -5, 'LoginTxt'),
                ),
              ),
            ),
          ),
          Container(
            width: displayWidth(context) * 0.27,
            height: displayHeight(context) * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              gradient: const LinearGradient(
                colors: <Color>[
                  Color(0xFF003B93),
                  Color(0xFF003B93),
                ],
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Checkregister(
                        title: Language.loginLg('forgotPassword', widget.lgs),
                        lgs: widget.lgs),
                  ),
                );
              },
              child: Center(
                child: Text(
                  Language.loginLg('forgotPassword', widget.lgs),
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.dataBoldTxtC(context, -5, 'W'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildsubmitButton() {
    return Container(
      width: displayWidth(context) * 0.85,
      height: displayHeight(context) * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        gradient: LinearGradient(
          colors: <Color>[
            MyColor.color('slide2'),
            MyColor.color('slide2'),
          ],
        ),
      ),
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: _submit,
        child: Center(
          child: Text(
            Language.loginLg('logIn', widget.lgs),
            textScaleFactor: MyClass.fontSizeApp(),
            style: CustomTextStyle.dataBoldTxt1(context, -3),
          ),
        ),
      ),
    );
  }

  void _submit() {
    // Timer t = Timer(const Duration(seconds: 20), () {
    //   Navigator.of(context, rootNavigator: true).pop('AlertDialog');
    //   MyClass.showToast('กรุณาตรวจสอบอินเทอร์เน็ต');
    // });
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showDialog(
        barrierDismissible: false,
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) {
          return MyClass.loading();
        },
      );

      var ObjAuth = '{"pass":"","mode": "2","membership_no":"${user.user}"}';
      Network.fetchAuthReg(ObjAuth).then((value2) => {
            // t.cancel,
            _oncheckre(value2),
          });
    } else {
      // t.cancel;
      MyClass.showToast(Language.loginLg('alertlogin', widget.lgs));
    }
  }

  _oncheckre(value2) {
    print(MyClass.json(value2)[0]['rc_code'].toString());
    if (MyClass.json(value2)[0]['rc_code'].toString() == "1") {
      if (MyClass.json(value2)[0]['member_status_code'].toString() == '0') {
        Navigator.of(context).pop();
        MyClass.showToast('กรุณาลงทะเบียนเพื่อเปิดใช้งาน');
      } else {
        Navigator.of(context).pop();
        MyClass.showToast('ไม่มีทะเบียนสมาชิกนี้');
      }
    } else {
      if (MyClass.json(value2)[0]['rc_desc'].toString() == 'ไม่มีสมาชิกนี้') {
        Navigator.of(context).pop();
        MyClass.showToast(MyClass.json(value2)[0]['rc_desc'].toString());
      } else {
        Future.delayed(const Duration(seconds: 5), () {
          Network.fetchpinlogin(
                  '{"membership_no": "${user.user!}","mem_password":"${user.password!}"}',
                  context)
              .then((value) => {
                    _onLoadingParm(value),
                    print("เข้าเงื่อนไขมีสมาชิก"),
                  });
        });
      }
    }
  }

  void _onLoadingParm(value) {
    print(value);
    if (value != 'NoData') {
      // เคสมีข้อมูล
      Future.delayed(const Duration(), () {
        user.password = value[0]["refresh_token"];
        _checklogin(value);
      });
    } else if ((user.user.toString().length > MyClass.lengthmember())) {
      Navigator.of(context).pop();
      MyClass.showToast("กรุณากรอกเลขทะเบียนสมาชิกให้ถูกต้อง");
    } else {
      // เคสอื่นๆที่ไม่พบdata
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.of(context).pop();
        MyClass.showToast(Language.loginLg('alertLoginNew', widget.lgs));
      });
    }
  }

  _checklogin(value) async {
    await dBPin.initDB();
    await dBPin.deleteAll();
    await dBPin.close();

    await dBTf.initDB();
    await dBTf.deleteAll();
    await dBTf.close();

    await dBUser.initDB();
    await dBUser.deleteAll();
    await dBUser.insertUsers(user).then(
      (value) {
        _checkAuthLock(value.user);
      },
    );
    await dBUser.close();
  }

  _checkAuthLock(value) async {
    var ObjAuth = '';
    var ObjAuth1 = '';
    var Objotp = '';
    var m = '';
    var Obj = '';
    ObjAuth = '{"pass":"","mode": "5","membership_no":"' + value + '"}';
    ObjAuth1 = '{"pass":"","mode": "8","membership_no":"' + value + '"}';
    var Obj1 = '{"mode": "1","membership_no":"${value}"}';

    Network.fetchAuthCount(ObjAuth).then((v) => {
          if (MyClass.json(v)[0]["status"].toString() == '1')
            {
              Navigator.pop(context),
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => LockPin(user: value),
                  ),
                  (Route<dynamic> route) => false)
            }
          else
            {
              print("otp"),
              /*  Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Otp(
                      type: 'pro',
                      token_otp: 'xxxxx',
                      // value[0]['token'],
                      refno: 'xxxxx',
                      // value[0]['refno'],
                      timeout: '5',
                      phone_no: m,
                      lgs: 'th',
                      membership_no: user.user!,
                      password: '',
                      idcard: '',
                      brithday: '',
                      title: ''),
                ),
              )*/
              Network.fetchAuthCount(ObjAuth1).then((v1) => {
                    Navigator.pop(context),
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Pins(
                                  gettitle: 'setPassword',
                                )),
                        (Route<dynamic> route) => false)
                  }),
            }
        });

    // Network.fetchAuthCount(ObjAuth).then((v) => {
    //       if (MyClass.json(v)[0]['status'] == '0')
    //         {
    //           Objotp =
    //               '{"pass":"","mode": "20","membership_no":"' + value + '"}',
    //           Network.fetchAuthCheckOtpUnlock(Objotp).then((v) => {
    //                 // if (value.toString() == '999999' )
    //                 if (MyClass.json(v)[0]["status"].toString() == '1')
    //                   {
    //                     Navigator.pushAndRemoveUntil(
    //                         context,
    //                         MaterialPageRoute(
    //                           builder: (BuildContext context) => Pins(
    //                             gettitle: 'setPassword',
    //                           ),
    //                         ),
    //                         (Route<dynamic> route) => false)
    //                   }
    //                 else
    //                   {
    //                     getDevice(Obj1),
    //                   }
    //               }),
    //         }
    //       else if (MyClass.json(v)[0]["status"].toString() == '1')
    //         {
    //           Navigator.pushAndRemoveUntil(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (BuildContext context) => LockPin(user: value),
    //               ),
    //               (Route<dynamic> route) => false)
    //         }
    //       else
    //         {}
    //     });
  }

  _validatUser(String? value) {
    if ((value!.isEmpty) || (value.length < MyClass.lengthmember())) {
      return '';
      //  Language.loginLg('memberDetail', widget.lgs);
    }
  }

  _validatPassword(String? value) {
    if (value!.isEmpty) {
      return '';
      // Language.loginLg('pleaseYourpassword', widget.lgs);
    }
  }

  _initusers() => FutureBuilder(
        future: dBUser.initDB(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {}
          return Center(
            child: snapshot.hasError
                ? Text(snapshot.error.toString())
                : const CircularProgressIndicator(),
          );
        },
      );

  _json(s) {
    return jsonDecode(jsonEncode(s));
  }
}

_getstatus(user) async {
  const status = 'status';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? status1 = prefs.getInt(status);
  if (status1 == 1) {
    _insertpdpa(user);
  } else {
    print("nopdpa");
  }
  int status2 = 0;
  await prefs.setInt('status', status2);
}

_insertpdpa(user) {
  Network.fetchpdpa('{"membership_no":"' + user + '","mode": "1"}')
      .then((value) => {});
}
