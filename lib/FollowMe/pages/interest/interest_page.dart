import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/pages/settings/settings.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';

import '../../models/Interest/InterestModel.dart';
import '../../models/deposit/depModelH.dart';

double _fontsizeapps = 1.0;
int checkpage = 0;
int textSelect = 0;

class Interest extends StatefulWidget {
  Param param;

  Interest(this.param);

  @override
  _InterestState createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  var objInterest = '{"mode": "1"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(context),
            child: Column(
              children: [
                tabletMode ? hSizedBox(context, 0) : hSizedBox(context, 70),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: _ButtonInterest(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: paddinglist(context, 0),
                      left: paddinglist(context, 0),
                      right: paddinglist(context, 0)),
                  child: _head(context, widget.param.lgs),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: FutureBuilder<List<InterestModel>>(
                      future: Network.fetchInterest(
                          objInterest, widget.param.token),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.isNotEmpty
                              ? checkpage == 0
                                  ? _detail(
                                      Interest: snapshot.data,
                                    )
                                  // _detail_Dep_int_rate(
                                  //     Interest: snapshot.data,
                                  //   )
                                  // _scroll(
                                  //     Interest: snapshot.data,
                                  //   )
                                  : _detail_Loan_int_rate()
                              : MyWidget.nodata(widget.param.lgs, context);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return MyClass.loading();
                      },
                    ),
                  ),
                )
                // Expanded(
                //   child: Padding(
                //     padding: EdgeInsets.only(
                //         left: paddinglist(context, 0),
                //         right: paddinglist(context, 0)),
                //     child: checkpage == 0
                //         ? _detail_Dep_int_rate(
                //             // Interest: snapshot.data,
                //             )
                //         : _detail_Loan_int_rate(),
                //   ),
                // ),
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi3(Language.InterestLg('Interest', widget.param.lgs),
              widget.param.fontsizeapps, context),
          CustomUI.appbarDetailUi('assets/imgs/rate.png', context),
        ],
      ),
    );
  }

  Widget _ButtonInterest() {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: tabletMode
          ? const EdgeInsets.only(left: 55, right: 55)
          : EdgeInsets.fromLTRB(16, 0, 12, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                textSelect = 0;
                checkpage = 0;
              });
            },
            child: Center(
              child: textSelect == 0
                  ? Container(
                      width: displayWidth(context) * 0.4,
                      height: displayHeight(context) * 0.045,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        gradient: LinearGradient(
                          colors: <Color>[
                            MyColor.color('detailhead'),
                            MyColor.color('detailhead'),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          Language.InterestLg(
                              'DepositInterestRates', widget.param.lgs),
                          textScaleFactor: MyClass.fontSizeApp(),
                          style: CustomTextStyle.dataBoldTxtC(context, -5, 'W'),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: displayWidth(context) * 0.4,
                      height: displayHeight(context) * 0.045,
                      child: Center(
                        child: Text(
                          Language.InterestLg(
                              'DepositInterestRates', widget.param.lgs),
                          textScaleFactor: MyClass.fontSizeApp(),
                          style: CustomTextStyle.dataBoldTxtC(
                              context, -5, 'Txthead'),
                        ),
                      ),
                    ),
            ),
          ),
          const Expanded(child: Text('')),
          InkWell(
            onTap: () {
              setState(() {
                textSelect = 1;
                checkpage = 1;
              });
            },
            child: Center(
              child: textSelect == 0
                  ? SizedBox(
                      width: displayWidth(context) * 0.4,
                      height: displayHeight(context) * 0.045,
                      child: Center(
                        child: Text(
                          Language.InterestLg(
                              'LoanInterestRates', widget.param.lgs),
                          textScaleFactor: MyClass.fontSizeApp(),
                          style: CustomTextStyle.dataBoldTxtC(
                              context, -5, 'Txthead'),
                        ),
                      ),
                    )
                  : Container(
                      width: displayWidth(context) * 0.4,
                      height: displayHeight(context) * 0.045,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        gradient: LinearGradient(
                          colors: <Color>[
                            MyColor.color('detailhead'),
                            MyColor.color('detailhead'),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          Language.InterestLg(
                              'LoanInterestRates', widget.param.lgs),
                          textScaleFactor: MyClass.fontSizeApp(),
                          style: CustomTextStyle.dataBoldTxtC(context, -5, 'W'),
                        ),
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }

  Widget _detail_Dep_int_rate({Interest}) => Container(
        // for each .... []
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColor.color('datatitle'),
        ),
        height: 0,

        child: ExpansionTile(
          title: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          // Interest[index].DepositType.toString(),
                          'เงินฝากออมทรัพย์พิเศษ',
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataHTxt(context, 1, 'Bl'),
                        ),
                      ],
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
                  Row(children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        "ตั้งแต่ 0.00 ถึง 10,000,000.00",
                        textAlign: TextAlign.left,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.defaultTxt(context, -3),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "3.00%",
                        textAlign: TextAlign.end,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, -1, 'Bl'),
                      ),
                    ),
                  ]),
                  Row(children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        "ตั้งแต่ 10,000,000.00 ถึง 20,000,000.00",
                        textAlign: TextAlign.left,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.defaultTxt(context, -3),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "2.50%",
                        textAlign: TextAlign.end,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, -1, 'Bl'),
                      ),
                    ),
                  ]),
                  Row(children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        "ตั้งแต่ 20,000,000.00 ถึง 30,000,000.00",
                        textAlign: TextAlign.left,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.defaultTxt(context, -3),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "2.00%",
                        textAlign: TextAlign.end,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, -1, 'Bl'),
                      ),
                    ),
                  ]),
                  Row(children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        "ตั้งแต่ 30,000,000.00 ถึง 9,999,999,999.00",
                        textAlign: TextAlign.left,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.defaultTxt(context, -3),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "1.50%",
                        textAlign: TextAlign.end,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, -1, 'Bl'),
                      ),
                    ),
                  ]),
                ],
              ),
            )
          ],
        ),
      );

  Widget _detail({Interest}) => Container(
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
            itemCount: Interest.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildExpandableTile(Interest[index]);
            },
          ),
        ),
      );

  Widget _buildExpandableTile(Interest) {
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
                      MyClass.checkNull(Interest.DepositType),
                      textAlign: TextAlign.start,
                      textScaleFactor:
                          MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                    ),
                  ],
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
                  Language.shareLg('amountM', widget.param.lgs),
                  textAlign: TextAlign.start,
                  textScaleFactor:
                      MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    MyClass.checkNull(Interest[0]['interest_step'].toString()),
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

  Widget _scroll({Interest}) {
    return Scrollbar(
      child: ListView.separated(
        padding: EdgeInsets.only(top: 5),
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: Interest.length,
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          // Interest[0].interestStep +
                          MyClass.checkNull(Interest[0].DepositType.toString())
                              .toString(),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataHTxt(context, 1, 'Bl'),
                        ),
                        Text(
                          "",
                          // MyClass.checkNull(MyClass.json(Interest)[index][0]
                          //         ['interest_rate'])
                          //     .toString(),
                          // 'ตั้งแต่ ' +
                          // MyClass.checkNull(Interest[0][index]),
                          // '\nถึง ' +
                          // MyClass.checkNull(Interest[index].interestStep),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxt(context, -3),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              MyClass.checkNull(
                                  Interest[0].DepositType.toString()),
                              textAlign: TextAlign.end,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHTxt(context, 1, 'Bl'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _detail_Loan_int_rate() => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColor.color('datatitle'),
        ),
        height: 0,
        child: ExpansionTile(
          title: Column(children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "ส1 เงินกู้สามัญ บุคคลค้ำ",
                        textAlign: TextAlign.left,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, 1, 'Bl'),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]),
          children: [
            ListTile(
              title: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "ตั้งแต่ 0.00 ถึง 999,999,999,999.99",
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxt(context, -3),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          '7.25%',
                          textAlign: TextAlign.end,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataHTxt(context, -1, 'Bl'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

Container _head(context, lgs) {
  return Container(
    padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
    color: MyColor.color('detailhead'),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Text(
            Language.InterestLg('type', lgs),
            textAlign: TextAlign.start,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -4),
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            Language.InterestLg('InterestPerYear', lgs),
            textAlign: TextAlign.end,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -4),
          ),
        ),
      ],
    ),
  );
}
