import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/locals/dbPin.dart';
import 'package:dldcoop/FollowMe/locals/dbUser.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/pages/auth/login.dart';
import 'package:flutter/material.dart';

final String lgs = 'th';

class Logout extends StatefulWidget {
  final String gettitle;

  Logout({required this.gettitle});

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  late DBPin dBPin;
  late DBUser dBUser;

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

  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(context),
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  tabletMode
                      ? lineSizedBox(context, displayHeight(context) * 0.25)
                      : lineSizedBox(context, displayHeight(context) * 0.25),
                  Stack(
                    children: [
                      Text(
                        MyClass.company('th'),
                        textScaleFactor: MyClass.fontSizeApp(),
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.dataHeadTitleCTxt1Paint(
                            context,
                            tabletMode == true ? 2 : 0,
                            'W',
                            tabletMode == true ? 5 : 3),
                      ),
                      Text(MyClass.company('th'),
                          textScaleFactor: MyClass.fontSizeApp(),
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, tabletMode == true ? 2 : 0, 'R')),
                    ],
                  ),
                  SizedBox(
                    height: tabletMode
                        ? displayHeight(context) * 0.01
                        : displayHeight(context) * 0.01,
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  _buildsubmitButton(),
                ],
              ),
            ),
          ),
          CustomUI.appbarDetailUi('assets/imgs/icon.png', context),
        ],
      ),
    );
  }

  Widget _buildsubmitButton() {
    bool platformios = MyClass.checkPlatform();
    return Container(
      width: displayWidth(context) * 0.8,
      height: displayHeight(context) * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: MyColor.color('buttongra'),
      ),
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Pins(gettitle: 'pinCode')),
          );
          dBPin.initDB().then(
                (value) => {
                  dBPin.deleteAll().then(
                        (value) => {
                          dBUser.initDB().then(
                                (value) => {
                                  dBUser.deleteAll().then((value) => {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (context) => Login(
                                                    lgs: 'th',
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
        },
        child: Center(
          child: Text(
            Language.loginLg('logIn', lgs),
            textScaleFactor: MyClass.fontSizeApp(),
            style:
                CustomTextStyle.buttonTxt(context, platformios == true ? 0 : 3),
          ),
        ),
      ),
    );
  }
}
