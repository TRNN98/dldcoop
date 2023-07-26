import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../class/customUI.dart';
import '../../class/language.dart';
import '../../class/mycolor.dart';
import '../../class/sizes.dart';
import '../../class/textstyle.dart';
import '../../models/news/msgModel.dart';
import '../../services/netword.dart';
import '../auth/Pins.dart';
// import 'package:open_file/open_file.dart';

class MsgDetail extends StatefulWidget {
  MsgModel msgdata;
  String photoMobile;
  var file;
  Param param;

  MsgDetail({
    required this.msgdata,
    required this.photoMobile,
    this.file,
    required this.param,
  });
  @override
  _MsgDetailState createState() => _MsgDetailState();
}

double _fontsizeapps = 1.0;

class _MsgDetailState extends State<MsgDetail> {
  String kHtml = '''  ''';
  // var ObjMsg = '{"mode": "5","system_datetime":"' + msgdata.s + '"}';
  Future<void> _updateMsgStatusdel(membership, seq) async {
    var objMsgStatus =
        '{"mode": "6","membership_no":"${membership.toString()}","system_datetime":"${seq.toString()}"}';
    await Network.fetchMsgStatusdel(objMsgStatus, widget.param.token, context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _updateMsgStatusdel(widget.param.membership_no, widget.msgdata.seq);
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              right: displayWidth(context) * 0.04,
              left: displayWidth(context) * 0.04,
            ),
            height: double.infinity,
            decoration: MyClass.backGround(context),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    tabletMode == true
                        ? hSizedBox(context, 140)
                        : hSizedBox(context, 60),
                    Container(
                      // decoration: BoxDecoration(
                      //   border: Border(
                      //       left: BorderSide(
                      //           color: MyColor.color('settings'), width: 5)),
                      // ),
                      color: MyColor.color('bg'),
                      child: Container(
                        color: MyColor.color('datatitle'),
                        child: Column(
                          children: [
                            // widget.msgdata.photoMobile != null
                            //     ? Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: GestureDetector(
                            //           // child: Hero(
                            //           //   tag: 'imageHero',
                            //           child: Image.network(
                            //             '${MyClass.hostApp()}/' +
                            //                 widget.msgdata.photoMobile!,
                            //             // height: displayHeight(context) * 0.2,
                            //             width: displayWidth(context) * 0.25,
                            //           ),
                            //           // ),
                            //           onTap: () {
                            //             Navigator.push(context,
                            //                 MaterialPageRoute(builder: (_) {
                            //               return DetailScreen(
                            //                 url: '${MyClass.hostApp()}' +
                            //                     widget.msgdata.photoMobile!,
                            //               );
                            //             }));
                            //           },
                            //         ),
                            //       )
                            //     : Text(""),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  widget.msgdata.title!,
                                  textAlign: TextAlign.center,
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style:
                                      CustomTextStyle.dataBoldTxt(context, 5),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.msgdata.message!,
                                textAlign: TextAlign.center,
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.param.fontsizeapps),
                                style:
                                    CustomTextStyle.defaultpdpaTxt(context, 0),
                              ),
                            ),
                            widget.file != null
                                ? widget.file != ''
                                    ? _checkloadfile()
                                    : const Padding(
                                        padding: EdgeInsets.all(8),
                                      )
                                : const Padding(
                                    padding: EdgeInsets.all(8),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomUI.appbarUi3(Language.msgLg('msg', widget.param.lgs),
              widget.param.fontsizeapps, context),
          CustomUI.appbarDetailUi2('assets/imgs/icon.png', context),
        ],
      ),
    );
  }

  Padding _checkloadfile() {
    var _file = "${MyClass.hostApp()}" "${widget.file}";
    print("___$_file");
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => {
              //OpenFile.open(widget.file),
              print("${MyClass.hostApp()}" "${widget.file}"),
              _launchURL("${MyClass.hostApp()}" "${widget.file}")
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Colors.blue),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.file_download,
                    color: Colors.red[500],
                  ),
                  Text(
                    Language.newsLg('load', widget.param.lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingTxt(context, -10),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  String url;

  DetailScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          // child: Hero(
          // tag: 'imageHero',
          child: PhotoView(
            imageProvider: NetworkImage(url),
          ),
          // ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
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
