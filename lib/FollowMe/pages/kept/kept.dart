import 'dart:convert';

import 'package:dldcoop/FollowMe/models/kept/keptModel.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/pages/kept/kept_detail.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Kept extends StatefulWidget {
  Param param;

  Kept(this.param);

  @override
  _KeptState createState() => _KeptState();
}

class _KeptState extends State<Kept> {
  var ObjKept = '{"mode": "1"}';

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
                    padding: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: _subdatahead()),
                // lineSizedBox(context, -30),
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
                    child: FutureBuilder<List<KeptModel>>(
                      future: Network.fetchKept(
                          ObjKept, widget.param.token, context),
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
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi3(Language.keptLg('kept', widget.param.lgs),
              widget.param.fontsizeapps, context),
          CustomUI.appbarDetailUi('assets/imgs/kept.png', context),
        ],
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
            padding: EdgeInsets.only(top: 5),
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
            ),
            itemCount: kept.length,
            itemBuilder: (BuildContext context, int index) {
              bool tabletMode = MediaQuery.of(context).size.width > 600;
              return InkWell(
                onTap: () {
                  var data = [
                    {
                      "receiveYear": kept[index].receiveYear.toString(),
                      "receiveMonth": kept[index].receiveMonth.toString(),
                      "receiveMonthFp": MyClass.monthNameTH(
                          kept[index].receiveMonth.toString(), 'full'),
                      "receiveYearFp": (int.parse(
                                  MyClass.checkNull(kept[index].receiveYear)) +
                              543)
                          .toString(),
                      "receiptNo": kept[index].receiptNo,
                      "receiptDate": kept[index].receiptDate,
                      "kepMethodAmount": kept[index].moneyamountreal.toString(),
                      "status": '1',
                      "seq_no": kept[index].seqNo.toString(),
                      "moneyAmountNot": kept[index].moneyAmountNot.toString(),
                      "moneyAmount": kept[index].moneyAmount.toString(),
                      "addMoneyAmount": kept[index].addMoneyAmount.toString(),
                      "countSeqno": kept[index].countSeqno.toString(),
                      "postRun": kept[index].postRun.toString(),
                      "deduteamountreal": MyClass.checkNull0(
                          kept[index].deduteamountreal.toString()),
                      "ppmDesc": kept[index].ppmDesc.toString()
                    }
                  ];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Kept_detail(
                          data: jsonEncode(data), param: widget.param),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              MyClass.monthNameTH(
                                      kept[index].receiveMonth.toString(),
                                      'full') +
                                  ' ' +
                                  (int.parse(MyClass.checkNull(
                                              kept[index].receiveYear)) +
                                          543)
                                      .toString(),
                              textAlign: TextAlign.left,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHTxt(
                                  context, 1, 'Txttitle'),
                            ),
                            Text(
                              MyClass.checkNull('วันที่ใบเสร็จรับเงิน ' +
                                      kept[index].receiptDate
                                  // MyClass.convertDate(kept[index].receiptDate)
                                  ),
                              textAlign: TextAlign.left,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataTxt(context, 0),
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
                              MyClass.FormatNumber(
                                  kept[index].moneyAmount.toString()),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHTxt(context, 1, 'R'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.print,
                          size: tabletMode ? 35 : 20,
                          color: Colors.blueGrey,
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

  Center _subdatahead() {
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
                            style: CustomTextStyle.subDataTxt(context, 0))),
                    Expanded(
                        child: Text(
                      widget.param.name,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.subDataHTxt(context, 0),
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
          flex: 1,
          child: Text(
            Language.keptLg('detail', lgs),
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
          flex: 1,
          child: Text(
            Language.keptLg('amount', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -2),
          ),
        ),
      ],
    ),
  );
}
