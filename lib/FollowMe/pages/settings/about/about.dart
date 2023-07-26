import 'dart:io' show Platform;
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class About extends StatefulWidget {
  Param param;
  About(this.param);
  @override
  _AboutState createState() => _AboutState();
}

class DeviceInfo {
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

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

class _AboutState extends State<About> {
  DeviceInfo device = DeviceInfo();

  void getDevice() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      device.name = androidInfo.device;
      device.platform = androidInfo.product;
      device.version = androidInfo.version.release;
      device.model = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      device.name = iosInfo.name;
      device.platform = iosInfo.systemName;
      device.version = iosInfo.systemVersion;
      device.model = iosInfo.model;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    getDevice();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: MyColor.color('settings'),
      //   elevation: 0.0,
      // ),
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(context),
            child: Column(
              children: [
                SizedBox(
                  height: tabletMode
                      ? displayHeight(context) * 0.30
                      : Platform.isAndroid
                          ? displayHeight(context) * 0.18
                          : displayHeight(context) * 0.19,
                ),
                _versionApp(context, widget.param.lgs),
                _versionMobile(device, context, widget.param.lgs),
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi3(Language.settingLg('about', widget.param.lgs),
              _fontsizeapps, context),
        ],
      ),
    );
  }
}

Container _versionApp(context, lgs) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
    height: MediaQuery.of(context).size.height * 0.20,
    child: Card(
      elevation: 0,
      color: MyColor.color('SettingBackground'),
      child: ClipPath(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  left:
                      BorderSide(color: MyColor.color('LineColor'), width: 8))),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    Language.settingLg('application', lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingHTxt(context, 1),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        Language.settingLg('version', lgs),
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.buttonCTxt(context, 3, 'Bl'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            MyClass.versionApp().split('.')[0] +
                                '.' +
                                int.parse(MyClass.versionApp().split('.')[1])
                                    .toString(),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.buttonCTxt(context, 3, 'Bl'),
                          )
                        ],
                      ),
                    ),
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

Container _versionMobile(device, context, lgs) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 35.0),
    height: MediaQuery.of(context).size.height * 0.28,
    child: Card(
      elevation: 0,
      color: MyColor.color('SettingBackground'),
      child: ClipPath(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  left:
                      BorderSide(color: MyColor.color('LineColor'), width: 8))),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    Language.settingLg('mobile', lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingHTxt(context, 1),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            Language.settingLg('version', lgs),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.buttonCTxt(context, 3, 'Bl'),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            device.version,
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.buttonCTxt(context, 3, 'Bl'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            Language.settingLg('platform', lgs),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.buttonCTxt(context, 3, 'Bl'),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            device.platform,
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.buttonCTxt(context, 3, 'Bl'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            Language.settingLg('model', lgs),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.buttonCTxt(context, 3, 'Bl'),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            device.model,
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.buttonCTxt(context, 3, 'Bl'),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
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
