import 'dart:io';
import 'package:dldcoop/FollowMe/pages/auth/login.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/pages/auth/otp_reandfo.dart';
import 'package:dldcoop/FollowMe/pages/auth/reandfo.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';

class Checkregister extends StatefulWidget {
  String? title;
  String? lgs;
  Checkregister({this.title, this.lgs});
  @override
  _CheckregisterState createState() => _CheckregisterState();
}

class _CheckregisterState extends State<Checkregister> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String user = '';

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    title = widget.title!;
    return GestureDetector(
      onTap: (() {
        FocusScope.of(context).requestFocus(FocusNode());
      }),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: MyClass.backGround(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: tabletMode
                          ? displayHeight(context) * 0.01
                          : displayHeight(context) * 0.01,
                    ),
                    CustomUI.appbarBackgroundUi(context),
                    CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
                    Container(
                      padding:
                          EdgeInsets.only(top: displayHeight(context) * 0.025),
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
                          ? displayHeight(context) * 0.055
                          : displayHeight(context) * 0.055,
                    ),
                    Center(
                      child: Text(
                        title == "ลงทะเบียนเปิดใช้งาน"
                            ? Language.loginLg('newRegis', "th")
                            : Language.loginLg('forgotPassword', "th"),
                        textScaleFactor: MyClass.fontSizeApp(),
                        style: CustomTextStyle.dataHeadTitleCTxt(
                            context, 15, 'slide1'),
                      ),
                    ),
                    Center(
                      child: Text(
                        title == "ลงทะเบียนเปิดใช้งาน"
                            ? Language.loginLg('newRegis', "en")
                            : Language.loginLg('forgotPassword', "en"),
                        textScaleFactor: MyClass.fontSizeApp(),
                        style: CustomTextStyle.dataHeadTitleCTxt(
                            context, 0, 'slide1'),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: tabletMode
                                ? const EdgeInsets.only(
                                    left: 80, right: 80, top: 20, bottom: 0)
                                : const EdgeInsets.only(
                                    left: 30, right: 30, top: 20, bottom: 0),
                            child: MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                textScaleFactor: MyClass.fontSizeApp(),
                              ),
                              child: TextFormField(
                                // keyboardType:
                                //     const TextInputType.numberWithOptions(
                                //         decimal: false, signed: true),
                                textInputAction: TextInputAction.done,
                                style: CustomTextStyle.defaultTxt(context, 0),
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  errorStyle: const TextStyle(height: 0),
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
                                  hintText:
                                      Language.loginLg('member', widget.lgs),
                                  labelStyle: TextStyle(
                                      color: MyColor.color(
                                          'TextFormFieldTextStyle')),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                validator: (String? value) {
                                  return _validatUser(value);
                                },
                                onSaved: (String? value) {
                                  user = MyClass.genmember(value);
                                },
                              ),
                            ),
                          ),
                          lineSizedBox(context, -25),
                          Padding(
                            padding: tabletMode
                                ? const EdgeInsets.only(left: 80, right: 80)
                                : const EdgeInsets.only(
                                    left: 50, right: 30, bottom: 0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      Language.loginLg(
                                          'memberDetail', widget.lgs),
                                      textScaleFactor: MyClass.fontSizeApp(),
                                      style: CustomTextStyle.defaultTxt1(
                                          context, -2, 'R')),
                                ],
                              ),
                            ),
                          ),
                          hSizedBoxButton(context, 0),
                          _onSubmit(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _validatUser(String? value) {
    if ((value!.isEmpty) || (value.length < 5)) {
      return '';
      // Language.loginLg('memberDetail', widget.lgs);
    }
  }

  Widget _onSubmit() {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Column(
      children: [
        Container(
          width: tabletMode
              ? displayWidth(context) * 0.8
              : displayWidth(context) * 0.85,
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
                Language.loginLg('checkInformation', widget.lgs),
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.dataBoldTxtC(
                    context, tabletMode ? 10 : 1, 'Bl'),
              ),
            ),
          ),
        ),
        hSizedBoxButton(context, 0),
        Container(
          width: tabletMode
              ? displayWidth(context) * 0.8
              : displayWidth(context) * 0.85,
          height: displayHeight(context) * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            gradient: LinearGradient(
              colors: <Color>[
                MyColor.color('W'),
                MyColor.color('W'),
              ],
            ),
          ),
          padding: const EdgeInsets.only(left: 5),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Login(
                    lgs: widget.lgs,
                  ),
                ),
              );
            },
            child: Center(
              child: Text(
                Language.loginLg('cancel', widget.lgs),
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.dataBoldTxtC(
                    context, tabletMode ? 10 : 1, 'R'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _submit() {
    showDialog(
      barrierDismissible: false,
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return MyClass.loading();
      },
    );
    if (this._formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (title == Language.loginLg('forgotPassword', widget.lgs)) {
        var ObjAuth = '{"pass":"","mode": "1","membership_no":"' + user + '"}';
        Network.fetchAuth(ObjAuth).then((value) => {
              _oncheckfo(value),
            });
      } else {
        var ObjAuth = '{"pass":"","mode": "2","membership_no":"' + user + '"}';
        Network.fetchAuthReg(ObjAuth).then((value) => {
              _oncheckre(value),
            });
      }
    } else {
      Navigator.pop(context);
    }
  }

  // _oncheckfo(value) {
  //   Navigator.pop(context);
  //   if (MyClass.json(value)[0]['rc_code'].toString() == "1") {
  //     if (MyClass.json(value)[0]['member_status_code'].toString() != '3') {
  //       print('success');
  //       Navigator.of(context).pushReplacement(MaterialPageRoute(
  //           builder: (context) => Reandfo(
  //                 title: title,
  //                 sex: MyClass.json(value)[0]['sex'].toString(),
  //                 member: user,
  //                 idcard: MyClass.json(value)[0]['id_card'].toString(),
  //                 brithDate: MyClass.json(value)[0]['date_of_birth'].toString(),
  //                 lgs: widget.lgs,
  //                 name: MyClass.json(value)[0]['member_name'].toString(),
  //                 last_name:
  //                     MyClass.json(value)[0]['member_surname'].toString(),
  //               )));
  //     } else {
  //       MyClass.showToast('ไม่มีทะเบียนสมาชิก');
  //     }
  //   } else {
  //     MyClass.showToast(MyClass.json(value)[0]['rc_desc'].toString());
  //   }
  // }

  _oncheckfo(value) {
    if (MyClass.json(value)[0]['rc_code'].toString() == "1") {
      if (MyClass.json(value)[0]['member_status_code'].toString() != '3') {
        var m = '';
        var Obj = '';
        var Obj1 = '{"mode": "1","membership_no":"${user}"}';

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Reandfo(
                title: title,
                sex: MyClass.json(value)[0]['sex'].toString(),
                member: user,
                idcard: MyClass.json(value)[0]['id_card'].toString(),
                brithDate: MyClass.json(value)[0]['date_of_birth'].toString(),
                lgs: widget.lgs,
                name: MyClass.json(value)[0]['member_name'].toString(),
                last_name: MyClass.json(value)[0]['member_surname'].toString()),
          ),
        );
      } else {
        Navigator.pop(context);
        MyClass.showToast('ไม่มีทะเบียนสมาชิก');
      }
    } else {
      Navigator.pop(context);
      MyClass.showToast(MyClass.json(value)[0]['rc_desc'].toString());
    }
  }

  _oncheckre(value) {
    Navigator.pop(context);
    if (MyClass.json(value)[0]['rc_code'].toString() == "1") {
      if (MyClass.json(value)[0]['member_status_code'].toString() != '3') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Reandfo(
                title: title,
                sex: MyClass.json(value)[0]['sex'].toString(),
                member: user,
                idcard: MyClass.json(value)[0]['id_card'].toString(),
                brithDate: MyClass.json(value)[0]['date_of_birth'].toString(),
                lgs: widget.lgs,
                name: MyClass.json(value)[0]['member_name'].toString(),
                last_name: MyClass.json(value)[0]['member_surname'].toString()),
          ),
        );
      } else {
        MyClass.showToast('ไม่มีทะเบียนสมาชิก');
        print(MyClass.json(value)[0]['rc_desc'].toString());
      }
    } else {
      MyClass.showToast(MyClass.json(value)[0]['rc_desc'].toString());
    }
  }
}
