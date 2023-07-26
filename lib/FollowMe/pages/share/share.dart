import 'dart:convert';
import 'package:dldcoop/FollowMe/models/share/shareModel_D.dart';
import 'package:dldcoop/FollowMe/models/share/shareModel_h.dart';
import 'package:dldcoop/FollowMe/pages/InTro/pdpa.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/pages/dividend/dividend_detail.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../print/statement.dart';

class Share extends StatefulWidget {
  Param param;

  Share(this.param);

  @override
  _ShareState createState() => _ShareState();
}

class _ShareState extends State<Share> {
  var ObjHeadShare = '{"mode": "1"}';
  var ObjShare = '{"mode": "2"}';

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: MyClass.backGround(context),
            child: Column(
              children: <Widget>[
                tabletMode ? hSizedBox(context, 0) : hSizedBox(context, 70),

                Padding(
                  padding: EdgeInsets.only(
                      left: paddinglist(context, 0),
                      right: paddinglist(context, 0)),
                ),
                // lineSizedBox(context, 0),
                FutureBuilder<List<ShareModelH>>(
                  future: Network.fetchHeadShare(
                      ObjHeadShare, widget.param.token, context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.length > 0
                          ? Padding(
                              padding: EdgeInsets.only(
                                  left: paddinglist(context, 0),
                                  right: paddinglist(context, 0)),
                              child: _subdatahead(
                                  jsonDecode(jsonEncode(snapshot.data))[0]
                                      ['share_stock'],
                                  jsonDecode(jsonEncode(snapshot.data))[0]
                                      ['share_amount'],
                                  jsonDecode(jsonEncode(snapshot.data))[0]
                                      ['period_recrieve'],
                                  jsonDecode(jsonEncode(snapshot.data))[0]
                                      ['drop_status'],
                                  // jsonDecode(jsonEncode(snapshot.data))[0]
                                  //     ['this_month_keep'],
                                  // jsonDecode(jsonEncode(snapshot.data))[0]
                                  //     ['pending_amt'],
                                  context),
                            )
                          : MyWidget.nodata(widget.param.lgs, context);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return MyClass.loading();
                  },
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: paddinglist(context, 0),
                      right: paddinglist(context, 0)),
                  child: _head(context, widget.param.lgs),
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: FutureBuilder<List<ShareModelD>>(
                      future: Network.fetchShare(
                          ObjShare, widget.param.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.isNotEmpty
                              ? _detail(
                                  share: snapshot.data,
                                )
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
                  height: displayHeight(context) * 0.01,
                ),
                // _buttomClick(),
                SizedBox(
                  height: displayHeight(context) * 0.01,
                ),
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi3(Language.shareLg('share', widget.param.lgs),
              widget.param.fontsizeapps, context),
          CustomUI.appbarDetailUi('assets/imgs/share.png', context),
        ],
      ),
    );
  }

  Widget _detail({share}) => Container(
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
            itemCount: share.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildExpandableTile(share[index]);
            },
          ),
        ),
      );

  Center _subdatahead(amount, stock, period, status, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
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
            padding: const EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                          Language.shareLg(
                              'shareContractInformation', widget.param.lgs),
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, 5, 'Bl')),
                    ),
                  ],
                ),
                lineSizedBox(context, -20),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.shareLg('member', widget.param.lgs),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Text(Language.shareLg('name', widget.param.lgs),
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
                  children: <Widget>[
                    Expanded(
                        child: Text(Language.shareLg('share', widget.param.lgs),
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.subDataTxt(context, 1))),
                    Expanded(
                        child: Text(
                      MyClass.FormatNumber(amount),
                      textScaleFactor:
                          MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                      textAlign: TextAlign.end,
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.shareLg('period', widget.param.lgs),
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.subDataTxt(context, 1))),
                    Expanded(
                        child: Text(
                      period,
                      textScaleFactor:
                          MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                      textAlign: TextAlign.end,
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.shareLg('monthlyShare', widget.param.lgs),
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.subDataTxt(context, 1))),
                    Expanded(
                        child: Text(
                      MyClass.FormatNumber(stock),
                      textScaleFactor:
                          MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                      textAlign: TextAlign.end,
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.shareLg('Sstatus', widget.param.lgs),
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.subDataTxt(context, 1))),
                    status == '0'
                        ? Expanded(
                            child: Text("ส่งปกติ",
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.param.fontsizeapps),
                                style: CustomTextStyle.subDataHTxt(
                                    context, tabletMode ? 4 : 1),
                                textAlign: TextAlign.end))
                        : Expanded(
                            child: Text("งดส่ง",
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.param.fontsizeapps),
                                style: CustomTextStyle.subDataHTxt(
                                    context, tabletMode ? 4 : 1),
                                textAlign: TextAlign.end)),
                    // Expanded(
                    //     child: Text(
                    //   status,
                    //   textScaleFactor:
                    //       MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                    //   style: CustomTextStyle.subDataHTxt(context, 1),
                    //   textAlign: TextAlign.end,
                    // )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableTile(share) {
    return ExpansionTile(
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      MyClass.checkNull(share.operateDate),
                      textAlign: TextAlign.start,
                      textScaleFactor:
                          MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                    ),
                    Text(
                      MyClass.checkNull(share.itemTypeDescription),
                      textAlign: TextAlign.start,
                      textScaleFactor:
                          MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStyle.dataTxt(context, 1),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: Text(
                    MyClass.checkNull(share.period),
                    textAlign: TextAlign.center,
                    textScaleFactor:
                        MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                    style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Text(
                      MyClass.FormatNumber(share.shareValue.toString()),
                      textAlign: TextAlign.end,
                      textScaleFactor:
                          MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStyle.dataHTxt(context, 0, 'G'),
                    ),
                  )),
            ],
          ),
        ],
      ),
      children: <Widget>[
        ListTile(
          title: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  Language.shareLg('amountM', lgs),
                  textAlign: TextAlign.start,
                  textScaleFactor:
                      MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    MyClass.FormatNumber(share.shareStock),
                    textAlign: TextAlign.end,
                    textScaleFactor:
                        MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                    style: CustomTextStyle.dataHTxt(context, 0, 'G'),
                  )),
            ],
          ),
        )
      ],
    );
  }

  Container _head(context, lgs) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: MyColor.color('detailhead'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              Language.shareLg('date', lgs),
              textAlign: TextAlign.center,
              textScaleFactor:
                  MyClass.blocFontSizeApp(widget.param.fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, -2),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              Language.shareLg('period1', lgs),
              textAlign: TextAlign.center,
              textScaleFactor:
                  MyClass.blocFontSizeApp(widget.param.fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, -2),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              Language.shareLg('amount', lgs),
              textAlign: TextAlign.center,
              textScaleFactor:
                  MyClass.blocFontSizeApp(widget.param.fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, -2),
            ),
          ),
        ],
      ),
    );
  }
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
