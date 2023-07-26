import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/models/news/msgModel.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/asset_bundle.dart';
import 'package:transparent_image/transparent_image.dart';

import 'msg_detail.dart';

class Msgs extends StatefulWidget {
  Param param;
  String groupID;

  Msgs({required this.param, required this.groupID});

  @override
  _MsgsState createState() => _MsgsState();
}

class _MsgsState extends State<Msgs> {
  Future<void> _insertMsgStatus(groupid, id) async {
    var ObjMsgStatus = '{"mode": "6","message_type":"' +
        groupid +
        '","system_datetime":"' +
        id.toString() +
        '"}';
    await Network.fetchMsgStatus(ObjMsgStatus, widget.param.token, context);
    setState(() {});
  }

  Future<void> _updateMsgStatus(id) async {
    var ObjMsgStatus =
        '{"mode": "6","system_datetime":"' + id.toString() + '"}';
    await Network.fetchMsgStatus(ObjMsgStatus, widget.param.token, context);
    setState(() {});
  }

  Future<void> _updateMsgStatusdel(membership) async {
    var ObjMsgStatus =
        '{"mode": "6","membership_no":"' + membership.toString() + '"}';
    await Network.fetchMsgStatusdel(ObjMsgStatus, widget.param.token, context);
    setState(() {});
  }

  var bytes;
  var list;

  void image() async {
    bytes = await rootBundle.load('assets/imgs/icon.png');
    list = bytes.buffer.asUint8List();
  }

  @override
  void initState() {
    super.initState();
    image();
  }

  @override
  Widget build(BuildContext context) {
    var ObjMsg = '{"mode": "2"}';
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(context),
            child: Column(
              children: [
                tabletMode ? hSizedBox(context, 80) : hSizedBox(context, 20),
                Container(
                  child: Center(),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(
                top: displayHeight(context) * (tabletMode ? 0.35 : 0.30),
                right: displayWidth(context) * 0.04,
                left: displayWidth(context) * 0.04,
              ),
              // child: _getnew(news1: new12, tabletMode: tabletMode),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: MyColor.color('settings'), width: 5))),
                child: FutureBuilder<List<MsgModel>>(
                  future: Network.fetchMsg(ObjMsg, widget.param.token, context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.isNotEmpty
                          ? _getmsg(msg: snapshot.data)
                          : MyWidget.nodata(widget.param.lgs, context);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return MyClass.loading();
                  },
                ),
              ),
            ),
          ),
          CustomUI.appbarUi3(Language.msgLg('msg', widget.param.lgs),
              widget.param.fontsizeapps, context),
          CustomUI.appbarDetailUi2('assets/imgs/icon.png', context),
          CustomUI.appbarUi2(widget.param, context),
        ],
      ),
    );
  }

  Widget _getmsg({msg}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
        color: MyColor.color('datatitle'),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 10),
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: msg.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () async {
              if (msg[index].type == "member") {
                _insertMsgStatus(msg[index].memberRef, msg[index].seq);
              } else {
                _insertMsgStatus(msg[index].memberRef, msg[index].seq);
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MsgDetail(
                    msgdata: msg[index],
                    param: widget.param,
                    photoMobile: msg[index].photoMobile,
                    file: msg[index].ndata,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 5),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.fiber_manual_record,
                          color: msg[index].status == '1'
                              ? Colors.grey
                              : Colors.red,
                          size: 20,
                        ),
                      ),
                      // FadeInImage.memoryNetwork(
                      //   width: displayHeight(context) * 0.07,
                      //   height: displayHeight(context) * 0.07,
                      //   fit: BoxFit.fill,
                      //   // placeholder: list,
                      //   placeholder: kTransparentImage,
                      //   image: msg[index].photoMobile == null
                      //       ? " "
                      //       : '${MyClass.hostApp()}/' + msg[index].photoMobile,
                      // ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                msg[index].operateDate,
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.param.fontsizeapps),
                                style: CustomTextStyle.subDataTxt(context, 0),
                              ),
                              Text(
                                msg[index].title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.param.fontsizeapps),
                                style:
                                    CustomTextStyle.defaultpdpaTxt(context, 0),
                              ),
                            ],
                          ),
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
    );
  }
}
