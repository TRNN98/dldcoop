import 'dart:io';

import 'package:flutter/services.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/id_card_formatter.dart';
import 'package:dldcoop/FollowMe/pages/auth/checkRegister.dart';
import 'package:dldcoop/FollowMe/pages/auth/login.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../class/language.dart';
import '../../class/myclass.dart';
import '../../class/mycolor.dart';
import '../../class/sizes.dart';
import '../../class/textstyle.dart';

String lgs1 = '';
String xxx = '';
final format = DateFormat("y-MMM-d");
var txtUser = TextEditingController();
// var txtDate = '';
var txtDate = TextEditingController();

// TextEditingController txtDate;
class UserReFo {
  UserReFo() {
    user = '';
    idcard = '';
    date = '';
    password = '';
    conPassword = '';
    name = '';
    last_name = '';
  }

  String? user;
  String? idcard;
  String? date;
  String? password;
  String? conPassword;
  String? name;
  String? last_name;
}

UserReFo userrefo = UserReFo();

class Reandfo extends StatefulWidget {
  String? title;
  String? sex;
  String? member;
  String? idcard;
  String? brithDate;
  String? lgs;
  String? name;
  String? last_name;

  Reandfo(
      {this.title,
      this.sex,
      this.member,
      this.idcard,
      this.brithDate,
      this.lgs,
      this.name,
      this.last_name});

  @override
  _ReandfoState createState() => _ReandfoState();
}

class _ReandfoState extends State<Reandfo> {
  final _formKey = GlobalKey<FormState>();

  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  late DateTime dateTime;
  late Duration duration;

  // text = 'Your initial value';
  String imgprofile = '';

  @override
  Widget build(BuildContext context) {
    bool platformandroid = MyClass.checkPlatform();
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    // lgs1 = widget.lgs;
    txtUser = TextEditingController()..text = widget.member.toString();
    if (widget.sex == 'M') {
      imgprofile = 'assets/image/logo.png';
    } else {
      imgprofile = 'assets/image/logo.png';
    }
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: [
              // Container(
              //   child: ClipPath(
              //     clipper: DiagonalPathClipperTwo(),
              //     child: Container(
              //       height: displayHeight(context) * 0.20,
              //       color: MyColor.color('colorheader'),
              //     ),
              //   ),
              // ),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 25),
                child: Column(),
              ),
              Container(
                height: double.infinity,
                decoration: MyClass.backGround(context),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: tabletMode
                            ? displayHeight(context) * 0.07
                            : Platform.isAndroid
                                ? displayHeight(context) * 0.03
                                : displayHeight(context) * 0.05,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                widget.title.toString() == 'ลงทะเบียนเปิดใช้งาน'
                                    ? Language.reandfo("regis", "th")
                                    : Language.reandfo("forget", "th"),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.subTitleTxt(
                                    context, platformandroid == true ? 3 : 8),
                              ),
                            ),
                            Center(
                              child: Text(
                                widget.title.toString() == 'ลงทะเบียนเปิดใช้งาน'
                                    ? Language.reandfo("regis", "en")
                                    : Language.reandfo("forget", "en"),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.subTitleTxt(
                                    context, platformandroid == true ? -7 : 0),
                              ),
                            ),
                            Padding(
                              padding: tabletMode
                                  ? const EdgeInsets.only(
                                      top: 50, left: 55, bottom: 5)
                                  : const EdgeInsets.only(
                                      top: 50, left: 35, bottom: 5),
                              child: Text(
                                Language.loginLg('member', widget.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.defaultTxt1(
                                    context, -1, 'Bl'),
                              ),
                            ),
                            _user(txtUser, context, widget.lgs),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 35, bottom: 5),
                              child: Text(
                                "",
                                // Language.loginLg('memberDetail', widget.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.defaultTxt1(
                                    context, -4, 'Bl'),
                              ),
                            ),
                            Padding(
                              padding: tabletMode
                                  ? const EdgeInsets.only(left: 55)
                                  : const EdgeInsets.only(left: 35),
                              child: Text(
                                Language.loginLg('idCard', widget.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.defaultTxt1(
                                    context, -1, 'Bl'),
                              ),
                            ),
                            _idCard(context, widget.lgs),
                            Padding(
                              padding: tabletMode
                                  ? const EdgeInsets.only(left: 55, bottom: 20)
                                  : const EdgeInsets.only(left: 35, bottom: 20),
                              child: Text(
                                Language.loginLg('idCardDetail', widget.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.defaultTxt1(
                                    context, tabletMode ? -10 : -3, 'R'),
                              ),
                            ),
                            Padding(
                              padding: tabletMode
                                  ? const EdgeInsets.only(left: 55)
                                  : const EdgeInsets.only(left: 35),
                              child: Text(
                                Language.loginLg('birthday', widget.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.defaultTxt1(
                                    context, -1, 'Bl'),
                              ),
                            ),
                            _date(txtDate, context, widget.lgs),
                            Padding(
                              padding: tabletMode
                                  ? const EdgeInsets.only(left: 55)
                                  : const EdgeInsets.only(left: 35),
                              child: Text(
                                Language.loginLg('birthDayDetail', widget.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.defaultTxt1(
                                    context, tabletMode ? -10 : -3, 'R'),
                              ),
                            ),
                            lineSizedBox(context, 0),
                            // end mobile
                            Padding(
                              padding: tabletMode
                                  ? const EdgeInsets.only(left: 55)
                                  : const EdgeInsets.only(left: 35),
                              child: Text(
                                Language.loginLg('password', widget.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.defaultTxt1(
                                    context, -1, 'Bl'),
                              ),
                            ),
                            _password(context, widget.lgs),
                            Padding(
                              padding: tabletMode
                                  ? const EdgeInsets.only(left: 55, right: 55)
                                  : const EdgeInsets.only(left: 35, right: 35),
                              child: Text(
                                Language.loginLg('passwordDetail', widget.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.defaultTxt1(
                                    context, tabletMode ? -10 : -4, 'R'),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 35),
                            //   child: Text(
                            //     Language.pinLg('confirmPasswords', widget.lgs),
                            //     textScaleFactor: MyClass.fontSizeApp(),
                            //     style: CustomTextStyle.defaultTxt1(
                            //         context, -3, 'Bl'),
                            //   ),
                            // ),
                            _confpassword(context, widget.lgs),
                            Padding(
                              padding: tabletMode
                                  ? const EdgeInsets.only(left: 55)
                                  : const EdgeInsets.only(left: 35),
                              child: Text(
                                Language.loginLg(
                                    'pleaseConfirmPassword', widget.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.defaultTxt1(
                                    context, tabletMode ? -10 : -3, 'R'),
                              ),
                            ),
                            lineSizedBox(context, 0),
                            _onLogin(widget.title, context),
                            lineSizedBox(context, 0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomUI.appbarBackgroundUi(context),
              // CustomUI.appbarTxtTitleUi(Language.loginLg(widget.title, widget.lgs), context),
              //CustomUI.appbarDetailUi1(imgprofile, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget dateImg(context) {
    return TextButton(
        onPressed: () {
          setState(() async {
            DateTime? newDateTime = await DatePicker.showDatePicker(
              context,
              locale: LocaleType.th,
              minTime: DateTime((DateTime.now().year + 543) - 100),
              maxTime: DateTime(DateTime.now().year + 543),
            );
            if (newDateTime != null) {
              String date = '';
              date = newDateTime.day.toString() +
                  '/' +
                  newDateTime.month.toString() +
                  '/' +
                  (newDateTime.year).toString();
              txtDate = TextEditingController()..text = date;
            }
            setState(() {});
          });
        },
        child: Image.asset("assets/imgs/date.png"));
  }

  Widget _onLogin(title, context) {
    return Row(
      children: [
        const Expanded(
          child: Text(''),
        ),
        Container(
          width: displayWidth(context) * 0.30,
          height: displayHeight(context) * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
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
                  builder: (context) => Checkregister(title: title, lgs: lgs1),
                ),
              );
            },
            child: Center(
              child: Text(
                Language.loginLg('cancel', widget.lgs),
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.defaultTxt1(context, 3, 'R'),
              ),
            ),
          ),
        ),
        const Expanded(
          child: Text(''),
        ),
        Container(
          width: displayWidth(context) * 0.3,
          height: displayHeight(context) * 0.05,
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
                Language.loginLg('save', widget.lgs),
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.defaultTxt1(context, 3, 'ButtonBl'),
              ),
            ),
          ),
        ),
        const Expanded(
          child: Text(''),
        ),
      ],
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (widget.idcard != userrefo.idcard) {
        MyClass.showToast(Language.loginLg('invalidIDCard', widget.lgs));
      } else if (userrefo.password != userrefo.conPassword) {
        MyClass.showToast(Language.loginLg('invalidConPassword', widget.lgs));
      } else if (MyClass.formatDate(userrefo.date) != widget.brithDate) {
        MyClass.showToast(Language.loginLg('invalidBirthday', widget.lgs));
      } else {
        if (widget.title == Language.loginLg('memberRegis', widget.lgs)) {
          // ignore: prefer_interpolation_to_compose_strings
          Network.fetchAuthRe('{"membership_no": "' +
                  userrefo.user! +
                  '","mem_password":"' +
                  userrefo.password! +
                  '","id_card":"' +
                  userrefo.idcard! +
                  '","date_of_birth":"' +
                  MyClass.formatDateC(widget.brithDate) +
                  '"}')
              .then((value) => {
                    print(MyClass.json(value)[0]['rc_code']),
                    _onLoginsRe(value, context, widget.lgs),
                  });
          showDialog(
            barrierDismissible: false,
            context: context,
            useRootNavigator: false,
            builder: (BuildContext context) {
              return MyClass.loading();
            },
          );
        } else {
          // ignore: prefer_interpolation_to_compose_strings
          Network.fetchAuthFo('{"membership_no": "' +
                  userrefo.user! +
                  '","mem_password":"' +
                  userrefo.password! +
                  '","id_card":"' +
                  userrefo.idcard! +
                  '","date_of_birth":"' +
                  MyClass.formatDateC(widget.brithDate) +
                  '"}')
              .then((value) => {
                    _onLoginsFo(value, context, widget.lgs),
                  });
          showDialog(
            barrierDismissible: false,
            context: context,
            useRootNavigator: false,
            builder: (BuildContext context) {
              return MyClass.loading();
            },
          );
        }
      }
    }
  }

  Padding _password(context, lgs) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: tabletMode
          ? const EdgeInsets.only(left: 55, right: 55, top: 10, bottom: 5)
          : const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 5),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: MyClass.fontSizeApp(),
        ),
        child: TextFormField(
          textAlign: TextAlign.start,
          style: CustomTextStyle.defaultpdpaTxt(context, 0),
          decoration: InputDecoration(
            errorStyle: const TextStyle(height: 0),
            hintText: Language.loginLg('password', widget.lgs),
            fillColor: Colors.white,
            filled: true,
            // labelText: Language.loginLg('password', lgs),
            labelStyle:
                TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyColor.color('TextFormFieldBorderSide'),
                width: 2.0,
              ),
            ),
            border: OutlineInputBorder(),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: _obscureText == true
                    ? Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                        size: tabletMode ? 40 : 20,
                      )
                    : Icon(
                        Icons.visibility,
                        color: Colors.blue.shade600,
                        size: tabletMode ? 40 : 20,
                      ),
                onPressed: () {
                  _toggle();
                },
              ),
            ),
          ),
          obscureText: _obscureText,
          validator: (value) {
            return _validatPassword(value);
          },
          onSaved: (value) {
            userrefo.password = value;
          },
        ),
      ),
    );
  }

  Padding _confpassword(context, lgs) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: tabletMode
          ? const EdgeInsets.only(left: 55, right: 55, top: 10, bottom: 5)
          : const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 5),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: MyClass.fontSizeApp(),
        ),
        child: TextFormField(
          textAlign: TextAlign.start,
          style: CustomTextStyle.defaultpdpaTxt(context, 0),
          decoration: InputDecoration(
            errorStyle: const TextStyle(height: 0),
            hintText: Language.pinLg('confirmPasswords', widget.lgs),
            fillColor: Colors.white,
            filled: true,
            // labelText: Language.loginLg('confirmPassword', lgs),
            labelStyle:
                TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyColor.color('TextFormFieldBorderSide'),
                width: 2.0,
              ),
            ),
            border: OutlineInputBorder(),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: _obscureText == true
                    ? Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                        size: tabletMode ? 40 : 20,
                      )
                    : Icon(
                        Icons.visibility,
                        color: Colors.blue.shade600,
                        size: tabletMode ? 40 : 20,
                      ),
                onPressed: () {
                  _toggle();
                },
              ),
            ),
          ),
          obscureText: _obscureText,
          validator: (value) {
            return _validatConPassword(value);
          },
          onSaved: (value) {
            userrefo.conPassword = value;
          },
        ),
      ),
    );
  }
}

_onLoginsRe(value, context, lgs) {
  print(MyClass.json(value)[0]['rc_code']);
  try {
    if (MyClass.json(value)[0]['rc_code'] == '1') {
      MyClass.showToast(Language.loginLg('regisok', "th"));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Login(lgs: lgs1),
        ),
      );
    } else {
      MyClass.showToast(Language.loginLg('registrationFailed', lgs));
    }
  } catch (e) {
    MyClass.showToast(Language.loginLg('registrationFailed', lgs));
  }
}

_onLoginsFo(value, context, lgs) {
  try {
    if (MyClass.json(value)[0]['rc_code'] == '1') {
      MyClass.showToast(Language.loginLg('forgetok', "th"));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Login(lgs: lgs1),
        ),
      );
    } else {
      MyClass.showToast(Language.loginLg('passwordChangeUnsuccessful', lgs));
    }
  } catch (e) {
    MyClass.showToast(Language.loginLg('passwordChangeUnsuccessful', lgs));
  }
}

_validatPassword(value) {
  RegExp regex = RegExp(r'^(?=.*?[A-z])(?=.*?[0-9]).{6,}$');
  if (value.length <= 5 || !regex.hasMatch(value)) {
    return '';
  } else if (value.isEmpty) {
    return
        //  MyClass.showToast(Language.loginLg('passwordAlert', lgs1));
        Language.loginLg('passwordAlert', lgs1);
  }
}

_validatConPassword(value) {
  RegExp regex = RegExp(r'^(?=.*?[A-z])(?=.*?[0-9]).{6,}$');
  if (value.length <= 5 || !regex.hasMatch(value)) {
    return '';
    // Language.loginLg('pleaseConfirmPassword', lgs1);
  } else if (value.isEmpty) {
    return '';
    //  Language.loginLg('passwordAlert', lgs1);
  }
}

Padding _user(txtUser, context, lgs) {
  bool tabletMode = MediaQuery.of(context).size.width > 600;
  return Padding(
    padding: tabletMode
        ? const EdgeInsets.only(left: 55, right: 55, top: 10, bottom: 5)
        : const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 0),
    child: MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: MyClass.fontSizeApp(),
      ),
      child: TextFormField(
        controller: txtUser,
        enabled: false,
        textAlign: TextAlign.start,
        style: CustomTextStyle.defaultpdpaTxt(context, 0),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          // labelText: Language.loanLg('member', lgs),
          labelStyle: TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColor.color('TextFormFieldBorderSide'),
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          return _validatUser(value);
        },
        onSaved: (value) {
          userrefo.user = MyClass.genmember(value);
        },
      ),
    ),
  );
}

_validatUser(value) {
  if (value.isEmpty) {
    return Language.loginLg('memberDetail', lgs1);
  }
}

Padding _idCard(context, lgs) {
  bool tabletMode = MediaQuery.of(context).size.width > 600;
  return Padding(
    padding: tabletMode
        ? const EdgeInsets.only(left: 55, right: 55, top: 10, bottom: 5)
        : const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 5),
    child: MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: MyClass.fontSizeApp(),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(17),
          IdCardFormatter()
        ],
        textAlign: TextAlign.start,
        // maxLength: 13,
        style: CustomTextStyle.defaultpdpaTxt(context, 0),
        // keyboardType: TextInputType.number,
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0),
          hintText: Language.loginLg('idCardFormat', lgs),
          fillColor: Colors.white,
          filled: true,
          // labelText: Language.loginLg('idCard', lgs),
          labelStyle: TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColor.color('TextFormFieldBorderSide'),
              width: 2.0,
            ),
          ),
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          return _validatIdCard(value);
        },
        onSaved: (value) {
          userrefo.idcard = value.toString().replaceAll('-', '');
        },
      ),
    ),
  );
}

_validatIdCard(value) {
  if (value.isEmpty) {
    return '';
    // Language.loginLg('idCardDetail', lgs1);
  } else if ((value.toString().replaceAll('-', '')).length <= 12) {
    return '';
    // Language.loginLg('idCardDetail', lgs1);
  }
}

_getdate(context) async {
  DateTime? newDateTime = await DatePicker.showDatePicker(
    context,
    locale: LocaleType.th,
    minTime: DateTime((DateTime.now().year + 543)),
    maxTime: DateTime(DateTime.now().year + 543),
  );
  if (newDateTime != null) {
    String date = '';
    date = newDateTime.day.toString() +
        '/' +
        newDateTime.month.toString() +
        '/' +
        (newDateTime.year).toString();
    // txtDate.addListener(date);
    // txtDate = date;

    txtDate = TextEditingController()..text = date;
  }
  // setState(() {});
}

Padding _date(txtDate, context, lgs) {
  bool tabletMode = MediaQuery.of(context).size.width > 600;
  return Padding(
    padding: tabletMode
        ? const EdgeInsets.only(left: 55, right: 55, top: 10, bottom: 5)
        : const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 5),
    child: MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: MyClass.fontSizeApp(),
      ),
      child: TextFormField(
        onTap: () async {
          DateTime? newDateTime = await DatePicker.showDatePicker(
            context,
            locale: LocaleType.th,
            maxTime: DateTime(DateTime.now().year + 543),
            minTime: DateTime((DateTime.now().year + 543) - 100),
          );
          if (newDateTime != null) {
            String date = '';
            date = newDateTime.day.toString() +
                '/' +
                newDateTime.month.toString() +
                '/' +
                (newDateTime.year).toString();
            // txtDateFrom = TextEditingController()..text = date;
            txtDate.text = date;
          }
        },
        controller: txtDate,
        readOnly: true,
        textAlign: TextAlign.start,
        style: CustomTextStyle.defaultpdpaTxt(context, 0),
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0),
          hintText: "01/01/2530",
          fillColor: Colors.white,
          filled: true,
          // labelText: Language.loginLg('birthday', lgs),
          labelStyle: TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColor.color('TextFormFieldBorderSide'),
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          return _validatDate(value);
        },
        onSaved: (value) {
          userrefo.date = value;
        },
      ),
    ),
  );
}

_validatDate(value) {
  if (value.isEmpty) {
    return '';
    //  Language.loginLg('birthDayDetail', lgs1);
  }
}
