import 'dart:convert';

import 'package:flutter/material.dart';

import '../../class/customUI.dart';
import '../../class/language.dart';
import '../../class/myclass.dart';
import '../../class/mycolor.dart';
import '../../class/sizes.dart';
import '../../class/textstyle.dart';
import '../../class/widget.dart';
import '../../models/kept/keptModel.dart';
import '../../models/kept_special/keptSpecialModel.dart';
import '../../services/netword.dart';
import '../auth/Pins.dart';
import 'kept_special_detail.dart';

double _fontsizeapps = 1.0;

class KeptSpacial extends StatefulWidget {
  Param param;

  KeptSpacial(this.param);

  @override
  State<KeptSpacial> createState() => _KeptSpacialState();
}

class _KeptSpacialState extends State<KeptSpacial>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var ObjKeptSpecial = '{"mode": "1"}';

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
                    child: FutureBuilder<List<KeptSpecial>>(
                      future: Network.fetchKeptSpecial(
                          ObjKeptSpecial, widget.param.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.length > 0
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
          CustomUI.appbarUi3(Language.keptSpecialLg('kept', widget.param.lgs),
              widget.param.fontsizeapps, context),
          CustomUI.appbarDetailUi('assets/imgs/keptSpecial.png', context),
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
                      "receiptNo": kept[index].receiptNo,
                      "receiptDate": kept[index].receiptDate,
                      "moneyAmount": kept[index].receiveAmount.toString(),
                      "count": kept[index].count.toString(),
                    }
                  ];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Kept_special_detail(
                          data: jsonEncode(data), param: widget.param),
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
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              MyClass.checkNull(
                                kept[index].receiptDate.toString(),
                              ),
                              textAlign: TextAlign.start,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              MyClass.checkNull(
                                  kept[index].receiptNo.toString()),
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
                              MyClass.FormatNumber(
                                  kept[index].receiveAmount.toString()),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.subDataTxt(context, -1),
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

Container _head(context, lgs) {
  return Container(
    padding: EdgeInsets.all(12),
    color: MyColor.color('detailhead'),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            Language.keptSpecialLg('date', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -2),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            Language.keptSpecialLg('receiptNumber', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -2),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            Language.keptSpecialLg('amount', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -2),
          ),
        ),
      ],
    ),
  );
}
