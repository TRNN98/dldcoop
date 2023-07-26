import 'dart:io';
import 'dart:ui';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/pages/auth/reandfo.dart';
// import 'package:dldcoop/ProMoney/class/languagepro.dart';
// import 'package:dldcoop/ProMoney/locals/device.dart';
// import 'package:dldcoop/ProMoney/models/sql/deviceDB.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import '../../services/netword.dart';
import 'login.dart';

class Otp extends StatefulWidget {
  String type;
  String token_otp;
  String refno;
  String timeout;
  String phone_no;
  String lgs;
  String title;
  String sex;
  String member;
  String idcard;
  String birthDate;
  String name;
  String last_name;

  Otp(
      {required this.type,
      required this.token_otp,
      required this.refno,
      required this.timeout,
      required this.phone_no,
      required this.lgs,
      required this.title,
      required this.sex,
      required this.member,
      required this.idcard,
      required this.birthDate,
      required this.name,
      required this.last_name});

  @override
  _OtpState createState() => _OtpState();
}

class Devices {
  DeviceInfo() {
    this.name = '';
    this.platform = '';
    this.version = '';
    this.model = '';
  }

  String? name;
  String? platform;
  String? version;
  String? model;
}

DeviceInfoPlugin device1 = DeviceInfoPlugin();

class _OtpState extends State<Otp> {
  late var _screenSize;
  int _currentDigit = 6;
  late List<dynamic> otpValues;
  bool showLoadingButton = false;
  int otpLength = 6;
  late Color keyboardBackgroundColor;
  late bool tabletMode;
  String _countDownSendClose = '';

  // OTPCountDown _otpCountDown;
  // OTPCountDown _otpSendClose;
  late int _otpTimeInMS;
  late int _otpSendCloseTimeInMS;

  // Devices getdeviceall = Devices();

  void onEnd() {
    print('ok');
  }

  // DeviceDb dv = DeviceDb();
  // late DBDevice dbDevice;

  // void getDevice() async {
  //   if (Platform.isAndroid) {
  //     AndroidDeviceInfo androidInfo = await device1.androidInfo;
  //     getdeviceall.name = androidInfo.device;
  //     getdeviceall.platform = androidInfo.product;
  //     getdeviceall.version = androidInfo.version.release;
  //     getdeviceall.model = androidInfo.id;
  //     getDeviceStatus();
  //   } else if (Platform.isIOS) {
  //     IosDeviceInfo iosInfo = await device1.iosInfo;
  //     getdeviceall.name = iosInfo.name;
  //     getdeviceall.platform = iosInfo.systemName;
  //     getdeviceall.version = iosInfo.systemVersion;
  //     getdeviceall.model = iosInfo.identifierForVendor;
  //     getDeviceStatus();
  //   }
  //   // setState(() {});
  // }

  // getDeviceStatus() {
  //   var ObjAuth1 = '';
  //   var Obj = '{"mode": "1","imei":"' +
  //       getdeviceall.model.toString() +
  //       '","platform":"' +
  //       getdeviceall.platform.toString() +
  //       ' ","model":"' +
  //       getdeviceall.name.toString() +
  //       '(' +
  //       getdeviceall.version.toString() +
  //       ')' +
  //       '","phone":"' +
  //       widget.phone_no +
  //       '","bank":"' +
  //       '' +
  //       '","type":"' +
  //       '' +
  //       '","membership_no":"' +
  //       widget.membership_no +
  //       '"}';
  //   Network.fetchDeviceStatus(Obj, context).then((value) => {
  //         ObjAuth1 = '{"pass":"","mode": "8","membership_no":"' +
  //             widget.membership_no +
  //             '"}',
  //         Network.fetchAuthCount(ObjAuth1).then((v1) => {
  //               Navigator.pushAndRemoveUntil(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (BuildContext context) => Pins(
  //                       gettitle: 'setPassword',
  //                     ),
  //                   ),
  //                   (Route<dynamic> route) => false)
  //             }),
  //       });
  // }

  @override
  void initState() {
    _otpTimeInMS = DateTime.now().millisecondsSinceEpoch +
        1000 * int.parse(widget.timeout) * 60;
    _otpSendCloseTimeInMS = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
    otpValues = List<dynamic>.filled(otpLength, '', growable: false);
    // dbDevice = DBDevice();
    super.initState();
  }

  @override
  void dispose() {
    // _otpCountDown.cancelTimer();
    // _otpSendClose.cancelTimer();
    // dbDevice.close();
    super.dispose();
  }

  validateOtp(String otp) async {
    _getVerifyOtp(otp);
    await Future.delayed(Duration(milliseconds: 15000));
  }

  _getVerifyOtp(otp) {
    var Obj = '{"Pin": "${otp}","Token":"${widget.token_otp}"}';
    Network.fetchVerifyOtp(Obj).then(
      (value) => {
        if (value[0]['status'] == 'success')
          {
            print(widget.title),
            print(widget.sex),
            print(widget.member),
            print(widget.idcard),
            print(widget.birthDate),
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Reandfo(
                    title: widget.title,
                    sex: widget.sex,
                    member: widget.member,
                    idcard: widget.idcard,
                    brithDate: widget.birthDate,
                    lgs: widget.lgs,
                    name: widget.name,
                    last_name: widget.last_name),
              ),
            )
          }
        else
          {
            MyClass.showToast('ใส่รหัส OTP ไม่ถูกต้อง'),
            clearOtp(),
            showLoadingButton = false
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    tabletMode = MediaQuery.of(context).size.width > 600;
    // print(MediaQuery.of(context).size.width );
    // print('asfdasdf');
    // _otpTextField
    // getDevice();
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              decoration: MyWidget.bgApp(),
              child: SingleChildScrollView(
                child: _getInputPart,
              )),
          CustomUI.appbarDetailUi2('assets/imgs/icon.png', context),
          // CustomUI.appbarUi(context),
        ],
      ),
    );
  }

  get _getInputPart {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: [
            tabletMode == true
                ? hSizedBox(context, 20)
                : hSizedBox(context, 30),
            Padding(
              padding: EdgeInsets.all(1),
              child: _getTitleText,
            ),
            Padding(
              padding: EdgeInsets.all(1),
              child: _getSubtitleText,
            ),
            Padding(
              padding: EdgeInsets.all(1),
              child: _gettime,
            ),
            Padding(
              padding: EdgeInsets.all(1),
              child: _requestOtp,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: _getInputField,
        ),
        showLoadingButton
            ? Center(child: CircularProgressIndicator())
            : Container(
                width: 0,
                height: 0,
              ),
        _getOtpKeyboard
      ],
    );
  }

  get _getOtpKeyboard {
    return Container(
        height: tabletMode == true
            ? _screenSize.width - 100
            : _screenSize.width - 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _otpKeyboardInputButton(
                    label: "1",
                    onPressed: () {
                      _setCurrentDigit(1);
                    }),
                _otpKeyboardInputButton(
                    label: "2",
                    onPressed: () {
                      _setCurrentDigit(2);
                    }),
                _otpKeyboardInputButton(
                    label: "3",
                    onPressed: () {
                      _setCurrentDigit(3);
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _otpKeyboardInputButton(
                    label: "4",
                    onPressed: () {
                      _setCurrentDigit(4);
                    }),
                _otpKeyboardInputButton(
                    label: "5",
                    onPressed: () {
                      _setCurrentDigit(5);
                    }),
                _otpKeyboardInputButton(
                    label: "6",
                    onPressed: () {
                      _setCurrentDigit(6);
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _otpKeyboardInputButton(
                    label: "7",
                    onPressed: () {
                      _setCurrentDigit(7);
                    }),
                _otpKeyboardInputButton(
                    label: "8",
                    onPressed: () {
                      _setCurrentDigit(8);
                    }),
                _otpKeyboardInputButton(
                    label: "9",
                    onPressed: () {
                      _setCurrentDigit(9);
                    }),
              ],
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    width: 80.0,
                  ),
                  _otpKeyboardInputButton(
                      label: "0",
                      onPressed: () {
                        _setCurrentDigit(0);
                      }),
                  _otpKeyboardActionButton(
                      label: Icon(
                        Icons.backspace,
                        size: tabletMode == true ? 60 : 30,
                      ),
                      onPressed: () {
                        setState(() {
                          for (int i = otpLength - 1; i >= 0; i--) {
                            if (otpValues[i] != '') {
                              otpValues[i] = '';
                              break;
                            }
                          }
                        });
                      }),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _otpKeyboardInputButton({label, onPressed}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(40.0),
        child: Container(
          height: tabletMode == true ? 150 : 60,
          width: 80.0,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: tabletMode == true ? 60 : 30,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _setCurrentDigit(int i) async {
    setState(() {
      _currentDigit = i;
      int currentField;

      for (currentField = 0; currentField < otpLength; currentField++) {
        if (otpValues[currentField] == '') {
          otpValues[currentField] = _currentDigit;
          break;
        }
      }

      if (currentField == otpLength - 1) {
        showLoadingButton = true;

        String otp = otpValues.join();

        validateOtp(otp).then((value) {
          showLoadingButton = false;
        });
      }
    });
  }

  _otpKeyboardActionButton({label, onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(40.0),
      child: Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Center(
          child: label,
        ),
      ),
    );
  }

  void clearOtp() {
    otpValues = List<dynamic>.filled(otpLength, '', growable: false);
    setState(() {});
  }

  get _getInputField {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: getOtpTextWidgetList(),
    );
  }

  List<Widget> getOtpTextWidgetList() {
    List<Widget> optList = [];
    for (int i = 0; i < otpLength; i++) {
      optList.add(_otpTextField(otpValues[i]));
    }
    return optList;
  }

  Widget _otpTextField(dynamic digit) {
    return Container(
      width: tabletMode == true ? 60 : 45,
      height: tabletMode == true ? 60 : 45,
      alignment: Alignment.center,
      child: Text(
        digit != null ? digit.toString() : "",
        style: TextStyle(
          fontSize: tabletMode == true ? 60 : 30,
        ),
      ),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 2.0,
      ))),
    );
  }

  get _getTitleText {
    return Text(Language.otpLg('verification', widget.lgs),
        style: CustomTextStyle.dataBoldBTxt(context, 3));
  }

  get _getSubtitleText {
    return Text(
      Language.otpLg('otp', widget.lgs) +
          MyClass.formatNumberPhoneX(widget.phone_no) +
          '\n(Ref: ${widget.refno})',
      style: CustomTextStyle.dataBoldBTxt(context, 1),
      textAlign: TextAlign.center,
    );
  }

  get _gettime {
    return CountdownTimer(
      onEnd: onEnd,
      // endWidget: onEnd,
      endTime: _otpTimeInMS,
      widgetBuilder: (_, time) {
        if (time == null) {
          return Text(Language.otpLg('time', widget.lgs) + '0.00',
              style: CustomTextStyle.dataBoldBTxt(context, 1));
        }
        return Text(
            Language.otpLg('time', widget.lgs) +
                ' ${time.min == null ? '0' : time.min}:${time.sec == null ? '0' : time.sec}',
            style: CustomTextStyle.dataBoldBTxt(context, 1));
      },
    );
  }

  _gettimeformat(time) {
    return (int.parse(time) / 60).toString();
  }

  get _gettimeSendClose {
    return Text(_countDownSendClose == '' ? '' : _countDownSendClose,
        style: CustomTextStyle.dataBoldBTxt(context, 1));
  }

  get _requestOtp {
    // return TimerButton(
    //   label: LanguagePro.otpLg('requestOtp', widget.param.lgs),
    //   timeOutInSeconds: 30,
    //   onPressed: () {
    //   },
    //   // disabledColor: Colors.grey,
    //   // color: Colors.blue,
    //   disabledTextStyle: CustomTextStylePro.defaultCTxt(context, 1,'gray'),
    //   activeTextStyle: CustomTextStylePro.defaultCTxt(context, 1,'blue'),
    //   buttonType: ButtonType.OutlineButton,
    // );
  }

//   return Column(
//     children: [
//       CountdownTimer(
//         endTime: _otpTimeInMS,
//         widgetBuilder: (_, time) {
//           if (time == null) {
//             return Text(LanguagePro.otpLg('time', widget.param.lgs) + '0.00',
//                 style: CustomTextStyle.dataBoldBTxt(context, 1));
//           }
//           return Text('');
//         },
//       ),
//       GestureDetector(
//         onTap: () {
//           _countDownSendClose == '' ? _getSendOtp() : null;
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Icon(
//             //   Icons.refresh,
//             //   color: Color(0xFF0000FF),
//             // ),
//             _countDownSendClose == null
//                 ? Text(LanguagePro.otpLg('requestOtp', widget.param.lgs),
//                     style: TextStyle(
//                         fontFamily: "FC_Lamoon",
//                         fontWeight: FontWeight.bold,
//                         fontSize: displayWidth(context) * 0.055 + 1,
//                         color: Color(0xFF00A1FA)))
//                 : Text(
//                     LanguagePro.otpLg('requestOtp', widget.param.lgs) +
//                         '(' +
//                         _otpSendCloseTimeInMS +
//                         ')',
//                     style: TextStyle(
//                         fontFamily: "FC_Lamoon",
//                         fontWeight: FontWeight.bold,
//                         fontSize: displayWidth(context) * 0.055 + 1,
//                         color: Color(0xFF808081))),
//           ],
//         ),
//       ),
//     ],
//   );
// }
}
