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
import 'package:dldcoop/FollowMe/pages/print/statement.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

double _fontsizeapps = 1.0;

class Deposit_movement extends StatefulWidget {
  Param param;
  String depositBalance;
  String depositAccountNo;

  Deposit_movement(
      {required this.depositBalance,
      required this.depositAccountNo,
      required this.param});

  @override
  _Deposit_movementState createState() => _Deposit_movementState();
}

class _Deposit_movementState extends State<Deposit_movement> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    var ObjDepMovement =
        '{"mode": "2","deposit_account_no":"' + widget.depositAccountNo + '"}';

    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: MyClass.backGround(context),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: tabletMode
                      ? displayHeight(context) * 0.27
                      : displayHeight(context) * 0.31,
                ),

                Padding(
                  padding: EdgeInsets.only(
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
                    child: FutureBuilder<List<DepiDetailModel>>(
                      future: Network.fetchDepMovement(
                          ObjDepMovement, widget.param.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.isNotEmpty
                              ? _detail(dep: snapshot.data)
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
              Language.deposit('accountMovements', widget.param.lgs),
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
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => Statement(
  //                 param: widget.param,
  //                 type: "dep",
  //                 data: widget.depositAccountNo),
  //           ),
  //         );
  //       },
  //       child: Center(
  //         child: Text(
  //           Language.other('printstatement', widget.param.lgs),
  //           textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
  //           style: CustomTextStyle.buttonTxt(context, -1),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _detail({dep}) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColor.color('datatitle'),
        ),
        child: Scrollbar(
          child: ListView.separated(
            padding: EdgeInsets.only(top: 0),
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
              height: 0,
            ),
            itemCount: dep.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildExpandableTile(dep[index]);
              // return Padding(
              //   padding: const EdgeInsets.only(left: 12, right: 12),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     mainAxisSize: MainAxisSize.min,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Expanded(
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           mainAxisSize: MainAxisSize.min,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: <Widget>[
              //             Text(
              //               MyClass.checkNull(dep[index].operatedate),
              //               // MyClass.convertDate(
              //               //     MyClass.checkNull(dep[index].operatedate)),
              //               textAlign: TextAlign.left,
              //               textScaleFactor:
              //                   MyClass.blocFontSizeApp(_fontsizeapps),
              //               style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
              //             ),
              //             Text(
              //               MyClass.checkNull(
              //                   dep[index].deposititemdescription),
              //               textAlign: TextAlign.left,
              //               textScaleFactor:
              //                   MyClass.blocFontSizeApp(_fontsizeapps),
              //               style: CustomTextStyle.dataTxt(context, 0),
              //             ),
              //             // add drop data
              //             Text(
              //               "ยอดคงเหลือ",
              //               textAlign: TextAlign.left,
              //               textScaleFactor:
              //                   MyClass.blocFontSizeApp(_fontsizeapps),
              //               style: CustomTextStyle.dataTxt(context, 0),
              //             ),
              //             Text(
              //               MyClass.checkNull(dep[index].totalbalance),
              //               textAlign: TextAlign.left,
              //               textScaleFactor:
              //                   MyClass.blocFontSizeApp(_fontsizeapps),
              //               style: CustomTextStyle.dataTxt(context, 0),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Expanded(
              //         flex: 1,
              //         child: Text(
              //           dep[index].depositbalance,
              //           // MyClass.FormatNumberCheckTxt(dep[index].depositbalance),
              //           textAlign: TextAlign.end,
              //           textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              //           style: CustomTextStyle.dataHTxt(
              //               context, 0, dep[index].signFlag < 0 ? 'R' : 'G'),
              //         ),
              //       ),

              //       // Expanded(
              //       //   flex: 1,
              //       //   child: InkWell(
              //       //     // onTap: () {
              //       //     //   print(dep[index].seqno.toString());
              //       //     //   _launchURL(
              //       //     //       "${MyClass.hostApp()}/api/v1/dep_statement_print/" +
              //       //     //           "${widget.depositAccountNo}" +
              //       //     //           "/"
              //       //     //               "${dep[index].seqno}" +
              //       //     //           "/" +
              //       //     //           "${widget.param.token}");
              //       //     // },
              //       //     child: Column(
              //       //       children: [
              //       //         Text(
              //       //           MyClass.FormatNumber(dep[index].totalbalance),
              //       //           textAlign: TextAlign.center,
              //       //           textScaleFactor:
              //       //               MyClass.blocFontSizeApp(_fontsizeapps),
              //       //           style:
              //       //               CustomTextStyle.defaultTxt1(context, 0, 'Bl'),
              //       //         ),
              //       //         // const Icon(
              //       //         //   Icons.print,
              //       //         //   size: 20,
              //       //         // ),
              //       //       ],
              //       //     ),
              //       //   ),
              //       // ),
              //     ],
              //   ),
              // );
            },
          ),
        ),
      );

  Widget _buildExpandableTile(dep) {
    return ExpansionTile(
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      MyClass.checkNull(dep.operatedate),
                      textAlign: TextAlign.left,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.dataHTxt(context, 1, 'BlH'),
                    ),
                    Text(
                      MyClass.checkNull(dep.deposititemdescription),
                      textAlign: TextAlign.left,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.dataTxt(context, 0),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: Text(
                    MyClass.checkNull(dep.depositbalance),
                    textAlign: TextAlign.end,
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.dataHTxt(
                        context, 1, dep.signFlag < 0 ? 'R' : 'G'),
                  ),
                ),
              ),
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
                  textAlign: TextAlign.left,
                  textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                  style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    MyClass.FormatNumber(dep.totalbalance),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.subDataHTxt(context, 1),
                    textAlign: TextAlign.end,
                  ))
            ],
          ),
        )
      ],
    );
  }

  Container _head(context, lgs) {
    return Container(
      padding: EdgeInsets.all(12),
      color: MyColor.color('detailhead'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              Language.deposit('date', lgs),
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, -2),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(''),
          ),
          Expanded(
            flex: 2,
            child: Text(
              Language.deposit('amount', lgs),
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, -2),
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Text(
          //     Language.deposit('balance', lgs),
          //     textAlign: TextAlign.center,
          //     textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
          //     style: CustomTextStyle.headTitleTxt(context, 0),
          //   ),
          // ),
        ],
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
                            Language.loanLg('balance', widget.param.lgs),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.subDataTxt(context, 1))),
                    Expanded(
                        child: Text(
                      MyClass.FormatNumber(widget.depositBalance),
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
