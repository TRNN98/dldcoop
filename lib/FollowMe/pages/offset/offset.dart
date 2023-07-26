import 'dart:convert';

import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/models/offset/offsetModel.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/pages/offset/offsetDetail.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Offsets extends StatefulWidget {
  Param param;

  Offsets(this.param);

  @override
  _OffsetsState createState() => _OffsetsState();
}

class _OffsetsState extends State<Offsets> {
  var ObjOffset = '{"mode": "1"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: MyClass.backGround(context),
          child: Column(children: [
            tabletMode ? hSizedBox(context, 0) : hSizedBox(context, 0),
            Container(
              padding:
                  EdgeInsets.only(top: headpadding(context, 0), bottom: 10),
              child: Center(
                child: Text(Language.offsetLg('offset', widget.param.lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.subTitleTxt(context, 10)),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: paddinglist(context, 0),
                    right: paddinglist(context, 0)),
                child: _subdatahead()),
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
                child: FutureBuilder<List<OffsetModel>>(
                  future: Network.fetchOffset(
                      ObjOffset, widget.param.token, context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.length > 0
                          ? _detail(offset: snapshot.data)
                          : MyWidget.nodata(widget.param.lgs, context);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return MyClass.loading();
                  },
                ),
              ),
            ),
          ]),
        ),
        CustomUI.appbarBackgroundUi(context),
        CustomUI.appbarUi(),
        CustomUI.appbarDetailUi('assets/imgs/offset.png', context),
      ],
    ));
  }

  Widget _detail({offset}) => Container(
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
            ),
            itemCount: offset.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  var data = [
                    {"receiptNo": offset[index].receiptNo.toString()}
                  ];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OffsetDetail(
                          data: jsonEncode(data), param: widget.param),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              offset[index].thaiReceiptDate,
                              textAlign: TextAlign.left,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHTxt(context, 0, 'Bl'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              MyClass.formatRef(offset[index].receiptNo),
                              textAlign: TextAlign.left,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style:
                                  CustomTextStyle.defaultTxt1(context, 0, 'Bl'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            MyClass.FormatNumber(
                                offset[index].receptAmount.toString()),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.defaultTxt1(context, 0, 'G'),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: iconnext(context, 0),
                            color: MyColor.color('buttonnext'),
                          ),
                        ],
                      ),
                    ),
                  ],
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
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.offsetLg('member', widget.param.lgs) +
                                ' : ',
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 0))),
                    Expanded(
                        child: Text(widget.param.membership_no,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadDataTxt(context, 0))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.offsetLg('name', widget.param.lgs) + ' : ',
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 0))),
                    Expanded(
                        child: Text(widget.param.name,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadDataTxt(context, 0))),
                  ],
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
      padding: EdgeInsets.all(12),
      color: MyColor.color('detailhead'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              Language.offsetLg('date', lgs),
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, 0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              Language.offsetLg('receiptNumber', lgs),
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, 0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              Language.offsetLg('amount', lgs),
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, 0),
            ),
          ),
        ],
      ),
    );
  }
}
