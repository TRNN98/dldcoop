import 'package:flutter/material.dart';

import '../../class/customUI.dart';
import '../../class/language.dart';
import '../../class/myclass.dart';
import '../../class/mycolor.dart';
import '../../class/sizes.dart';
import '../../class/textstyle.dart';
import '../../class/widget.dart';
import '../../models/receive_doc/receive_docModel.dart';
import '../../services/netword.dart';
import '../auth/Pins.dart';

double _fontsizeapps = 1.0;

class CoopMail extends StatefulWidget {
  Param param;

  CoopMail(this.param);

  @override
  State<CoopMail> createState() => _CoopMailState();
}

class _CoopMailState extends State<CoopMail> {
  var objCoopMail = '{"mode": "1"}';

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
                    child: FutureBuilder<List<ReceiveDoc>>(
                      future: Network.fetchReceiveDoc(
                          objCoopMail, widget.param.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.length > 0
                              ? _detail(
                                  receive_doc: snapshot.data,
                                )
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
          CustomUI.appbarUi3(Language.coopMailLg('coopmail', widget.param.lgs),
              widget.param.fontsizeapps, context),
          CustomUI.appbarDetailUi('assets/imgs/coopMail.png', context),
        ],
      ),
    );
  }

  Widget _detail({receive_doc}) => Container(
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
            itemCount: receive_doc.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildExpandableTile(receive_doc[index]);
            },
          ),
        ),
      );

  Widget _buildExpandableTile(receive_doc) {
    return ExpansionTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      MyClass.checkNull(receive_doc.payType),
                      textAlign: TextAlign.start,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.defaultpdpaTxt(
                        context,
                        1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(MyClass.checkNull(receive_doc.operateDate),
                        textAlign: TextAlign.end,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.defaultpdpaTxt(
                          context,
                          1,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      children: [
        ListTile(
          title: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 3,
                    child: Text(
                      Language.coopMailLg('number', widget.param.lgs),
                      textAlign: TextAlign.start,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.defaultpdpaTxt(
                        context,
                        -1,
                      ),
                    )),
                Expanded(
                  flex: 5,
                  child: MyClass.checkNull(receive_doc.docnoGroup) == ''
                      ? Text(
                          '-',
                          textAlign: TextAlign.end,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultpdpaTxt(
                            context,
                            -1,
                          ),
                        )
                      : Text(
                          MyClass.checkNull(receive_doc.docnoGroup),
                          textAlign: TextAlign.end,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultpdpaTxt(context, -1),
                        ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text("สถานะเอกสาร",
                      textAlign: TextAlign.start,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.defaultpdpaTxt(
                        context,
                        -1,
                      )),
                ),
                Expanded(
                  flex: 3,
                  child: MyClass.checkNull(receive_doc.status) == ''
                      ? Text("-",
                          textAlign: TextAlign.end,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultpdpaTxt(
                            context,
                            -1,
                          ))
                      : Text(MyClass.checkNull(receive_doc.status),
                          textAlign: TextAlign.end,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultpdpaTxt(
                            context,
                            -1,
                          )),
                )
              ],
            )
          ]),
        )
      ],
    );
  }
}

Container _head(context, lgs) {
  return Container(
    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
    color: MyColor.color('detailhead'),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Text(
            Language.coopMailLg('subject', lgs),
            textAlign: TextAlign.start,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -3),
          ),
        ),
        // Expanded(
        //   flex: 3,
        //   child: Text(
        //     Language.coopMailLg('date', lgs),
        //     textAlign: TextAlign.center,
        //     textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
        //     style: CustomTextStyle.headTitleTxt(context, -3),
        //   ),
        // ),
        Expanded(
          flex: 2,
          child: Text(
            Language.coopMailLg('date', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -3),
          ),
        ),
      ],
    ),
  );
}
