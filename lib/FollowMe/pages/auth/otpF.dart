import 'dart:async';

import 'dart:io';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../class/mycolor.dart';
import '../../locals/dbUser.dart';
import '../../locals/device.dart';
import '../../models/sql/deviceDB.dart';
import '../../models/sql/userDb.dart';
import '../../services/netword.dart';
import 'login.dart';

class Otp extends StatefulWidget {
  String type;
  String token_otp;
  String refno;
  String timeout;
  String? phone_no;
  String lgs;
  String membership_no;
  String password;
  String idcard;
  String brithday;
  String title;

  Otp(
      {required this.type,
      required this.token_otp,
      required this.refno,
      required this.timeout,
      required this.phone_no,
      required this.lgs,
      required this.membership_no,
      required this.password,
      required this.idcard,
      required this.brithday,
      required this.title});

  @override
  _OtpState createState() => _OtpState();
}

class Devices {
  deviceInfo() {
    name = '';
    platform = '';
    version = '';
    model = '';
    // phone = '';
  }

  String? name;
  String? platform;
  String? version;
  String? model;
  // String? phone;
}

dynamic txtPhone = TextEditingController();
String? otp = '';

DeviceInfoPlugin device1 = DeviceInfoPlugin();

class _OtpState extends State<Otp> {
  DeviceDb dv = DeviceDb();
  UserDb user = UserDb();
  late DBDevice dbDevice;
  late DBUser dBUser;
  dynamic tokenOtp;
  dynamic refno;
  int endTime = 0;
  bool accessOtpRequest = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // _otpTimeInMS = DateTime.now().millisecondsSinceEpoch +
    //     1000 * int.parse(widget.timeout) * 60;
    // otpValues = List<dynamic>.filled(otpLength, '', growable: false);
    dbDevice = DBDevice();
    super.initState();
    // getDevice();
  }

  Devices getdeviceall = Devices();

  void getDevice() async {
    String udid = await FlutterUdid.udid;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await device1.androidInfo;
      getdeviceall.name = androidInfo.device;
      getdeviceall.platform = androidInfo.product;
      getdeviceall.version = androidInfo.version.release;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await device1.iosInfo;
      getdeviceall.name = iosInfo.name;
      getdeviceall.platform = iosInfo.systemName;
      getdeviceall.version = iosInfo.systemVersion;
    }
    await getDeviceStatus(udid);
  }

  get _gettime {
    return CountdownTimer(
      onEnd: () => {},
      endTime: endTime,
      widgetBuilder: (context, time) {
        return Text(
          time?.min == null
              ? time?.sec == null
                  ? '0:00'
                  : time!.sec! < 10
                      ? '0:0${time.sec}'
                      : '0:${time.sec}'
              : time!.sec! < 10
                  ? '${time.min}:0${time.sec}'
                  : '${time.min}:${time.sec}',
          style: CustomTextStyle.dataHeadTitleTxt(context, 0),
        );
      },
    );
  }

  getDeviceStatus(udid) {
    var obj =
        '{"mode": "1","imei":"$udid","membership_no":"${widget.membership_no}","platform":"${getdeviceall.platform} ","model":"${getdeviceall.name}(${getdeviceall.version})","phone":"${widget.phone_no}"}';

    var ObjAuth1 = '';

    Network.fetchDeviceStatus(obj, context).then((value) => {
          ObjAuth1 = '{"pass":"","mode": "8","membership_no":"' +
              widget.membership_no +
              '"}',
          Network.fetchAuthCount(ObjAuth1).then((v1) => {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Pins(
                        gettitle: 'setPassword',
                      ),
                    ),
                    (Route<dynamic> route) => false)
              }),
        });
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    txtPhone = TextEditingController()
      ..text = MyClass.formatNumberPhoneX(widget.phone_no);
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: CustomUIPro.appbarUi1(),
      body: Stack(
        children: [
          Container(
            decoration: MyWidget.bgApp(),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: tabletMode
                        ? displayHeight(context) * 0.2
                        : displayHeight(context) * 0.2,
                  ),
                  Column(
                    children: [
                      Center(
                          child: Text(
                        'ยืนยันรหัส OTP',
                        textAlign: TextAlign.center,
                        textScaleFactor: MyClass.fontSizeApp(),
                        style: CustomTextStyle.titlePinTxt(context, 0, 'Bl'),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Text(
                          'กรอกหมายเลขโทรศัพย์มือถือของคุณ\nเพื่อรับรหัส OTP รหัสจะถูกส่งไปยังกล่องข้อความในโทรศัพท์ของคุณ',
                          textAlign: TextAlign.center,
                          textScaleFactor: MyClass.fontSizeApp(),
                          style: CustomTextStyle.titlePinTxt(context, -5, 'Bl'),
                        ),
                      )),
                      lineSizedBox(context, -10),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 0, bottom: 0),
                        child: MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                            textScaleFactor: MyClass.fontSizeApp(),
                          ),
                          child: TextFormField(
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            // controller: txtPhone,
                            enabled: true,
                            textAlign: TextAlign.center,
                            style: CustomTextStyle.defaultpdpaTxt(context, 0),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: '08x-xxx-xxxx',
                              // labelText: Language.loanLg('member', lgs),
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
                              contentPadding: const EdgeInsets.all(0),
                              border: const OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return _validatePhoneNo(value);
                            },
                            onChanged: (value) => widget.phone_no = value,
                            // onSaved: (String? value) {
                            //   widget.phone_no = value!;
                            // },
                          ),
                        ),
                      ),
                    ],
                  ),
                  lineSizedBox(context, 0),
                  _onSubmit()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _validatePhoneNo(value) {
    if (value.isEmpty) {
      return 'กรุณากรอกหมายเลขโทรศัพท์';
    }
  }

  Widget _onSubmit() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: displayWidth(context) * 0.75,
          height: displayHeight(context) * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: LinearGradient(
              colors: <Color>[
                MyColor.color('buttongra'),
                MyColor.color('buttongra1'),
              ],
            ),
          ),
          padding: const EdgeInsets.only(right: 5),
          child: InkWell(
            onTap: (() {
              Timer(const Duration(seconds: 2), () {
                accessOtpRequest = true;
              });
              if (accessOtpRequest) {
                setState(() {
                  refno = 'xxxxx';
                  // value[0]['refno'];
                  // tokenOtp = value[0]['token'];
                  endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 300;
                });

                _showAlert(
                    'รหัส OTP ได้ส่งไปที่เบอร์โทรศัพท์\n ${widget.phone_no} ของคุณแล้ว\nกรุณากรอก OTP\n(Ref: $refno)',
                    context,
                    'th');

                /* NetworkPro.fetchSentOtp(
                        '{"MobileNumber": "${widget.phone_no}"}',
                        widget.param.token,
                        context)
                    .then((value) {
                  if (value[0]['status'] == 'success') {
                    setState(() {
                      refno = value[0]['refno'];
                      tokenOtp = value[0]['token'];
                      endTime =
                          DateTime.now().millisecondsSinceEpoch + 1000 * 300;
                    });
                    _showAlert(
                        'รหัส OTP ได้ส่งไปที่เบอร์โทรศัพท์\n${MyClass.formatNumberPhoneX(widget.phone_no)} ของคุณแล้ว\nกรุณากรอก OTP\n(Ref: ${value[0]['refno']})',
                        context,
                        'th');
                  } else {
                    MyClass.showToast('otp error');
                  }
                });*/
                accessOtpRequest = false;
              }
            }),

            // _submit,
            child: Center(
              child: Text(
                'รับรหัส OTP',
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.buttonTxt(context, 3),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Timer(const Duration(seconds: 2), () {
        accessOtpRequest = true;
      });
      if (accessOtpRequest) {
        setState(() {
          refno = 'xxxxx';
          // value[0]['refno'];
          // tokenOtp = value[0]['token'];
          endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 300;
        });
        _showAlert(
            'รหัส OTP ได้ส่งไปที่เบอร์โทรศัพท์\n${MyClass.formatNumberPhoneX(widget.phone_no)} ของคุณแล้ว\nกรุณากรอก OTP\n(Ref: $refno)',
            context,
            'th');

        /* NetworkPro.fetchSentOtp(
                        '{"MobileNumber": "${widget.phone_no}"}',
                        widget.param.token,
                        context)
                    .then((value) {
                  if (value[0]['status'] == 'success') {
                    setState(() {
                      refno = value[0]['refno'];
                      tokenOtp = value[0]['token'];
                      endTime =
                          DateTime.now().millisecondsSinceEpoch + 1000 * 300;
                    });
                    _showAlert(
                        'รหัส OTP ได้ส่งไปที่เบอร์โทรศัพท์\n${MyClass.formatNumberPhoneX(widget.phone_no)} ของคุณแล้ว\nกรุณากรอก OTP\n(Ref: ${value[0]['refno']})',
                        context,
                        'th');
                  } else {
                    MyClass.showToast('otp error');
                  }
                });*/
        accessOtpRequest = false;
      }
    } else {}
  }

  _showAlert(desc, context, lgs) {
    Alert(
      context: context,
      // type: AlertType.success,
      style: AlertStyle(
          descStyle: CustomTextStyle.dataHeadTitleCTxt(context, -1, 'Bl'),
          alertBorder: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)))),
      title: "",
      desc: desc,
      onWillPopActive: true,
      useRootNavigator: false,
      content: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            _gettime,
            lineSizedBox(context, -20),
            TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(6)],
              textAlign: TextAlign.center,
              style: CustomTextStyle.defaultTxtColor(context, 0, 'Bl'),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'xxxxxx',
                labelStyle:
                    TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyColor.color('TextFormFieldBorderSide'),
                    width: 2.0,
                  ),
                ),
                contentPadding: const EdgeInsets.all(0),
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                return null;
              },
              onChanged: (value) => otp = value,
            ),
            lineSizedBox(context, -20),
          ],
        ),
      ),
      buttons: [
        DialogButton(
          onPressed: () => {
            Navigator.pop(context),
            print("validate"),
            validateOtp(otp),
          },
          color: Colors.transparent,
          child: Container(
            width: displayWidth(context) * 0.45,
            height: displayHeight(context) * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: LinearGradient(
                colors: <Color>[
                  MyColor.color('buttongra'),
                  MyColor.color('buttongra1'),
                ],
              ),
            ),
            padding: const EdgeInsets.only(right: 5),
            child: Center(
              child: Text(
                'ยืนยัน OTP',
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.buttonTxt(context, 1),
              ),
            ),
          ),
        ),
      ],
    ).show();
  }

  _showAlertWarning(desc, context, lgs) {
    Alert(
      context: context,
      // type: AlertType.success,
      style: AlertStyle(
          descStyle: CustomTextStyle.dataHeadTitleCTxt(context, -1, 'R'),
          alertBorder: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)))),
      title: "",
      desc: desc,
      onWillPopActive: true,
      useRootNavigator: false,
      content: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            _gettime,
            lineSizedBox(context, -20),
            TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(6)],
              textAlign: TextAlign.center,
              style: CustomTextStyle.defaultTxtColor(context, 0, 'Bl'),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'xxxxxx',
                labelStyle:
                    TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyColor.color('TextFormFieldBorderSide'),
                    width: 2.0,
                  ),
                ),
                contentPadding: const EdgeInsets.all(0),
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                return null;
              },
              onChanged: (value) => otp = value,
            ),
            lineSizedBox(context, -20),
          ],
        ),
      ),
      buttons: [
        DialogButton(
          onPressed: () => {
            Navigator.pop(context),
            validateOtp(otp),
          },
          color: Colors.transparent,
          child: Container(
            width: displayWidth(context) * 0.45,
            height: displayHeight(context) * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: LinearGradient(
                colors: <Color>[
                  MyColor.color('buttongra'),
                  MyColor.color('buttongra1'),
                ],
              ),
            ),
            padding: const EdgeInsets.only(right: 5),
            child: Center(
              child: Text(
                'ยืนยัน OTP',
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.buttonTxt(context, 1),
              ),
            ),
          ),
        ),
      ],
    ).show();
  }

  validateOtp(String? otp) async {
    print("validateOtp");

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return MyClass.loading();
      },
    );
    await Future.delayed(const Duration(milliseconds: 1500));
    _getVerifyOtp(otp);
    // await Future.delayed(const Duration(milliseconds: 15000));
  }

  _getVerifyOtp(otp) {
    var Obj = '{"Pin": "${otp}","Token":"${widget.token_otp}"}';
    print("_getVerifyOtp");
    print(otp.toString());
    Navigator.of(context, rootNavigator: true).pop('dialog');

    if (otp == '123123') {
      print("otp check");
      getDevice();

      // getDeviceStatus();
    } else {
      _showAlertWarning('OTP ไม่ถูกต้อง\nกรุณากรอก OTP อีกครั้ง\n(Ref: $refno)',
          context, 'th');
    }
    /* NetworkPro.fetchVerifyOtp(
            '{"Token": "$tokenOtp","Pin": "$otp"}', widget.param.token, context)
        .then((value) {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      try {
        if (value[0]['status'] == 'success') {
          getDevice();
          // getDeviceStatus();
        } else {
          _showAlertWarning(
              'OTP ไม่ถูกต้อง\nกรุณากรอก OTP อีกครั้ง\n(Ref: $refno)',
              context,
              'th');
        }
      } catch (e) {
        _showAlertWarning(
            'OTP ไม่ถูกต้อง\nกรุณากรอก OTP อีกครั้ง\n(Ref: $refno)',
            context,
            'th');
      }
    });*/
    // Navigator.of(context, rootNavigator: true).pop('dialog');
    // if (otp == '123123') {
    //   getDeviceStatus();
    // } else {
    //   _showAlert('OTP ไม่ถูกต้อง\nกรุณากรอก OTP อีกครั้ง\n(Ref: Q12345)',
    //       context, 'th');
    // }
  }
}
