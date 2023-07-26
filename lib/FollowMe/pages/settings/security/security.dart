import 'dart:io';

import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/pages/settings/security/checksecurity.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Security extends StatefulWidget {
  Param param;

  Security(this.param);

  @override
  _SecurityState createState() => _SecurityState();
}

class Securitys {
  String? title;
  String? description;
  int? type;

  Securitys({this.title, this.description, this.type});
}

var imgprofile = '';

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    imgprofile =
        '${MyClass.hostApp()}/public/member/profile/${widget.param.membership_no}.jpg';
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    List<Securitys> securitys = <Securitys>[
      Securitys(
          title: Language.settingLg('changePin', widget.param.lgs),
          description: Language.settingLg('changePindesc', widget.param.lgs),
          type: 0),
      Securitys(
          title: Language.settingLg('forgotPassword', widget.param.lgs),
          description:
              Language.settingLg('forgotPassworddesc', widget.param.lgs),
          type: 1),
      Securitys(
          title: Language.settingLg('deactivate', widget.param.lgs),
          description: Language.settingLg('deactivatedesc', widget.param.lgs),
          type: 2),
    ];
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: tabletMode == true
                    ? displayHeight(context) * 0.20
                    : displayHeight(context) * 0.3,
              ),
              Container(
                padding: EdgeInsets.only(top: displayHeight(context) * 0.1),
                child: Center(
                  child: CustomUI.headprofile(context, widget.param.lgs,
                      widget.param.fontsizeapps, widget.param.name),
                ),
              ),
            ],
          ),
          Container(
            decoration: MyClass.backGround(context),
            child: Container(
              padding: EdgeInsets.only(top: displayHeight(context) * 0.345),
              child: _genmemu(security: securitys, tabletMode: tabletMode),
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          // CustomUI.appbarUi(),
          CustomUI.appbarUi3(Language.settingLg('setting', widget.param.lgs),
              _fontsizeapps, context),
          Stack(
            children: [
              CustomUI.appbarDetailUiPro1(imgprofile, context),
              Column(
                children: [
                  SizedBox(
                    height: tabletMode == true
                        ? displayHeight(context) * 0.28
                        : Platform.isAndroid
                            ? displayHeight(context) * 0.27
                            : displayHeight(context) * 0.29,
                  ),
                  Center(
                    child: CustomUI.headprofile(context, widget.param.lgs,
                        widget.param.fontsizeapps, widget.param.name),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  ListView _genmemu({security, tabletMode}) => ListView.builder(
        itemCount: security.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Checksecurity(
                    type: security[index].type.toString(),
                    param: widget.param,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 10, right: 10, bottom: 5),
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
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: MyColor.color('LineColor'),
                                    width: 8))),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    security[index].title,
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style:
                                        CustomTextStyle.settingHTxt(context, 0),
                                  ),
                                  Text(
                                    security[index].description,
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.settingHTxt(
                                        context, -8),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    size: iconnext(context, 0),
                                    color: MyColor.color('buttoncolor2'),
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
              ],
            ),
          );
        },
      );
}
