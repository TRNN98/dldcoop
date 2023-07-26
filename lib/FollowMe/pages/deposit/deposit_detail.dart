import 'dart:convert';
import 'dart:io';

import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/pages/deposit/deposit_movement.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Deposit_detail extends StatefulWidget {
  Param param;
  String data;

  Deposit_detail({required this.data, required this.param});

  @override
  _Deposit_detailState createState() => _Deposit_detailState();
}

class _Deposit_detailState extends State<Deposit_detail> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    ;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            decoration: MyClass.backGround(context),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: tabletMode
                        ? displayHeight(context) * 0.35
                        : displayHeight(context) * 0.285,
                  ),
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
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                Language.deposit('depositContractInformation',
                                    widget.param.lgs),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.dataHeadTitleCTxt(
                                    context, 5, 'Bl'),
                              ),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Text(
                                  Language.deposit(
                                      'accountNumber', widget.param.lgs),
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataTxt(context, 1)),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                jsonDecode(widget.data)[0]
                                    ['deposit_account_no'],
                                // MyClass.formatcontactaccoutn(
                                //     jsonDecode(widget.data)[0]
                                //         ['deposit_account_no']),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.subDataHTxt(context, 1),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Text(
                                  Language.deposit(
                                      'accountName', widget.param.lgs),
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataTxt(context, 1)),
                            ),
                            Expanded(
                                flex: 4,
                                child: Text(
                                  jsonDecode(widget.data)[0]
                                      ['deposit_account_name'],
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataHTxt(context, 1),
                                  textAlign: TextAlign.end,
                                )),
                          ],
                        ),
                        lineSizedBox(context, -20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Text(
                                  Language.deposit(
                                      'accountType', widget.param.lgs),
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataTxt(context, 1)),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                jsonDecode(widget.data)[0]['deposit_name'],
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.subDataHTxt(context, 1),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Text(
                                  Language.deposit(
                                      'accountOpeningDate', widget.param.lgs),
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataTxt(context, 1)),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                jsonDecode(widget.data)[0]
                                    ['deposit_opened_date'],
                                // MyClass.convertDate(jsonDecode(widget.data)[0]
                                //     ['deposit_opened_date']),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.subDataHTxt(context, 1),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Text(
                                  Language.deposit(
                                      'remainingAmount', widget.param.lgs),
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataTxt(context, 1)),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                MyClass.FormatNumber(jsonDecode(widget.data)[0]
                                    ['deposit_balance']),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.subDataHTxt(context, 1),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Text(
                                  Language.deposit(
                                      'amountWithdrawn', widget.param.lgs),
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataTxt(context, 1)),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                MyClass.FormatNumber(jsonDecode(widget.data)[0]
                                    ['withdrawable_amount']),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.subDataHTxt(context, 1),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: <Widget>[
                        //     Expanded(
                        //       child: Container(
                        //           alignment: Alignment.bottomRight,
                        //           child: Text(
                        //               Language.deposit(
                        //                   'guaranteeAmount', widget.param.lgs),
                        //               textScaleFactor:
                        //               MyClass.blocFontSizeApp(_fontsizeapps),
                        //               style:
                        //               CustomTextStyle.subDataTxt(context, 0))),
                        //       flex: 2,
                        //     ),
                        //     Expanded(child: const Center(child: Text(' : ')), flex: 1),
                        //     Expanded(
                        //       child: Text(
                        //           '',
                        //           textScaleFactor:
                        //           MyClass.blocFontSizeApp(_fontsizeapps),
                        //           style: CustomTextStyle.defaultTxt(context, 0)),
                        //       flex: 2,
                        //     ),
                        //   ],
                        // ),
                        //
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: <Widget>[
                        //     Expanded(
                        //       child: Container(
                        //           alignment: Alignment.bottomRight,
                        //           child: Text(
                        //               Language.deposit(
                        //                   'monthlyDepositAmount', widget.param.lgs),
                        //               textScaleFactor:
                        //               MyClass.blocFontSizeApp(_fontsizeapps),
                        //               style:
                        //               CustomTextStyle.subDataTxt(context, 0))),
                        //       flex: 2,
                        //     ),
                        //     Expanded(child: const Center(child: Text(' : ')), flex: 1),
                        //     Expanded(
                        //       child: Text(
                        //           '',
                        //           textScaleFactor:
                        //           MyClass.blocFontSizeApp(_fontsizeapps),
                        //           style: CustomTextStyle.defaultTxt(context, 0)),
                        //       flex: 2,
                        //     ),
                        //   ],
                        // ),
                        lineSizedBox(context, -20),

                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Text(
                                  Language.deposit(
                                      'currentInterestRate', widget.param.lgs),
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.subDataTxt(context, 1)),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                jsonDecode(widget.data)[0]
                                    ['accumulate_interest'],
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.subDataHTxt(context, 1),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: <Widget>[
                        //     Expanded(
                        //       child: Container(
                        //           alignment: Alignment.bottomRight,
                        //           child: Text(
                        //               Language.deposit(
                        //                   'atmCoop', widget.param.lgs),
                        //               textScaleFactor: MyClass.blocFontSizeApp(
                        //                   _fontsizeapps),
                        //               style: CustomTextStyle.subDataTxt(
                        //                   context, 0))),
                        //       flex: 2,
                        //     ),
                        //     Expanded(
                        //         child: const Center(child: Text(' : ')),
                        //         flex: 1),
                        //     Expanded(
                        //       child: Text(
                        //           jsonDecode(widget.data)[0]['ATM_STATUS'] ==
                        //                   "1"
                        //               ? 'ใช้บริการ'
                        //               : 'ไม่ใช้บริการ',
                        //           textScaleFactor:
                        //               MyClass.blocFontSizeApp(_fontsizeapps),
                        //           style:
                        //               CustomTextStyle.subDataTxt(context, 0)),
                        //       flex: 2,
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Platform.isAndroid
                        ? displayHeight(context) * 0.2
                        : displayHeight(context) * 0.15,
                  ),
                  _buttomClick(),
                ],
              ),
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi3(
              Language.deposit('depositAccountDetails', widget.param.lgs),
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
      //     width: displayWidth(context) * 1,
      //     height: displayHeight(context) * 0.06,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(30.0),
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
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => Deposit_movement(
      //                 depositBalance: jsonDecode(widget.data)[0]
      //                     ['deposit_balance'],
      //                 depositAccountNo: jsonDecode(widget.data)[0]
      //                     ['deposit_account_no'],
      //                 param: widget.param),
      //           ),
      //         );
      //       },
      //       child: Center(
      //         child: Text(
      //           Language.deposit('accountMovements', widget.param.lgs),
      //           textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
      //           style: CustomTextStyle.buttonTxt(context, 0),
      //         ),
      //       ),
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
            MyColor.color('buttongra1'),
          ],
        ),
      ),
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Deposit_movement(
                  depositBalance: jsonDecode(widget.data)[0]['deposit_balance'],
                  depositAccountNo: jsonDecode(widget.data)[0]
                      ['deposit_account_no'],
                  param: widget.param),
            ),
          );
        },
        child: Center(
          child: Text(
            Language.deposit('seeMovements', widget.param.lgs),
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.buttonTxt(context, 0),
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
            padding: EdgeInsets.all(12),
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
