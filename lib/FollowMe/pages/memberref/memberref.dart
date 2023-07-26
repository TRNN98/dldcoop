import 'package:flutter/material.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/models/memberref/memberrefModel.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';

double _fontsizeapps = 1.0;

class MemberRef extends StatefulWidget {
  Param param;

  MemberRef(this.param);

  @override
  _MemberRefState createState() => _MemberRefState();
}
// class Subheader {
//   final String title;
//   final String data;
//   const Subheader({this.title, this.data});
// }

// const List<Subheader> subheaders = const <Subheader>[
//   const Subheader(title: "ทุนเรือนหุ้น", data: '008qwr9q'),
//   const Subheader(title: "ทุนเรือนหุ้น", data: 'dsaf'),
//   const Subheader(title: "asfd", data: 'e'),
//   const Subheader(title: "ทุนเรือนหุ้น", data: '008qdwr9q'),
//   const Subheader(title: "asdf", data: '008asdfqwr9q'),
// ];

class _MemberRefState extends State<MemberRef> {
  // final List<String> entries = <String>['A', 'B', 'C'];
  // final List<int> colorCodes = <int>[600, 500, 100];

  var objMemberRef = '{"mode": "1"}';
  // var ObjHeadShare = '{"mode": "1"}';
  // var ObjShare = '{"mode": "2"}';
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;

    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // CustomTextStyle.headcolor(context, 0),
          Container(
            decoration: MyClass.backGround(context),
            // BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/image/bg.png"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Column(
              children: <Widget>[
                tabletMode ? hSizedBox(context, 0) : hSizedBox(context, 0),
                Container(
                  padding: EdgeInsets.only(
                      top: headpadding(context, 0),
                      bottom: headpadding(context, 0)),
                  child: Center(
                    child: Text(
                        Language.memberrefLg('memberrefs', widget.param.lgs),
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.subTitleTxt(context, 0)),
                  ),
                ),
                // lineSizedBox(context, 0),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: FutureBuilder<List<MemberRefModel>>(
                      future: Network.fetchMemberRef(
                          objMemberRef, widget.param.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.length > 0
                              ? _detail(memberref: snapshot.data)
                              : MyWidget.nodata(widget.param.lgs, context);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return MyClass.loading();
                      },
                    ),
                  ),
                ),
                // Container(
                //   child: FutureBuilder<List<MemberRefModel>>(
                //     future: Network.fetchMemberRef(
                //         objMemberRef, widget.token, context),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         return snapshot.data.length > 0
                //             // ? Padding(
                //             //     padding: EdgeInsets.only(
                //             //         left: paddinglist(context, 0),
                //             //         right: paddinglist(context, 0),
                //             //         bottom: paddinglist(context, 0)),
                //             ? _test(memberref: snapshot.data)
                //             // child: _subdatahead(
                //             //     jsonDecode(jsonEncode(snapshot.data))[0]
                //             //         ['memname'],
                //             //     // widget.name,
                //             //     jsonDecode(jsonEncode(snapshot.data))[0]
                //             //         ['share_bal'],
                //             //     context,
                //             //     widget.lgs),
                //             // )
                //             : MyWidget.nodata(widget.lgs, context);
                //       } else if (snapshot.hasError) {
                //         return Text("${snapshot.error}");
                //       }
                //       return MyClass.loading();
                //     },
                //   ),
                // ),
                // lineSizedBox(context, -25),
                // Padding(
                //   padding: EdgeInsets.only(
                //       left: paddinglist(context, 0),
                //       right: paddinglist(context, 0)),
                //   child: _head(context, widget.lgs),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(
                //       left: paddinglist(context, 0),
                //       right: paddinglist(context, 0)),
                //   child: _head(context, widget.lgs),
                // ),
                // Expanded(
                //   child: Padding(
                //     padding: EdgeInsets.only(
                //         left: paddinglist(context, 0),
                //         right: paddinglist(context, 0)),
                //     child: FutureBuilder<List<MemberRefModel>>(
                //       future: Network.fetchMemberRef(
                //           objMemberRef, widget.token, context),
                //       builder: (context, snapshot) {
                //         if (snapshot.hasData) {
                //           return snapshot.data.length > 0
                //               ? _detail(
                //                   memberref: snapshot.data,
                //                 )
                //               : MyWidget.nodata(widget.lgs, context);
                //         } else if (snapshot.hasError) {
                //           return Text("${snapshot.error}");
                //         }
                //         return MyClass.loading();
                //       },
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi(),
          CustomUI.appbarDetailUi('assets/imgs/memberref.png', context),
        ],
      ),
    );
  }

  Widget _detail({memberref}) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    bool platformandriod = MyClass.checkPlatform();
    return ListView.separated(
      padding: const EdgeInsets.only(top: 1, bottom: 30),
      separatorBuilder: (context, index) => Divider(
        color: Colors.transparent,
      ),
      itemCount: memberref.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            color: MyColor.color('datatitle'),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                  '${index + 1}) ' +
                                      Language.memberrefLg(
                                          'member', widget.param.lgs) +
                                      "  :  ",
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style: CustomTextStyle.dataHTxt(
                                      context, 0, 'Bl')),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(memberref[index].membershipNo.toString(),
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style: CustomTextStyle.dataHTxt(
                                      context, 0, 'Bl')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                  Language.memberrefLg(
                                          'name', widget.param.lgs) +
                                      "  :  ",
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style: CustomTextStyle.dataHTxt(
                                      context, 0, 'Bl')),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(memberref[index].memName.toString(),
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style: CustomTextStyle.dataHTxt(
                                      context, 0, 'Bl')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                  Language.shareLg('share', widget.param.lgs) +
                                      "  :  ",
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style: CustomTextStyle.dataHTxt(
                                      context, 0, 'Bl')),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  MyClass.FormatNumber(
                                      memberref[index].shareBal.toString()),
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style: CustomTextStyle.dataHTxt(
                                      context, 0, 'Bl')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  color: MyColor.color('detailhead'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Expanded(
                      //   flex: 2,
                      //   child: Text(
                      //     Language.associatememberLg('date', lgs),
                      //     textAlign: TextAlign.center,
                      //     textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      //     style: CustomTextStyle.headTitleTxt(context, -4),
                      //   ),
                      // ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          Language.memberrefLg('loan', widget.param.lgs),
                          textAlign: TextAlign.center,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.headTitleTxt(context, -4),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          Language.memberrefLg('deposit', widget.param.lgs),
                          textAlign: TextAlign.center,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.headTitleTxt(context, -4),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          Language.memberrefLg('dividend', widget.param.lgs),
                          textAlign: TextAlign.center,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.headTitleTxt(context, -4),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                  MyClass.FormatNumber(
                                      memberref[index].loanBal.toString()),
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style: CustomTextStyle.dataHTxt(
                                      context, 0, 'Bl')),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                  MyClass.FormatNumber(
                                      memberref[index].depBal.toString()),
                                  //textAlign: TextAlign.center,
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style: CustomTextStyle.dataHTxt(
                                      context, 0, 'Bl')),
                            ],
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
                              MyClass.FormatNumber(
                                  memberref[index].divBal.toString()),
                              textAlign: TextAlign.right,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style:
                                  CustomTextStyle.dataHTxt(context, 0, 'Bl')),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Widget _detail({List memberref}) {
  //   bool tabletMode = MediaQuery.of(context).size.width > 600;
  //   bool platformandriod = MyClass.checkPlatform();
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
  //       color: MyColor.color('datatitle'),
  //     ),
  //     child: ListView.separated(
  //       padding: EdgeInsets.only(
  //         top: 5,
  //       ),
  //       separatorBuilder: (context, index) => Divider(
  //         color: MyColor.color('linelist'),
  //       ),
  //       itemCount: memberref.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Padding(
  //           padding: const EdgeInsets.only(left: 0, right: 5),
  //           child: Column(
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: <Widget>[
  //                   Expanded(
  //                     flex: 2,
  //                     child: Column(
  //                       children: [
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: <Widget>[
  //                             Text(
  //                               MyClass.formatNumber(
  //                                   memberref[index].loanBal.toString()),
  //                               textScaleFactor:
  //                                   MyClass.blocFontSizeApp(_fontsizeapps),
  //                               style: CustomTextStyle.defaultTxt(
  //                                   context, platformandriod == true ? -3 : -5),
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Expanded(
  //                     flex: 2,
  //                     child: Column(
  //                       children: [
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: <Widget>[
  //                             Text(
  //                               MyClass.formatNumber(
  //                                   memberref[index].depBal.toString()),
  //                               //textAlign: TextAlign.center,
  //                               textScaleFactor:
  //                                   MyClass.blocFontSizeApp(_fontsizeapps),
  //                               style: CustomTextStyle.defaultTxt(
  //                                   context, platformandriod == true ? -3 : -5),
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Expanded(
  //                     flex: 2,
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: <Widget>[
  //                         Text(
  //                           MyClass.formatNumber(
  //                               memberref[index].divBal.toString()),
  //                           textAlign: TextAlign.right,
  //                           textScaleFactor:
  //                               MyClass.blocFontSizeApp(_fontsizeapps),
  //                           style: CustomTextStyle.defaultTxt(
  //                               context, platformandriod == true ? -3 : -5),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
