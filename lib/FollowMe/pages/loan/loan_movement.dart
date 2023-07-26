import 'dart:io';

import 'package:dldcoop/FollowMe/models/loan/loanModle_D.dart';
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

import '../print/statement.dart';

double _fontsizeapps = 1.0;
bool tabletMode = false;

class Loan_movement extends StatefulWidget {
  Param param;
  String loanContractNo;
  String principalBalance;

  Loan_movement(
      {required this.loanContractNo,
      required this.principalBalance,
      required this.param});

  @override
  _Loan_movementState createState() => _Loan_movementState();
}

class _Loan_movementState extends State<Loan_movement> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    tabletMode = MediaQuery.of(context).size.width > 600;
    var ObjLoan = '{"mode": "2","contract_no":"' + widget.loanContractNo + '"}';
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(context),
            child: Column(
              children: [
                SizedBox(
                  height: tabletMode
                      ? displayHeight(context) * 0.34
                      : displayHeight(context) * 0.35,
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
                    child: FutureBuilder<List<LoanModleD>>(
                      future: Network.fetchLoanMovement(
                          ObjLoan, widget.param.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.isNotEmpty
                              ? _detail(
                                  loanMovement: snapshot.data,
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
          CustomUI.appbarUi3(
              Language.loanLg('loanMovementlist', widget.param.lgs),
              _fontsizeapps,
              context),
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
        ],
      ),
    );
  }

  Widget _detail({loanMovement}) => Container(
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
            itemCount: loanMovement.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildExpandableTile(loanMovement[index]);
            },
          ),
        ),
      );
  Widget _buildExpandableTile(loanMovement) {
    return ExpansionTile(
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      MyClass.checkNull(loanMovement.loanPaymentDate),
                      textAlign: TextAlign.start,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.subDataTxt(context, 0),
                    ),
                    Text(
                      MyClass.checkNull(loanMovement.itemTypeDescription),
                      textAlign: TextAlign.start,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.dataTxt(context, 0),
                    ),

                    // ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  MyClass.checkNull(loanMovement.period.toString()),
                  textAlign: TextAlign.end,
                  textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                  style: CustomTextStyle.subDataHTxt(context, 0),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Text(
                    MyClass.FormatNumber(loanMovement.principalbalance),
                    textAlign: TextAlign.end,
                    textScaleFactor:
                        MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                    style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                  )),
            ],
          )
        ],
      ),
      children: <Widget>[
        ListTile(
          title: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      Language.loanLg('principal', widget.param.lgs),
                      textAlign: TextAlign.start,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      MyClass.FormatNumber(loanMovement.paymentAmount),
                      textAlign: TextAlign.end,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      Language.loanLg('interest', widget.param.lgs),
                      textAlign: TextAlign.start,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      MyClass.FormatNumber(loanMovement.interestAmount),
                      textAlign: TextAlign.end,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                    ),
                  ),
                ],
              )
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
                color: MyColor.color('datatitle')),
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(Language.loanLg('member', widget.param.lgs),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Text(Language.loanLg('name', widget.param.lgs),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.subDataTxt(context, 1))),
                    Expanded(
                        child: Text(
                      widget.param.name,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                      textAlign: TextAlign.end,
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.loanLg(
                                'loanContractNumber', widget.param.lgs),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.subDataTxt(context, 1))),
                    Expanded(
                        child: Text(
                      widget.loanContractNo,
                      // MyClass.formatcontactloan(widget.loanContractNo),
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                      textAlign: TextAlign.end,
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.loanLg('balance', widget.param.lgs),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.subDataTxt(context, 1))),
                    Expanded(
                        child: Text(
                      MyClass.FormatNumber(widget.principalBalance),
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 1),
                      textAlign: TextAlign.end,
                    )),
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

Container _head(context, lgs) {
  return Container(
    padding: EdgeInsets.all(12),
    color: MyColor.color('detailhead'),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Text(
            Language.loanLg('date', lgs),
            textAlign: TextAlign.start,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, tabletMode ? -1 : -4),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            Language.loanLg('period1', lgs),
            textAlign: TextAlign.start,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, tabletMode ? -1 : -4),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            Language.loanLg('loantotal', lgs),
            textAlign: TextAlign.end,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, tabletMode ? -1 : -4),
          ),
        ),
        Expanded(child: Text(''))
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
