import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dldcoop/FollowMe/models/loan_request/LoanRequestModel.dart';
import 'package:dldcoop/FollowMe/pages/dividend/dividend_detail.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../class/customUI.dart';
import '../../class/language.dart';
import '../../class/myclass.dart';
import '../../class/mycolor.dart';
import '../../class/sizes.dart';
import '../../class/textstyle.dart';
import '../../class/widget.dart';
import '../../models/share/shareModel_h.dart';
import '../../services/netword.dart';
import '../auth/Pins.dart';

class LoanRequestmentDetail extends StatefulWidget {
  Param param;
  String data;
  // String loanRequestmentNo;

  LoanRequestmentDetail({
    required this.param,
    required this.data,
  });

  @override
  State<LoanRequestmentDetail> createState() => _LoanRequestmentDetailState();
}

class _LoanRequestmentDetailState extends State<LoanRequestmentDetail> {
  @override
  Widget build(BuildContext context) {
    print(jsonDecode(widget.data)[0]['loan_requestment_no']);

    var ObjLoanRequest2 = '{"mode": "2","loan_requestment_no":"' +
        jsonDecode(widget.data)[0]['loan_requestment_no'].toString() +
        '"}';

    var ObjHeadShare = '{"mode": "1"}';
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    print(ObjLoanRequest2);
    // print(jsonEncode(widget.loanRequestmentNo));
    // print(jsonDecode(widget.loanRequestmentNo));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(context),
            child: Column(
              children: [
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
                    child: FutureBuilder<List<LoanRequest>>(
                      future: Network.fetchLoanRequest(
                          ObjLoanRequest2, widget.param.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return _detail(
                              jsonDecode(widget.data)[0]['sms_message'],
                              jsonDecode(widget.data)[0]
                                  ['loan_type_description'],
                              LoanRequest: snapshot.data);

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
              Language.StatusLoanLg('loanRequestDetail', widget.param.lgs),
              widget.param.fontsizeapps,
              context),
        ],
      ),
    );
  }

  Widget _detail(sms_message, type, {LoanRequest}) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColor.color('datatitle'),
        ),
        child: Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
            ),
            // itemCount: div.length,
            itemCount: LoanRequest.length,
            itemBuilder: (BuildContext context, int index) {
              // print(div[index]);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'วันที่ ',
                        textAlign: TextAlign.start,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, -1, 'Bl'),
                      ),
                      Text(
                        MyClass.checkNull(
                            LoanRequest[index].smsDate.toString()),
                        textAlign: TextAlign.start,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, 0, 'Bl'),
                      ),
                    ],
                  ),
                  Text(
                    'เรื่อง ' +
                        MyClass.checkNull(
                            LoanRequest[index].smsDesc.toString()),
                    textAlign: TextAlign.start,
                    textScaleFactor:
                        MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                    style: CustomTextStyle.dataHTxt(context, -1, 'Bl'),
                  ),
                  Text(
                    MyClass.checkNull(LoanRequest[index].smsMessage.toString()),
                    textAlign: TextAlign.start,
                    textScaleFactor:
                        MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                    style: CustomTextStyle.defaultpdpaTxt(context, -1),
                  ),
                ],
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
                Divider(
                  endIndent: 5,
                  height: 20,
                  thickness: 1,
                  color: MyColor.color('divider'),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        Language.StatusLoanLg('status', widget.param.lgs),
                        textAlign: TextAlign.start,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Text(
                          MyClass.checkNull(
                              jsonDecode(widget.data)[0]['approve_status']),
                          // 'status',
                          // 'อนุมัติ',
                          textAlign: TextAlign.end,
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.dataHTxt(
                              context,
                              0,
                              jsonDecode(widget.data)[0]['approve_status'] ==
                                      'อนุมัติ'
                                  ? 'G'
                                  : 'R'),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        Language.StatusLoanLg('dateApproved', widget.param.lgs),
                        textAlign: TextAlign.start,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.defaultpdpaTxt(context, 0),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          MyClass.checkNull(
                              jsonDecode(widget.data)[0]['approve_date']),
                          // approve_date
                          // 'xx x.x. xxxx',
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
                        Language.StatusLoanLg('loanAmount', widget.param.lgs),
                        textAlign: TextAlign.start,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.defaultpdpaTxt(context, 0),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          MyClass.FormatNumber(
                              jsonDecode(widget.data)[0]['mem_request_amount']),
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
                        Language.StatusLoanLg(
                            'approvedAmount', widget.param.lgs),
                        textAlign: TextAlign.start,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.defaultpdpaTxt(context, 0),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          MyClass.FormatNumber(jsonDecode(widget.data)[0]
                              ['loan_rapprove_amount']),
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
                        Language.StatusLoanLg(
                            'paymentChannel', widget.param.lgs),
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
                              MyClass.checkNull(jsonDecode(widget.data)[0]
                                  ['money_type_name']),
                              textAlign: TextAlign.end,
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.defaultpdpaTxt(context, 0),
                            ),
                            Text(
                              MyClass.checkNull(
                                  jsonDecode(widget.data)[0]['bank_name']),
                              textAlign: TextAlign.end,
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.defaultpdpaTxt(context, 0),
                            ),
                            Text(
                              MyClass.checkNull(
                                  jsonDecode(widget.data)[0]['bank_acc_no']),
                              textAlign: TextAlign.end,
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.defaultpdpaTxt(context, 0),
                            ),
                          ],
                        ))
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            Language.StatusLoanLg('note', lgs),
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
