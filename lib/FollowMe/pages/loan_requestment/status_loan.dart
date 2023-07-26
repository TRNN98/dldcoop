import 'dart:convert';
import 'dart:io';

import 'package:dldcoop/FollowMe/models/deposit/depiDetailModel.dart';
import 'package:dldcoop/FollowMe/pages/InTro/pdpa.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/pages/loan_requestment/status_loan_detail.dart';
import 'package:dldcoop/FollowMe/pages/print/statement.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/gain/gainModel.dart';
import '../../models/loan_request/LoanRequestModel.dart';
import '../../models/share/shareModel_D.dart';

double _fontsizeapps = 1.0;

class Status_loan extends StatefulWidget {
  Param param;

  Status_loan(this.param);

  @override
  _Status_loanState createState() => _Status_loanState();
}

class _Status_loanState extends State<Status_loan> {
  var ObjHeadShare = '{"mode": "1"}';
  var ObjLoanRequest = '{"mode": "1"}';
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
                    child: FutureBuilder<List<LoanRequest>>(
                      future: Network.fetchLoanRequest(
                          ObjLoanRequest, widget.param.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.isNotEmpty
                              ? _detail(
                                  LoanRequest: snapshot.data,
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
                SizedBox(
                  height: displayHeight(context) * 0.01,
                ),
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi3(
              Language.StatusLoanLg('StatusLoan', widget.param.lgs),
              widget.param.fontsizeapps,
              context),
          CustomUI.appbarDetailUi('assets/imgs/StatusLoan.png', context),
        ],
      ),
    );
  }

  Widget _detail({LoanRequest}) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColor.color('datatitle'),
        ),
        child: Scrollbar(
          child: ListView.separated(
            padding: EdgeInsets.only(top: 5),
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
            ),
            itemCount: LoanRequest.length,
            itemBuilder: (BuildContext context, int index) {
              bool tabletMode = MediaQuery.of(context).size.width > 600;
              return InkWell(
                onTap: () {
                  var data = [
                    {
                      "loan_type_description":
                          LoanRequest[index].loanTypeDescription,
                      "loan_requestment_no":
                          LoanRequest[index].loanRequestmentNo,
                      "sms_message": LoanRequest[index].smsMessage,
                      "approve_status": LoanRequest[index].approveStatus,
                      "approve_date": LoanRequest[index].approveDate,
                      "mem_request_amount": LoanRequest[index].memRequestAmount,
                      "loan_rapprove_amount":
                          LoanRequest[index].loanApproveAmount,
                      "money_type_name": LoanRequest[index].moneyTypeName,
                      "bank_name": LoanRequest[index].bankName,
                      "bank_acc_no": LoanRequest[index].bankAccNo,
                      "sms_message": LoanRequest[index].smsMessage.toString(),
                    }
                  ];

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoanRequestmentDetail(
                        data: jsonEncode(data),
                        param: widget.param,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: Text(
                                MyClass.checkNull(
                                  LoanRequest[index]
                                      .loanTypeDescription
                                      .toString(),
                                ),
                                textAlign: TextAlign.start,
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.subDataTxt(context, -1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              MyClass.checkNull(LoanRequest[index]
                                  .loanRequestmentNo
                                  .toString()),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.subDataTxt(context, -1),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              MyClass.checkNull(LoanRequest[index]
                                  .requestmentDate
                                  .toString()),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.subDataTxt(context, -1),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: tabletMode ? 35 : 20,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );

  Widget _detail3({share}) => Container(
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

  Widget _buildExpandableTile(share) {
    return ExpansionTile(
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'เงินกู้สามัญ',
                      textAlign: TextAlign.start,
                      textScaleFactor:
                          MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStyle.defaultpdpaTxt(context, -1),
                    ),
                    Text(
                      "ไม่เกินร้อยละเก้า",
                      textAlign: TextAlign.start,
                      textScaleFactor:
                          MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStyle.defaultpdpaTxt(context, -1),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    'xxxxxxxx',
                    textAlign: TextAlign.center,
                    textScaleFactor:
                        MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                    style: CustomTextStyle.defaultpdpaTxt(context, -1),
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      'xx x.x. xxxx',
                      textAlign: TextAlign.end,
                      textScaleFactor:
                          MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStyle.defaultpdpaTxt(context, -1),
                    ),
                  )),
            ],
          ),
        ],
      ),
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
            color: MyColor.color('bgStatus'),
          ),
          child: ListTile(
            title: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        Language.StatusLoanLg('status', lgs),
                        textAlign: TextAlign.start,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Text(
                          'อนุมัติ',
                          textAlign: TextAlign.end,
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.dataHTxt(context, 0, 'G'),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        Language.StatusLoanLg('dateApproved', lgs),
                        textAlign: TextAlign.start,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.defaultpdpaTxt(context, 0),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          'xx x.x. xxxx',
                          textAlign: TextAlign.end,
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.defaultpdpaTxt(context, 0),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        Language.StatusLoanLg('loanAmount', lgs),
                        textAlign: TextAlign.start,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.defaultpdpaTxt(context, 0),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          'x,xxx,xxx.xx',
                          textAlign: TextAlign.end,
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.defaultpdpaTxt(context, 0),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        Language.StatusLoanLg('approvedAmount', lgs),
                        textAlign: TextAlign.start,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.defaultpdpaTxt(context, 0),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          MyClass.FormatNumber(share.shareStock),
                          textAlign: TextAlign.end,
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.defaultpdpaTxt(context, 0),
                        ))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        Language.StatusLoanLg('paymentChannel', lgs),
                        textAlign: TextAlign.start,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.defaultpdpaTxt(context, 0),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'โอนเข้า บัญชีธนาคาร',
                              textAlign: TextAlign.end,
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.defaultpdpaTxt(context, 0),
                            ),
                            Text(
                              'ธ.ไทยพาณิชย์',
                              textAlign: TextAlign.end,
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.defaultpdpaTxt(context, 0),
                            ),
                            Text(
                              'xxx-xxxxx-xxxx',
                              textAlign: TextAlign.end,
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.defaultpdpaTxt(context, 0),
                            ),
                          ],
                        ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        Language.StatusLoanLg('note', lgs),
                        textAlign: TextAlign.start,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      Language.StatusLoanLg('note_detail', lgs),
                      textAlign: TextAlign.start,
                      textScaleFactor:
                          MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStyle.defaultpdpaTxt(context, -1),
                    ),
                  ],
                )
              ],
            ),
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
            flex: 3,
            child: Text(
              Language.StatusLoanLg('typeLoan', lgs),
              textAlign: TextAlign.start,
              textScaleFactor:
                  MyClass.blocFontSizeApp(widget.param.fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, -3),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              Language.StatusLoanLg('numberLoan', lgs),
              textAlign: TextAlign.center,
              textScaleFactor:
                  MyClass.blocFontSizeApp(widget.param.fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, -3),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              Language.StatusLoanLg('dateLoan', lgs),
              textAlign: TextAlign.end,
              textScaleFactor:
                  MyClass.blocFontSizeApp(widget.param.fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, -3),
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
