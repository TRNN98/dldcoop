import 'dart:convert';
import 'dart:io';
import 'package:dldcoop/FollowMe/models/kept/keptDetailModel.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/kept_special/keptSpecialModel.dart';

double _fontsizeapps = 1.0;

class Kept_special_detail extends StatefulWidget {
  Param param;
  String data;

  Kept_special_detail({required this.data, required this.param});

  @override
  _Kept_special_detailState createState() => _Kept_special_detailState();
}

class _Kept_special_detailState extends State<Kept_special_detail> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    var ObjKeptDetail = '{"mode": "2"}';

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(context),
            child: Column(
              children: [
                SizedBox(
                  height: tabletMode
                      ? displayHeight(context) * 0.35
                      : displayHeight(context) * 0.30,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: paddinglist(context, 80),
                      left: paddinglist(context, 0),
                      right: paddinglist(context, 0)),
                  child: _head(context, widget.param.lgs),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: FutureBuilder<List<KeptSpecial>>(
                      future: Network.fetchKeptSpecial(
                          ObjKeptDetail, widget.param.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.isNotEmpty
                              ? _detail(kept: snapshot.data)
                              : MyWidget.nodata(widget.param.lgs, context);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return MyClass.loading();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.05,
                ),
                _buttomClick(),
                SizedBox(
                  height: displayHeight(context) * 0.05,
                ),
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi3(
              Language.keptSpecialLg('kept_special_detail', widget.param.lgs),
              _fontsizeapps,
              context),
          Padding(
            padding: EdgeInsets.only(
                top: Platform.isAndroid
                    ? displayHeight(context) * 0.18
                    : displayHeight(context) * 0.19,
                left: paddinglist(context, 0),
                right: paddinglist(context, 0)),
            child: _subdataHeadcolor(),
          ),
        ],
      ),
    );
  }

  Container _buttomClick() {
    return Container(
      width: displayWidth(context) * 0.7,
      height: displayHeight(context) * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: <Color>[
            MyColor.color('buttongra'),
            MyColor.color('buttongra1'),
          ],
        ),
      ),
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () {
          MyClass.showToast('อยู่ในช่วงพัฒนา');
          // _launchURL("${MyClass.hostApp()}/api/v1/kep_print/" +
          //     jsonDecode(widget.data)[0]['receiveYear'] +
          //     "/" +
          //     jsonDecode(widget.data)[0]['receiveMonth'] +
          //     "/" +
          //     jsonDecode(widget.data)[0]['seq_no'] +
          //     "/" +
          //     widget.param.token);
        },
        child: Center(
          child: Text(
            Language.keptSpecialLg('printBilledMonthly', widget.param.lgs),
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.buttonTxt(context, -1),
          ),
        ),
      ),
    );
  }

  Widget _detail({kept}) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColor.color('datatitle'),
        ),
        child: Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 0),
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
              height: 0,
            ),
            itemCount: kept.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildExpandableTile(kept[index]);
            },
          ),
        ),
      );
  /*    Padding(
                padding: const EdgeInsets.only(right: 6, left: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            kept[index].description,
                            textAlign: TextAlign.start,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataBoldTxt(context, -1),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          MyClass.FormatNumber(kept[index].principalAmount),
                          textAlign: TextAlign.end,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataTxt(context, 0),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          MyClass.FormatNumber(kept[index].interestAmount),
                          textAlign: TextAlign.end,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataTxt(context, 0),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        MyClass.FormatNumber(kept[index].itemAmount),
                        textAlign: TextAlign.end,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataTxt(context, 0),
                      ),
                    ),
                  ],
                ),
              );
        */
  Widget _buildExpandableTile(kept) {
    return ExpansionTile(
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  kept.description,
                  textAlign: TextAlign.start,
                  textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                  style: CustomTextStyle.subDataTxt(context, 0),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  MyClass.FormatNumber(kept.itemAmount),
                  textAlign: TextAlign.end,
                  textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                  style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                ),
              ),
            ],
          )
        ],
      ),
      children: [
        ListTile(
          title: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      Language.keptLg('principal', widget.param.lgs),
                      textAlign: TextAlign.start,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        MyClass.FormatNumber(kept.principalAmount),
                        textAlign: TextAlign.end,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.subDataHTxt(context, 1),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      Language.keptLg('interest', widget.param.lgs),
                      textAlign: TextAlign.start,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        MyClass.FormatNumber(kept.interestAmount),
                        textAlign: TextAlign.end,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.subDataHTxt(context, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Center _subdataHeadcolor() {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
              color: MyColor.color('datatitle'),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                        child: Text(Language.keptLg('member', widget.param.lgs),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.subDataTxt(context, 1))),
                    Expanded(
                        child: Text(
                      widget.param.membership_no,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                      textAlign: TextAlign.end,
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(Language.keptLg('name', widget.param.lgs),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.subDataTxt(context, 1))),
                    Expanded(
                        flex: 4,
                        child: Text(
                          widget.param.name,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.subDataHTxt(context, 1),
                          textAlign: TextAlign.end,
                        )),
                  ],
                ),
                Divider(
                  endIndent: 5,
                  height: 20,
                  thickness: 1,
                  color: MyColor.color('divider'),
                ),
                Row(children: <Widget>[
                  Expanded(
                      child: Text(
                          Language.keptSpecialLg(
                              'receiptNumber', widget.param.lgs),
                          // MyClass.formatRef(
                          //     jsonDecode(widget.data)[0]['receiptNo']),
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.subDataTxt(context, 1))),
                  Expanded(
                      child: Text(
                    jsonDecode(widget.data)[0]['receiptNo'],
                    // MyClass.formatRef(
                    //     jsonDecode(widget.data)[0]['receiptNo']),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.subDataHTxt(context, 1),
                    textAlign: TextAlign.end,
                  )),
                ]),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                            Language.keptSpecialLg(
                                'receiptDate', widget.param.lgs),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.subDataTxt(context, 1))),
                    Expanded(
                        child: Text(
                      jsonDecode(widget.data)[0]['receiptDate'],
                      // MyClass.convertDate(
                      //     jsonDecode(widget.data)[0]['receiptDate']),
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                      textAlign: TextAlign.end,
                    )),
                  ],
                ),
                Row(children: <Widget>[
                  Expanded(
                      child: Text(
                          Language.keptSpecialLg(
                              'numberOfItems', widget.param.lgs),
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.subDataTxt(context, 1))),
                  Expanded(
                      child: Text(
                    (jsonDecode(widget.data)[0]['count']),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.subDataHTxt(context, 1),
                    textAlign: TextAlign.end,
                  )),
                ]),
                Row(children: <Widget>[
                  Expanded(
                      child: Text(
                          Language.keptSpecialLg(
                              'totalPayment', widget.param.lgs),
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.subDataTxt(context, 1))),
                  Expanded(
                      child: Text(
                    MyClass.FormatNumber(
                        jsonDecode(widget.data)[0]['moneyAmount']),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.subDataHTxt(context, 1),
                    textAlign: TextAlign.end,
                  )),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Container _head(context, lgs) {
  return Container(
    padding: const EdgeInsets.all(12),
    color: MyColor.color('detailhead'),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Text(
            Language.keptSpecialLg('detail', lgs),
            textAlign: TextAlign.start,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -3),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            Language.keptSpecialLg('total', lgs),
            textAlign: TextAlign.end,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -3),
          ),
        ),
      ],
    ),
  );
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
