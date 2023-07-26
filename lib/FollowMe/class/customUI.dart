import 'package:flutter/cupertino.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/pages/auth/logout.dart';
import 'package:dldcoop/FollowMe/pages/loan/loan_movement.dart';
import 'package:dldcoop/FollowMe/pages/msg/msg.dart';
import 'package:dldcoop/FollowMe/pages/settings/settings.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';

import 'dart:io' show Platform, exit;

import '../../root/tabs.dart';
import '../services/netword.dart';

class CustomUI {
  static Padding appbarTxtTitleUi2(txt, _fontsizeapps, context) {
    return Padding(
      padding: EdgeInsets.only(
        top: displayHeight(context) * 0.28,
        bottom: displayHeight(context) * 0.3,
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              txt,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.titleTxt(context, 0),
            ),
          ),
        ],
      ),
    );
  }

  static Widget headprofile(context, lgs, _fontsizeapps, name) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
        left: 15,
        right: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          color: MyColor.color('settingCard'),
        ),
        child: Container(
          // decoration: BoxDecoration(
          //     border: Border(
          //         bottom: BorderSide(
          //             color: MyColor.color('LineColor'),
          //             width: tabletMode ? 8 : 6))),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name,
                      textAlign: TextAlign.center,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.dataHeadDataTxt(context, 3)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Positioned appbarUi() {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }

  static Positioned appbarUi3(title, fontsizeapps, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Positioned(
      // top: Platform.isAndroid ? 10.0 : 0,
      left: 0.0,
      right: 0.0,
      child: Padding(
          padding: EdgeInsets.only(
              left: 20, right: 20, bottom: 10, top: tabletMode ? 5 : 10),
          child: AppBar(
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: Colors.transparent,
            toolbarHeight: tabletMode ? 100 : null,
            elevation: 0.0,
            title: title == 'เรียกเก็บเงินรายเดือน/ใบเสร็จ'
                ? Text(title,
                    textScaleFactor: MyClass.blocFontSizeApp(fontsizeapps),
                    style: CustomTextStyle.subTitleTxt(
                        context, (Platform.isIOS && tabletMode) ? -5 : -8))
                : title == 'ใบเสร็จชำระพิเศษและหักกลบ'
                    ? Text(title,
                        textScaleFactor: MyClass.blocFontSizeApp(fontsizeapps),
                        style: CustomTextStyle.subTitleTxt(
                            context, (Platform.isIOS && tabletMode) ? -5 : -8))
                    : Text(title,
                        textScaleFactor: MyClass.blocFontSizeApp(fontsizeapps),
                        style: CustomTextStyle.subTitleTxt(
                            context, (Platform.isIOS && tabletMode) ? -5 : 0)),
          )),
    );
  }

  static Positioned appbarUi1(token, name, sex, lgs, membership_no, groupID,
      context, param, fontsizeapps) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left,
              color: Colors.white, size: tabletMode ? 60 : 40),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => Tabs(param)),
            // );
          },
        ),
      ),
    );
  }

  static Positioned appbarUi2(param, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Positioned(
      top: Platform.isAndroid ? 10 : 8.0,
      left: 0.0,
      right: 0.0,
      child: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left, size: tabletMode ? 60 : 40),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Tabs(param)),
                );
              })),
    );
  }

  static Positioned appbarUiMainMenu(
      url, _msgstatus, Param param, groupID, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Positioned(
      // top: Platform.isAndroid ? 10.0 : 0,
      left: 0.0,
      right: 0.0,
      child: Container(
        // decoration: const BoxDecoration(
        //   borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(30),
        //     bottomRight: Radius.circular(30),
        //   ),
        //   gradient: LinearGradient(
        //       begin: Alignment.centerLeft,
        //       end: Alignment.centerRight,
        //       colors: <Color>[
        //         Color.fromRGBO(19, 99, 223, 1),
        //         Color.fromRGBO(19, 99, 223, 1)
        //       ]),
        // ),
        child: Padding(
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
                top: tabletMode
                    ? 5
                    : Platform.isAndroid
                        ? 2
                        : 5),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              toolbarHeight: tabletMode ? 100 : null,
              automaticallyImplyLeading: false,
              title: tabletMode
                  ? Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: Platform.isAndroid ? 40 : 45,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                              '${MyClass.hostApp()}/public/member/profile/boy.jpg'),
                          child: CircleAvatar(
                            radius: Platform.isAndroid ? 40 : 45,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(url),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Language.menuLg('welcome', param.lgs),
                                  textScaleFactor: MyClass.fontSizeApp(),
                                  style: CustomTextStyle.NameTxt(
                                      context, tabletMode ? -25 : -7),
                                  textAlign: TextAlign.start),
                              Text(param.name,
                                  textScaleFactor: MyClass.fontSizeApp(),
                                  style: CustomTextStyle.NameTxt(
                                      context, tabletMode ? -30 : -12),
                                  textAlign: TextAlign.start),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(Language.menuLg('welcome', param.lgs),
                            textAlign: TextAlign.left,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(param.fontsizeapps),
                            style: CustomTextStyle.NameTxt(
                                context,
                                tabletMode
                                    ? -20
                                    : Platform.isAndroid
                                        ? -12
                                        : -10)),
                        Text(param.name,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(param.fontsizeapps),
                            style: CustomTextStyle.NameTxt(
                                context,
                                tabletMode
                                    ? -30
                                    : Platform.isAndroid
                                        ? -15
                                        : -17)),
                      ],
                    ),
              leading: tabletMode == false
                  ? CircleAvatar(
                      radius: tabletMode
                          ? 50
                          : Platform.isAndroid
                              ? 25
                              : 40,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          '${MyClass.hostApp()}/public/member/profile/boy.jpg'),
                      child: CircleAvatar(
                        radius: tabletMode
                            ? 50
                            : Platform.isAndroid
                                ? 25
                                : 40,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(url),
                      ),
                    )
                  : null,
              actions: [
                _msgstatus.toString() == '0'
                    ? IconButton(
                        icon: const Icon(Icons.notifications_none,
                            color: Colors.white),
                        iconSize: tabletMode == true
                            ? 50
                            : Platform.isAndroid
                                ? 25
                                : 30,
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Msgs(param: param, groupID: "1")),
                              (Route<dynamic> route) => false);
                        },
                      )
                    : IconButton(
                        iconSize: tabletMode == true
                            ? 50
                            : Platform.isAndroid
                                ? 25
                                : 30,
                        icon: badge.Badge(
                          badgeContent: Text(_msgstatus.toString()),
                          child: const Icon(Icons.notifications_none,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Msgs(param: param, groupID: "1")),
                              (Route<dynamic> route) => false);
                        },
                      ),
                IconButton(
                  icon:
                      const Icon(Icons.settings_outlined, color: Colors.white),
                  iconSize: tabletMode == true
                      ? 50
                      : Platform.isAndroid
                          ? 25
                          : 30,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Setting(param),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon:
                      const Icon(Icons.power_settings_new, color: Colors.white),
                  iconSize: tabletMode == true
                      ? 50
                      : Platform.isAndroid
                          ? 25
                          : 30,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Text(
                              'ออกจากแอปพลิเคชัน',
                              style: CustomTextStyle.dataHTxt(context, 5, 'Bl'),
                            ),
                            content: Text(
                              'คุณต้องการออกจากแอปพลิเคชันหรือไม่',
                              style: CustomTextStyle.dataHTxt(
                                  context, tabletMode ? -5 : 0, 'Bl'),
                            ),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: Text(
                                  'ยกเลิก',
                                  style:
                                      CustomTextStyle.dataHTxt(context, 3, 'R'),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text(
                                  'ตกลง',
                                  style:
                                      CustomTextStyle.dataHTxt(context, 3, 'B'),
                                ),
                                onPressed: () {
                                  // if (Platform.isAndroid) {
                                  //   SystemNavigator.pop();
                                  // } else if (Platform.isIOS) {
                                  //   exit(0);
                                  // }
                                  Platform.isIOS
                                      ? FlutterExitApp.exitApp(
                                          iosForceExit: true)
                                      : FlutterExitApp.exitApp();
                                },
                              ),
                            ],
                          );
                        });
                  },
                ),
              ],
            )),
      ),
    );
  }

  static Container appbarDetailUi(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: displayHeight(context) * 0.17),
      child: Image.asset(
        url,
        width: tabletMode
            ? displayWidth(context) * 0.2
            : displayWidth(context) * 0.25,
        height: tabletMode
            ? displayWidth(context) * 0.2
            : displayWidth(context) * 0.25,
        fit: BoxFit.cover,
      ),
    );
  }

  static Container appbarDetailUi1(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Container(
      padding: EdgeInsets.only(
          top: displayHeight(context) *
              (tabletMode
                  ? 0.02
                  : Platform.isAndroid
                      ? 0.03
                      : 0.1)),
      alignment: Alignment.topCenter,
      child: Image.asset(
        url,
        width: tabletMode
            ? displayWidth(context) * 0.32
            : displayWidth(context) * 0.32,
        height: tabletMode
            ? displayWidth(context) * 0.32
            : displayWidth(context) * 0.32,
        fit: BoxFit.cover,
      ),
    );
  }

  static Container appbarDetailUi2(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(
          top: Platform.isAndroid
              ? displayHeight(context) * 0.1
              : displayHeight(context) * 0.13),
      child: Image.asset(
        url,
        width: tabletMode
            ? displayWidth(context) * 0.25
            : displayWidth(context) * 0.32,
        height: tabletMode
            ? displayWidth(context) * 0.25
            : displayWidth(context) * 0.32,
        fit: BoxFit.cover,
      ),
    );
  }

  static Container appbarDetailUi3(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Container(
      padding: EdgeInsets.only(
          top: displayHeight(context) *
              (tabletMode
                  ? 0.05
                  : Platform.isAndroid
                      ? 0.006
                      : 0.02)),
      alignment: Alignment.topCenter,
      child: Image.asset(
        url,
        width: tabletMode
            ? displayWidth(context) * 0.25
            : displayWidth(context) * 0.32,
        height: tabletMode
            ? displayWidth(context) * 0.25
            : displayWidth(context) * 0.32,
        fit: BoxFit.cover,
      ),
    );
  }

  static Container appbarDetailUi4(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Container(
      padding: EdgeInsets.only(
          top: displayHeight(context) * (tabletMode ? 0.12 : 0.1)),
      alignment: Alignment.topCenter,
      child: Image.asset(
        url,
        width: tabletMode
            ? displayWidth(context) * 0.22
            : displayWidth(context) * 0.32,
        height: tabletMode
            ? displayWidth(context) * 0.22
            : displayWidth(context) * 0.32,
        fit: BoxFit.cover,
      ),
    );
  }

  static Container appbarDetailUiPro(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: displayHeight(context) * 0.05),
      child: CircleAvatar(
        radius: tabletMode ? 80 : 40,
        backgroundColor: Colors.transparent,
        backgroundImage:
            NetworkImage('${MyClass.hostApp()}/public/member/profile/boy.jpg'),
        child: CircleAvatar(
            radius: tabletMode ? 80 : 40,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(url)),
      ),
    );
  }

  static Container appbarDetailUiPro1(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    imageCache.clear();
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: displayHeight(context) * 0.12),
      child: CircleAvatar(
        radius: tabletMode ? 80 : 40,
        backgroundColor: Colors.transparent,
        backgroundImage:
            NetworkImage('${MyClass.hostApp()}/public/member/profile/boy.jpg'),
        child: CircleAvatar(
            radius: tabletMode ? 80 : 40,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(url)),
      ),
    );
  }

  static Padding appbarBackgroundUi(context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 2.0),
    );
  }

  static Padding appbarTxtTitleUi(txt, _fontsizeapps, context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Platform.isAndroid
            ? displayHeight(context) * 0.045
            : displayHeight(context) * 0.0575,
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              txt,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.NameTxt(context, 0),
            ),
          ),
        ],
      ),
    );
  }

  static Padding appbarTitleUi(txt, _fontsizeapps, context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Platform.isAndroid
            ? displayHeight(context) * 0.038
            : displayHeight(context) * 0.0575,
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              txt,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style:
                  CustomTextStyle.NameTxt(context, Platform.isAndroid ? -6 : 0),
            ),
          ),
        ],
      ),
    );
  }

  static Padding sliverTxtTitleUi(txt, context) {
    return Padding(
      padding: EdgeInsets.only(
        top: displayHeight(context) * 0.1,
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              txt,
              textScaleFactor: MyClass.fontSizeApp(),
              style: CustomTextStyle.titleTxt(context, -15),
            ),
          ),
        ],
      ),
    );
  }
}

class NamedIcon extends StatelessWidget {
  final IconData? iconData;
  final String? text;
  final VoidCallback? onTap;
  final int? notificationCount;

  const NamedIcon({
    this.onTap,
    @required this.text,
    @required this.iconData,
    this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: tabletMode ? 55 : 30,
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  iconData,
                  color: Colors.white,
                  size: tabletMode ? 45 : 27,
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: notificationCount != 0
                  ? Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: tabletMode ? 20 : 4,
                        vertical: tabletMode ? 9 : 7,
                      ),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      alignment: Alignment.center,
                      child: Text(
                        '$notificationCount',
                        textScaleFactor: MyClass.fontSizeApp(),
                        style: TextStyle(
                          fontSize: tabletMode ? 23 : 15,
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarUiMainMenu extends StatefulWidget implements PreferredSizeWidget {
  AppBarUiMainMenu(
      {super.key,
      required this.url,
      required this.param,
      required this.groupID,
      required this.tabletMode,
      required this.context})
      : preferredSize = Size.fromHeight(Platform.isAndroid
            ? 100
            : (tabletMode && Platform.isIOS)
                ? 125
                : 100);

  final String url;
  final Param param;
  final String groupID;
  final bool tabletMode;
  final dynamic context;

  @override
  final Size preferredSize;

  @override
  State<AppBarUiMainMenu> createState() => _AppBarUiMainMenuState();
}

class _AppBarUiMainMenuState extends State<AppBarUiMainMenu> {
  int _msgstatus = 0;
  Future<void> getMsgStatus() async {
    var objMsgStatus = '{"mode": "3","message_type":"0"}';
    final List msg =
        await Network.fetchMsgStatus(objMsgStatus, widget.param.token, context);
    setState(() {
      _msgstatus = MyClass.json(msg)[0]['countStatus'];
    });
  }

  @override
  void initState() {
    super.initState();
    getMsgStatus();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: const Color(0x99000000),
      elevation: 10,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            gradient: const LinearGradient(
              colors: <Color>[
                Color.fromRGBO(19, 99, 223, 1),
                Color.fromRGBO(19, 99, 223, 1),
              ],
            )),
        child: Padding(
          padding: Platform.isAndroid
              ? const EdgeInsets.only(top: 15, left: 15, bottom: 15)
              : const EdgeInsets.only(top: 15, left: 15, bottom: 15),
          child: SafeArea(
            child: widget.tabletMode
                ? Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 25),
                        child: CircleAvatar(
                          radius: widget.tabletMode ? 40 : 40,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                              '${MyClass.hostApp()}/public/member/profile/boy.jpg'),
                          child: CircleAvatar(
                              radius: widget.tabletMode ? 40 : 40,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(widget.url)),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                                Language.menuLg('welcome', widget.param.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.NameTxt(
                                    context, tabletMode ? -14 : -7)),
                          ),
                          Expanded(
                              child: Text(widget.param.name,
                                  textScaleFactor: MyClass.fontSizeApp(),
                                  style: CustomTextStyle.NameTxt(
                                      context, tabletMode ? -19 : -12))),
                        ],
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: widget.tabletMode ? 80 : 20,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                              '${MyClass.hostApp()}/public/member/profile/boy.jpg'),
                          child: CircleAvatar(
                              radius: widget.tabletMode ? 80 : 20,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(widget.url)),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(Language.menuLg('welcome', widget.param.lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.NameTxt(
                                  context, tabletMode ? -20 : -7)),
                          Text(widget.param.name,
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.NameTxt(
                                  context, tabletMode ? -30 : -12)),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(top: Platform.isAndroid ? 25 : 25),
          child: IconButton(
            icon: _msgstatus.toString() == '0'
                ? const Icon(Icons.notifications, color: Colors.white)
                : badge.Badge(
                    badgeContent: Text(_msgstatus.toString()),
                    child: const Icon(Icons.notifications, color: Colors.white),
                  ),
            onPressed: () {
              Navigator.push(
                widget.context,
                MaterialPageRoute(
                  builder: (context) => Msgs(param: widget.param, groupID: "1"),
                ),
              ).whenComplete(() => getMsgStatus());
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: Platform.isAndroid ? 25 : 25),
          child: IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(
                widget.context,
                MaterialPageRoute(
                  builder: (context) => Setting(widget.param),
                ),
              );
            },
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: Platform.isAndroid ? 25 : 25, right: 15),
          child: IconButton(
            icon: const Icon(Icons.power_settings_new, color: Colors.white),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text(
                        'ออกจากแอปพลิเคชัน',
                        style: CustomTextStyle.dataHTxt(context, 5, 'Bl'),
                      ),
                      content: Text(
                        'คุณต้องการออกจากแอปพลิเคชันหรือไม่',
                        style: CustomTextStyle.dataHTxt(context, -1, 'Bl'),
                      ),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text(
                            'ยกเลิก',
                            style: CustomTextStyle.dataHTxt(context, 3, 'R'),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text(
                            'ตกลง',
                            style: CustomTextStyle.dataHTxt(context, 3, 'B'),
                          ),
                          onPressed: () {
                            Platform.isIOS
                                ? FlutterExitApp.exitApp(iosForceExit: true)
                                : FlutterExitApp.exitApp();
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}
