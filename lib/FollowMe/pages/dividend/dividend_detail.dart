import 'dart:convert';
import 'dart:io';

import 'package:dldcoop/FollowMe/models/dividend/divDetailModel.dart';
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

class Dividend_detail extends StatefulWidget {
  Param param;
  String data;

  Dividend_detail({required this.data, required this.param});

  @override
  _Dividend_detailState createState() => _Dividend_detailState();
}

var divH;
var s = 0;

class _Dividend_detailState extends State<Dividend_detail> {
  @override
  Widget build(BuildContext context) {
    print(jsonDecode(widget.data)[0]['year']);
    var ObjDividend = '{"mode": "2","account_year": "' +
        MyClass.adYearFormat(jsonDecode(widget.data)[0]['year']).toString() +
        '"}';
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(context),
            child: Column(
              children: [
                // tabletMode ? hSizedBox(context, 0) : hSizedBox(context, -2.5),
                Padding(
                  padding: EdgeInsets.only(
                    right: displayWidth(context) * 0.04,
                    left: displayWidth(context) * 0.04,
                    top: Platform.isAndroid
                        ? displayHeight(context) * 0.18
                        : displayHeight(context) * 0.19,
                  ),
                  child: _subdataHeadcolor(),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      // top: displayHeight(context) * 0.2,
                      left: paddinglist(context, 0),
                      right: paddinglist(context, 0)),
                  child: _head(
                      context, widget.param.lgs, widget.param.fontsizeapps),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: FutureBuilder<List<DivDetailModel>>(
                      future: Network.fetchDividendDetail(
                          ObjDividend, widget.param.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return _detail(
                              jsonDecode(widget.data)[0]['totalSum']);
                          // if (snapshot.data!.length > 0) {
                          //   // setState(() {
                          //   //   divH = snapshot.data;
                          //   //   print(MyClass.json(divH));
                          //   //   s = 1;
                          //   // });
                          //   return _detail(div: snapshot.data);
                          // } else {
                          //   return MyWidget.nodata(widget.param.lgs, context);
                          // }
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
                // // _buttomClick(),
                // SizedBox(
                //   height: displayHeight(context) * 0.05,
                // ),
              ],
            ),
          ),
          CustomUI.appbarUi3(
              Language.dividendLg('dividendAverageDetail', widget.param.lgs),
              widget.param.fontsizeapps,
              context),
        ],
      ),
    );
  }

  // Container _buttomClick() {
  //   return Container(
  //     width: displayWidth(context) * 0.7,
  //     height: displayHeight(context) * 0.06,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(0.0),
  //       gradient: LinearGradient(
  //         colors: <Color>[
  //           MyColor.color('buttongra'),
  //           MyColor.color('buttongra1'),
  //         ],
  //       ),
  //     ),
  //     padding: const EdgeInsets.only(right: 5),
  //     child: InkWell(
  //       onTap: () {
  //         _launchURL("${MyClass.hostApp()}/api/v1/div_receipt/" +
  //             jsonDecode(widget.data)[0]['year'].toString() +
  //             "/" +
  //             widget.param.token);
  //       },
  //       child: Center(
  //         child: Text(
  //           Language.dividendLg('printDividend', widget.param.lgs),
  //           textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
  //           style: CustomTextStyle.buttonTxt(context, -1),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _detail({div})
  Widget _detail(itemAmount) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColor.color('datatitle'),
        ),
        child: Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
            ),
            // itemCount: div.length,
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              // print(div[index]);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "ยังไม่มีข้อมูล",
                    // MyClass.checkNull(div[index].bankName),
                    textAlign: TextAlign.left,
                    textScaleFactor:
                        MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                    style: CustomTextStyle.nodataTxt(context, 0),
                  ),
                ],

                // children: <Widget>[
                //   // (MyClass.checkNull(div[index].bankName)).toString() != ''
                //   //     ?
                //   Expanded(
                //     flex: 3,
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       mainAxisSize: MainAxisSize.min,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Text(
                //           "รวมรับ",
                //           // MyClass.checkNull(div[index].bankName),
                //           textAlign: TextAlign.left,
                //           textScaleFactor: MyClass.blocFontSizeApp(
                //               widget.param.fontsizeapps),
                //           style: CustomTextStyle.dataBoldTxt(context, 0),
                //         ),
                //         // Text(
                //         //   MyClass.checkNull(div[index].bankAccNo),
                //         //   // MyClass.formatcontactaccoutn(
                //         //   //     div[index].bankAccNo),
                //         //   textAlign: TextAlign.left,
                //         //   textScaleFactor: MyClass.blocFontSizeApp(
                //         //       widget.param.fontsizeapps),
                //         //   style: CustomTextStyle.dataTxt(context, 0),
                //         // )
                //       ],
                //     ),
                //   ),

                //   Expanded(
                //     flex: 1,
                //     child: Text(
                //       MyClass.FormatNumber(itemAmount),
                //       textAlign: TextAlign.end,
                //       textScaleFactor:
                //           MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                //       style: CustomTextStyle.dataHTxt(context, 0, 'Bl'),
                //     ),
                //   ),
                // ],
              );
            },
          ),
        ),
      );

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
            padding: EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                        child: Text(Language.keptLg('member', widget.param.lgs),
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.subDataTxt(context, 1))),
                    Expanded(
                        child: Text(
                      widget.param.membership_no,
                      textScaleFactor:
                          MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                      textAlign: TextAlign.end,
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(Language.keptLg('name', widget.param.lgs),
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.subDataTxt(context, 1))),
                    Expanded(
                        flex: 2,
                        child: Text(
                          widget.param.name,
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.subDataHTxt(context, 1),
                          textAlign: TextAlign.end,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Center(
                            // child: Text('dddd' + divH[0].totalPaid,
                            child: Text(
                                Language.dividendLg(
                                        'fiscalYear', widget.param.lgs) +
                                    ' : ' +
                                    jsonDecode(widget.data)[0]['year']
                                        .toString(),
                                // MyClass.FormatNumber(divH[0].endingBalance),
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.param.fontsizeapps),
                                style:
                                    CustomTextStyle.subDataTxt(context, 1)))),
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
                          Language.dividendLg('dividend', widget.param.lgs),
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.subDataHTxt(context, 1))),
                  Expanded(
                    child: Text(
                      MyClass.FormatNumber(
                          jsonDecode(widget.data)[0]['dividend']),
                      textScaleFactor:
                          MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                      textAlign: TextAlign.end,
                    ),
                  )
                ]),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                            Language.dividendLg(
                                'averageRefund', widget.param.lgs),
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.subDataHTxt(context, 1))),
                    Expanded(
                      child: Text(
                        MyClass.FormatNumber(
                            jsonDecode(widget.data)[0]['averageReturn']),
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.subDataHTxt(context, 1),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.dividendLg(
                                'totalNetReceipts', widget.param.lgs),
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.subDataHTxt(context, 1))),
                    Expanded(
                      child: Text(
                        MyClass.FormatNumber(
                            jsonDecode(widget.data)[0]['totalSum']),
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.subDataHTxt(context, 1),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Container _head(context, lgs, fontsizeapps) {
  return Container(
    padding: EdgeInsets.all(12),
    color: MyColor.color('detailhead'),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            Language.dividendLg('detail', lgs),
            textScaleFactor: MyClass.blocFontSizeApp(fontsizeapps),
            textAlign: TextAlign.center,
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(''),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.dividendLg('amount', lgs),
            textScaleFactor: MyClass.blocFontSizeApp(fontsizeapps),
            textAlign: TextAlign.center,
            style: CustomTextStyle.headTitleTxt(context, 0),
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
