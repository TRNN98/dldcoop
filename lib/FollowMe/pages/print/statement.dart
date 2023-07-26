import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../class/customUI.dart';
import '../../class/language.dart';
import '../../class/myclass.dart';
import '../../class/mycolor.dart';
import '../../class/sizes.dart';
import '../../class/textstyle.dart';
import '../auth/Pins.dart';

class Gdate {
  Gdate() {
    dateFrom = '';
    dateTo = '';
  }

  String? dateFrom;
  String? dateTo;
}

Gdate gdate = Gdate();

class Statement extends StatefulWidget {
  Param param;
  String type;
  String data;

  Statement({
    required this.param,
    required this.type,
    required this.data,
  });

  @override
  _StatementState createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  // var txtDateFrom = TextEditingController() ;
  // var txtDateTo = TextEditingController() ;
  TextEditingController txtDateFrom = TextEditingController();
  TextEditingController txtDateTo = TextEditingController();
  final _formKeyStatement = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: MyClass.backGround(context),
          child: Form(
            key: _formKeyStatement,
            child: Column(children: [
              SizedBox(
                height: tabletMode
                    ? displayHeight(context) * 0.35
                    : displayHeight(context) * 0.35,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: paddinglist(context, 0),
                    right: paddinglist(context, 0)),
                child: _headFrom(context, widget.param.lgs),
              ),
              _dateFrom(txtDateFrom, context, widget.param.lgs),
              Padding(
                padding: EdgeInsets.only(
                    top: paddinglist(context, 0),
                    left: paddinglist(context, 0),
                    right: paddinglist(context, 0)),
                child: _headTo(context, widget.param.lgs),
              ),
              _dateTo(txtDateTo, context, widget.param.lgs),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              _buttomClick(),
            ]),
          ),
        ),
        CustomUI.appbarBackgroundUi(context),
        CustomUI.appbarUi(),
        CustomUI.appbarTxtTitleUi(
            Language.other('printstatement', widget.param.lgs),
            widget.param.fontsizeapps,
            context),
        Padding(
          padding: EdgeInsets.only(
            right: displayWidth(context) * 0.04,
            left: displayWidth(context) * 0.04,
            top: displayHeight(context) * 0.15,
          ),
          child: _subdataHeadcolor(),
        ),
      ]),
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
                color: MyColor.color('datatitle')),
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Text(
                            Language.loanLg('member', widget.param.lgs) + ' : ',
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        flex: 1,
                        child: Text(widget.param.membership_no,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadDataTxt(context, 1))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Text(
                            Language.loanLg('name', widget.param.lgs) + ' : ',
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        flex: 1,
                        child: Text(widget.param.name,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadDataTxt(context, 1))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buttomClick() {
    return Container(
      width: displayWidth(context) * 0.9,
      height: displayHeight(context) * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.0),
        gradient: LinearGradient(
          colors: <Color>[
            MyColor.color('buttongra'),
            MyColor.color('buttongra1'),
          ],
        ),
      ),
      padding: EdgeInsets.only(
          left: paddinglist(context, 0), right: paddinglist(context, 0)),
      child: InkWell(
        onTap: () {
          if (this._formKeyStatement.currentState!.validate()) {
            _formKeyStatement.currentState!.save();
            if (widget.type == 'share') {
              _launchURL(
                  "${MyClass.hostApp()}/api/v1/share_statement_print/1/from_date/" +
                      "${MyClass.formatDate1(gdate.dateFrom)}/" +
                      "${MyClass.formatDate1(gdate.dateTo)}/" +
                      "${widget.param.token}");
            } else if (widget.type == 'dep') {
              _launchURL(
                  "${MyClass.hostApp()}/api/v1/dep_statement_print/${widget.data}/1/from_date/" +
                      "${MyClass.formatDate1(gdate.dateFrom)}/" +
                      "${MyClass.formatDate1(gdate.dateTo)}/" +
                      "${widget.param.token}");
            } else if (widget.type == 'loan') {
              _launchURL(
                  "${MyClass.hostApp()}/api/v1/loan_statement_print/${widget.data}/1/from_date/" +
                      "${MyClass.formatDate1(gdate.dateFrom)}/" +
                      "${MyClass.formatDate1(gdate.dateTo)}/" +
                      "${widget.param.token}");
            }
          }
        },
        child: Center(
          child: Text(
            Language.other('printstatement', widget.param.lgs),
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.buttonTxt(context, -1),
          ),
        ),
      ),
    );
  }
}

_dateFrom(txtDateFrom, context, lgs) {
  return Padding(
    padding: EdgeInsets.only(
        left: paddinglist(context, 0), right: paddinglist(context, 0)),
    // child: MediaQuery(
    //   data: MediaQuery.of(context).copyWith(
    //     textScaleFactor: MyClass.fontSizeApp(),
    //   ),
    child: TextFormField(
      onTap: () async {
        DateTime? newDateTime1 = await DatePicker.showDatePicker(
          context,
          locale: LocaleType.th,
          maxTime: DateTime(DateTime.now().year + 543, DateTime.now().month,
              DateTime.now().day),
          minTime: DateTime((DateTime.now().year + 543) - 5, 1, 1),
          showTitleActions: true,
        );
        if (newDateTime1 != null) {
          String date1 = '';
          date1 = newDateTime1.day.toString() +
              '/' +
              newDateTime1.month.toString() +
              '/' +
              (newDateTime1.year).toString();
          // txtDateFrom = TextEditingController()..text = date1;
          txtDateFrom.text = date1;
        }
      },
      controller: txtDateFrom,
      readOnly: true,
      textAlign: TextAlign.center,
      style: CustomTextStyle.defaultpdpaTxt(context, 0),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: Language.other('select', lgs),
        labelStyle: TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColor.color('TextFormFieldBorderSide'),
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(),
      ),
      // validator: (value) {
      //   _validatDate(value);
      // },
      onSaved: (value) {
        gdate.dateFrom = value;
      },
    ),
    // ),
  );
}

_dateTo(txtDateTO, context, lgs) {
  return Padding(
    padding: EdgeInsets.only(
        left: paddinglist(context, 0), right: paddinglist(context, 0)),
    // child: MediaQuery(
    //   data: MediaQuery.of(context).copyWith(
    //     textScaleFactor: MyClass.fontSizeApp(),
    //   ),
    child: TextFormField(
      onTap: () async {
        DateTime? newDateTime = await DatePicker.showDatePicker(
          context,
          locale: LocaleType.th,
          // maxTime: DateTime(DateTime.now().year + 543 + 1),
          // minTime: DateTime((DateTime.now().year + 543) - 5),
          maxTime: DateTime(DateTime.now().year + 543, DateTime.now().month,
              DateTime.now().day),
          minTime: DateTime((DateTime.now().year + 543) - 5, 1, 1),
          showTitleActions: true,
        );
        if (newDateTime != null) {
          String date = '';
          date = newDateTime.day.toString() +
              '/' +
              newDateTime.month.toString() +
              '/' +
              (newDateTime.year).toString();
          // txtDateTO = TextEditingController()..text = date;
          txtDateTO.text = date;
        }
      },
      controller: txtDateTO,
      // keyboardAppearance: false,
      readOnly: true,
      textAlign: TextAlign.center,
      style: CustomTextStyle.defaultpdpaTxt(context, 0),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: Language.other('select', lgs),
        labelStyle: TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColor.color('TextFormFieldBorderSide'),
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(),
      ),
      // validator: (value) {
      //   _validatDate(value);
      // },
      onSaved: (value) {
        gdate.dateTo = value;
      },
    ),
    // ),
  );
}

Container _headFrom(context, lgs) {
  return Container(
    padding: EdgeInsets.all(12),
    color: MyColor.color('detailhead'),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            'จาก',
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(1.0),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}

Container _headTo(context, lgs) {
  return Container(
    padding: EdgeInsets.all(12),
    color: MyColor.color('detailhead'),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            'ไปยัง',
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(1.0),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}

// _validatDate(value) {
//   if (value.isEmpty) {
//     return 'ท่านยังไม่ได้เลือกวันที่';
//   }
// }

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
