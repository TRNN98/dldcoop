import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:dldcoop/FollowMe/models/news/newsModel.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/pages/news/news_detail.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class News extends StatefulWidget {
  Param param;
  News(this.param);

  @override
  _NewsState createState() => _NewsState();
}

class New {
  final String title;
  final String img;

  const New({required this.title, required this.img});
}

class _NewsState extends State<News> {
  var Objnews = '{"mode": "1"}';

  Future<bool> _onBackPressed() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              'ออกจากแอปพลิเคชัน',
              style: CustomTextStyle.dataHTxt(context, 5, 'Bl'),
            ),
            content: Text(
              'คุณต้องการออกจากแอปพลิเคชัน\nใช่ หรือ ไม่',
              style: CustomTextStyle.dataHTxt(context, 0, 'Bl'),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(
                  'ไม่',
                  style: CustomTextStyle.dataHTxt(context, 3, 'B'),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              CupertinoDialogAction(
                child: Text(
                  'ใช่',
                  style: CustomTextStyle.dataHTxt(context, 3, 'R'),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Stack(
          children: [
            Container(
              decoration: MyClass.backGround(context),
              child: Column(
                children: [
                  CustomUI.appbarTitleUi(
                      Language.newsLg('news', widget.param.lgs),
                      widget.param.fontsizeapps,
                      context),
                  CustomUI.appbarDetailUi3('assets/imgs/icon.png', context),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Text(
                            MyClass.company('th'),
                            textScaleFactor: MyClass.fontSizeApp(),
                            textAlign: TextAlign.center,
                            style: CustomTextStyle.dataHeadTitleCTxt1Paint(
                                context,
                                tabletMode == true ? 2 : 8,
                                'W',
                                tabletMode == true ? 5 : 3),
                          ),
                          Text(MyClass.company('th'),
                              textScaleFactor: MyClass.fontSizeApp(),
                              textAlign: TextAlign.center,
                              style: CustomTextStyle.dataHeadTitleCTxt(context,
                                  tabletMode == true ? 2 : 8, 'slide1')),
                        ],
                      ),
                      SizedBox(
                        height: tabletMode
                            ? displayHeight(context) * 0.001
                            : displayHeight(context) * 0.005,
                      ),
                      Stack(
                        children: [
                          Text(
                            MyClass.company('en'),
                            textScaleFactor: MyClass.fontSizeApp(),
                            textAlign: TextAlign.center,
                            style: CustomTextStyle.dataHeadTitleTxtEnPaint(
                                context,
                                tabletMode == true ? -10 : -5,
                                'W',
                                tabletMode == true ? 5 : 3),
                          ),
                          Text(MyClass.company('en'),
                              textScaleFactor: MyClass.fontSizeApp(),
                              textAlign: TextAlign.center,
                              style: CustomTextStyle.dataHeadTitleTxtEn(
                                context,
                                tabletMode == true ? -10 : -5,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: displayHeight(context) *
                      (tabletMode
                          ? 0.32
                          : Platform.isAndroid
                              ? 0.425
                              : 0.43),
                  left: paddinglist(context, 0),
                  right: paddinglist(context, 0)),
              // child: _getnew(news1: new12, tabletMode: tabletMode),
              child: FutureBuilder<List<NewsModel>>(
                future: Network.fetchNews(Objnews, widget.param.token, context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!.length > 0
                        ? _getnew(news1: snapshot.data)
                        : MyWidget.nodata(widget.param.lgs, context);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return MyClass.loading();
                },
              ),
            ),

            // CustomUI.appbarUi(),
            // CustomUI.appbarDetailUi1('assets/imgs/new.png', context),
          ],
        ),
      ),
    );
  }

  _getnew({news1}) => Padding(
        padding: EdgeInsets.only(bottom: displayHeight(context) * 0.1),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: MyColor.color('LineColor'), width: 4),
            ),
            color: MyColor.color('datatitle'),
          ),
          child: Scrollbar(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 15),
              separatorBuilder: (context, index) => Divider(
                color: MyColor.color('linelist'),
              ),
              itemCount: news1.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetail(
                            newdata: news1[index], param: widget.param),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 5),
                        child: Row(
                          children: [
                            FadeInImage.memoryNetwork(
                              width: displayHeight(context) * 0.07,
                              height: displayHeight(context) * 0.07,
                              fit: BoxFit.fitWidth,
                              placeholder: kTransparentImage,
                              image:
                                  'http://dldcoop.com/' + news1[index].nphoto,
                            ),
                            Text('      '),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    news1[index].date,
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHeadTitleCTxt(
                                        context, 0, 'B'),
                                  ),
                                  Text(
                                    news1[index].question,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style:
                                        CustomTextStyle.defaultTxt(context, -2),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    size: iconnext(context, 0),
                                    color: MyColor.color('b'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );
}
