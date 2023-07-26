import 'dart:convert';
import 'package:dldcoop/FollowMe/models/loan/loanModel.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/pages/loan/loan_detail.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Loan extends StatefulWidget {
  Param param;

  Loan(this.param);

  @override
  _LoanState createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  var ObjLoan = '{"mode": "1"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomTextStyle.headcolor(context, 0),
          Container(
            decoration: MyClass.backGround(context),
            child: Column(
              children: [
                tabletMode ? hSizedBox(context, 0) : hSizedBox(context, 70),

                Padding(
                  padding: EdgeInsets.only(
                      left: paddinglist(context, 0),
                      right: paddinglist(context, 0)),
                ),
                // lineSiz
                Padding(
                    padding: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: _subdatahead(widget.param.membership_no,
                        widget.param.name, context, widget.param.lgs)),
                // lineSizedBox(context, 0),
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
                    child: FutureBuilder<List<LoanModel>>(
                      future: Network.fetchLoan(
                          ObjLoan, widget.param.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.length > 0
                              ? _detail(loan: snapshot.data)
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
          CustomUI.appbarUi3(Language.loanLg('loan', widget.param.lgs),
              widget.param.fontsizeapps, context),
          CustomUI.appbarDetailUi('assets/imgs/loan.png', context),
        ],
      ),
    );
  }

  Widget _detail({loan}) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColor.color('datatitle'),
        ),
        child: Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
            ),
            itemCount: loan.length,
            itemBuilder: (BuildContext context, int index) {
              bool tabletMode = MediaQuery.of(context).size.width > 600;
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Loan_detail(
                          data: '[' + jsonEncode(loan[index]) + ']',
                          param: widget.param),
                    ),
                  );
                },
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
                            loan[index].loanContractNo,
                            // MyClass.formatcontactloan(
                            //     loan[index].loanContractNo),
                            textAlign: TextAlign.left,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataHTxt(context, 1, 'B'),
                          ),
                          Text(
                            MyClass.checkNull(
                              Language.loanLg(
                                      'contractStartDate', widget.param.lgs) +
                                  " " +
                                  loan[index].beginingOfContract,
                              // MyClass.convertDate(
                              //     loan[index].beginingOfContract)
                            ),
                            textAlign: TextAlign.left,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataTxt(context, 0),
                          ),
                          Text(
                            MyClass.checkNull(Language.loanLg(
                                    'paymentInInstallments', widget.param.lgs) +
                                " " +
                                MyClass.FormatNumber(
                                    loan[index].periodPaymentAmount) +
                                " บาท"),
                            textAlign: TextAlign.left,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataTxt(context, 0),
                          ),
                          Text(
                            MyClass.checkNull(Language.loanLg(
                                        'period', widget.param.lgs) +
                                    " " +
                                    loan[index].lastPeriod.toString()) +
                                MyClass.checkNull(loan[index]
                                    .loanInstallmentAmount
                                    .toString()),
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
                                loan[index].principalBalance.toString()),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataHTxt(context, 0, 'R'),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: tabletMode ? 35 : 20,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
}

Center _subdatahead(member, name, context, lgs) {
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
                      child: Text(Language.loanLg('member', lgs),
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.subDataTxt(context, 1))),
                  Expanded(
                      child: Text(
                    member,
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
                      flex: 1,
                      child: Text(Language.loanLg('name', lgs),
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.subDataTxt(context, 1))),
                  Expanded(
                      flex: 2,
                      child: Text(
                        name,
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

Container _head(context, lgs) {
  return Container(
    padding: EdgeInsets.all(12),
    color: MyColor.color('detailhead'),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            Language.loanLg('detail', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(''),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.loanLg('amountLoan', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}
