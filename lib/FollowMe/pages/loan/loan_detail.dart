import 'dart:convert';
import 'dart:io';

import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/pages/loan/loan_guarantee.dart';
import 'package:dldcoop/FollowMe/pages/loan/loan_movement.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Loan_detail extends StatefulWidget {
  Param param;
  String data;

  Loan_detail({required this.data, required this.param});

  @override
  _Loan_detailState createState() => _Loan_detailState();
}

class _Loan_detailState extends State<Loan_detail> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Stack(
        children: [
          // CustomTextStyle.headcolor(context, 0),
          Container(
            height: double.infinity,
            decoration: MyClass.backGround(context),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  hSizedBox(context, 36),
                  lineSizedBox(context, 0),
                  Container(
                    margin: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    padding: EdgeInsets.all(paddinglist(context, 0)),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 0,
                      ),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0)),
                      color: MyColor.color('datatitle'),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                  Language.loanLg('loanContractInformation',
                                      widget.param.lgs),
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style: CustomTextStyle.dataHeadTitleCTxt(
                                      context, 5, 'Bl')),
                            ),
                          ],
                        ),
                        lineSizedBox(context, 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      Language.loanLg('loanContractNumber',
                                          widget.param.lgs),
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.subDataTxt(
                                          context, 1))),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                jsonDecode(widget.data)[0]['loan_contract_no'],
                                // จัดรูปแบบ เลขที่สัญญาเงินกู้
                                // MyClass.formatcontactloan(
                                //     jsonDecode(widget.data)[0]
                                //         ['loan_contract_no']),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.subDataHTxt(context, 01),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      Language.loanLg('contractStartDate',
                                          widget.param.lgs),
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.subDataTxt(
                                          context, 1))),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                MyClass.checkNull(jsonDecode(widget.data)[0]
                                    ['begining_of_contract']),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.subDataHTxt(context, 1),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      Language.loanLg(
                                          'approvalLimit', widget.param.lgs),
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.subDataTxt(
                                          context, 1))),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                MyClass.FormatNumber(jsonDecode(widget.data)[0]
                                    ['loan_approve_amount']),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.subDataHTxt(context, 1),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        MyClass.checkNull(jsonDecode(widget.data)[0]
                                    ['loan_installment_amount']) ==
                                ''
                            ? SizedBox()
                            : lineSizedBox(context, -15),
                        MyClass.checkNull(jsonDecode(widget.data)[0]
                                    ['loan_installment_amount']) ==
                                ''
                            ? SizedBox()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                            Language.loanLg(
                                                'payment', widget.param.lgs),
                                            textScaleFactor:
                                                MyClass.blocFontSizeApp(
                                                    _fontsizeapps),
                                            style: CustomTextStyle.subDataTxt(
                                                context, 1))),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      MyClass.checkNull(
                                          jsonDecode(widget.data)[0]
                                              ['loan_installment_amount']),
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.subDataHTxt(
                                          context, 1),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                        MyClass.checkNull(jsonDecode(widget.data)[0]
                                    ['loan_installment_amount']) ==
                                ''
                            ? SizedBox()
                            : lineSizedBox(context, -15),
                        MyClass.checkNull(jsonDecode(widget.data)[0]
                                    ['loan_installment_amount']) ==
                                ''
                            ? SizedBox()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                            Language.loanLg(
                                                'periodAll', widget.param.lgs),
                                            textScaleFactor:
                                                MyClass.blocFontSizeApp(
                                                    _fontsizeapps),
                                            style: CustomTextStyle.subDataTxt(
                                                context, 1))),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      MyClass.checkNull(
                                          jsonDecode(widget.data)[0]
                                              ['loan_installment_amount']),
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.subDataHTxt(
                                          context, 1),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                        lineSizedBox(context, -15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      Language.loanLg('paymentInInstallments',
                                          widget.param.lgs),
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.subDataTxt(
                                          context, 1))),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                MyClass.FormatNumber(jsonDecode(widget.data)[0]
                                    ['period_payment_amount']),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.subDataHTxt(context, 1),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      Language.loanLg(
                                          'balance', widget.param.lgs),
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.subDataTxt(
                                          context, 1))),
                            ),
                            // const Expanded(
                            //     child: Center(child: Text(' : ')), flex: 1),
                            Expanded(
                              flex: 3,
                              child: Text(
                                MyClass.FormatNumber(jsonDecode(widget.data)[0]
                                    ['principal_balance']),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.subDataHTxt(context, 1),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      Language.loanLg(
                                          'period', widget.param.lgs),
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.subDataTxt(
                                          context, 1))),
                            ),
                            // const Expanded(
                            //     child: Center(child: Text(' : ')), flex: 1),
                            Expanded(
                              flex: 3,
                              child: Text(
                                MyClass.checkNull(
                                    jsonDecode(widget.data)[0]['last_period']),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.subDataHTxt(context, 1),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -20),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  _buttomClick(),
                  SizedBox(
                    height: displayHeight(context) * 0.03,
                  ),
                  _buttomClick1(),
                ],
              ),
            ),
          ),
          CustomUI.appbarBackgroundUi(context),

          CustomUI.appbarUi3(
              Language.loanLg('listOfLoanAgreements', widget.param.lgs),
              widget.param.fontsizeapps,
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
      // bottomNavigationBar: BottomAppBar(
      //   color: MyColor.color('tabs'),
      //   child: Container(
      //     padding: const EdgeInsets.only(left: 10, right: 10),
      //     height: displayWidth(context) * 0.10,
      //     child: Row(
      //       children: [
      //         Expanded(
      //           child: Text(''),
      //         ),
      //         Container(
      //           width: displayWidth(context) * 0.4,
      //           height: displayHeight(context) * 0.06,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(30.0),
      //             gradient: LinearGradient(
      //               colors: <Color>[
      //                 MyColor.color('buttongra'),
      //                 MyColor.color('buttongra1'),
      //               ],
      //             ),
      //           ),
      //           padding: const EdgeInsets.only(right: 5),
      //           child: InkWell(
      //             onTap: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => Loan_guarantee(
      //                       loanContractNo: jsonDecode(widget.data)[0]
      //                           ['loan_contract_no'],
      //                       principalBalance: jsonDecode(widget.data)[0]
      //                           ['principal_balance'],
      //                       param: widget.param),
      //                 ),
      //               );
      //             },
      //             child: Center(
      //               child: Text(
      //                 Language.loanLg('showGuarantees', widget.param.lgs),
      //                 textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
      //                 style: CustomTextStyle.buttonTxt(context, -1),
      //               ),
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //           child: Text(''),
      //         ),
      //         Container(
      //           width: displayWidth(context) * 0.4,
      //           height: displayHeight(context) * 0.06,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(30.0),
      //             gradient: LinearGradient(
      //               colors: <Color>[
      //                 MyColor.color('buttongra'),
      //                 MyColor.color('buttongra1'),
      //               ],
      //             ),
      //           ),
      //           padding: const EdgeInsets.only(right: 5),
      //           child: InkWell(
      //             onTap: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => Loan_movement(
      //                       loanContractNo: jsonDecode(widget.data)[0]
      //                           ['loan_contract_no'],
      //                       principalBalance: jsonDecode(widget.data)[0]
      //                           ['principal_balance'],
      //                       param: widget.param),
      //                 ),
      //               );
      //             },
      //             child: Center(
      //               child: Text(
      //                 Language.loanLg('showMovementlist', widget.param.lgs),
      //                 textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
      //                 style: CustomTextStyle.buttonTxt(context, -1),
      //               ),
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //           child: Text(''),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
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
            MyColor.color('buttongra'),
          ],
        ),
      ),
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Loan_guarantee(
                  loanContractNo: jsonDecode(widget.data)[0]
                      ['loan_contract_no'],
                  principalBalance: jsonDecode(widget.data)[0]
                      ['principal_balance'],
                  param: widget.param),
            ),
          );
        },
        child: Center(
          child: Text(
            Language.loanLg('showGuarantees', widget.param.lgs),
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.buttonTxt(context, -1),
          ),
        ),
      ),
    );
  }

  Container _buttomClick1() {
    return Container(
      width: displayWidth(context) * 0.7,
      height: displayHeight(context) * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: <Color>[
            MyColor.color('buttongra'),
            MyColor.color('buttongra'),
          ],
        ),
      ),
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Loan_movement(
                  loanContractNo: jsonDecode(widget.data)[0]
                      ['loan_contract_no'],
                  principalBalance: jsonDecode(widget.data)[0]
                      ['principal_balance'],
                  param: widget.param),
            ),
          );
        },
        child: Center(
          child: Text(
            Language.loanLg('showMovementlist', widget.param.lgs),
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.buttonTxt(context, -1),
          ),
        ),
      ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
