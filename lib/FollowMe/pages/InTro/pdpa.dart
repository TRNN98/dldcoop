import 'dart:io';

import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/locals/dbPdpa.dart';
import 'package:dldcoop/FollowMe/models/sql/pdpaDb.dart';
import 'package:dldcoop/FollowMe/pages/InTro/notrg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dldcoop/FollowMe/pages/loan/loan_movement.dart';

String lgs = 'th';
String xxx = '';
final format = DateFormat("y-MMM-d");

class Pdpa extends StatefulWidget {
  Pdpa();

  @override
  _SeandfoState createState() => _SeandfoState();
}

class _SeandfoState extends State<Pdpa> {
  final _formKey = GlobalKey<FormState>();
  bool checkbox = false;
  PdpaDb pdpaDb = PdpaDb();

  late DBPdpa dbPdpa;

  @override
  void initState() {
    dbPdpa = DBPdpa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: MyWidget.bgPdpa(context),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(
                    top: tabletMode
                        ? displayHeight(context) * 0.03
                        : Platform.isAndroid
                            ? displayHeight(context) * 0.04
                            : displayHeight(context) * 0.06),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "เงื่อนไขการลงทะเบียน",
                        textScaleFactor: MyClass.fontSizeApp(),
                        style: CustomTextStyle.defaultTxt1(context, 10, 'W'),
                      ),
                      // Text(
                      //   "Registration Condition",
                      //   textScaleFactor: MyClass.fontSizeApp(),
                      //   style: CustomTextStyle.defaultTxt1(context, 3, 'W'),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: tabletMode
                  ? EdgeInsets.fromLTRB(
                      10,
                      MediaQuery.of(context).size.height * 0.16,
                      10,
                      MediaQuery.of(context).size.height * 0.16)
                  : EdgeInsets.fromLTRB(
                      10,
                      MediaQuery.of(context).size.height * 0.2,
                      10,
                      MediaQuery.of(context).size.height * 0.2),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 0.5,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.grey[100],
                      child: Column(
                        children: [
                          Text(
                            Language.pdpa('pdpa', lgs),
                            textAlign: TextAlign.center,
                            textScaleFactor: MyClass.fontSizeApp(),
                            style: CustomTextStyle.defaultTxt(
                                context, tabletMode ? -1 : 0),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.02),
                              child: Form(
                                child: Column(
                                  children: [
                                    Text(
                                      Language.pdpa('pdpaDtail', lgs),
                                      textScaleFactor: MyClass.fontSizeApp(),
                                      style: CustomTextStyle.defaultTxt(
                                          context, tabletMode ? -5 : -3),
                                    ),
                                    _checkBox(context),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // _checkBox(context),
                  _onLogin(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkBox(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 15, 0, 10),
      child: Row(
        children: [
          Transform.scale(
            scale: tabletMode ? 1.5 : 1.0,
            child: Checkbox(
              activeColor: MyColor.color('button'),
              value: checkbox,
              onChanged: (bool? value) {
                setState(() {
                  checkbox = value!;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              Language.pdpa('pdpacheckbox', lgs),
              textScaleFactor: MyClass.fontSizeApp(),
              style: CustomTextStyle.defaultTxtBoldLineUnder(
                  context, tabletMode ? -8 : 2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _onLogin(context) {
    return Container(
      child: Row(
        children: [
          const Expanded(
            child: Text(''),
          ),
          Container(
            width: displayWidth(context) * 0.4,
            height: displayHeight(context) * 0.06,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.red.shade900, width: 2),
              borderRadius: BorderRadius.circular(30.0),
              color: MyColor.color('W'),
            ),
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                Future.delayed(const Duration(seconds: 2)).then((value) {
                  exit(0);
                });
                // return showDialog(
                //   barrierDismissible: false,
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       backgroundColor: Colors.transparent,
                //       content: MyClass.loading(),
                //     );
                //   },
                // );
                // exit(0);
              },
              child: Center(
                child: Text(
                  Language.pdpa('pdpacancel', lgs),
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.defaultTxt1(context, 5, 'R'),
                ),
              ),
            ),
          ),
          const Expanded(
            child: Text(''),
          ),
          Container(
            width: displayWidth(context) * 0.4,
            height: displayHeight(context) * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: const LinearGradient(
                colors: <Color>[
                  Color(0xFFF5D512),
                  Color(0xFFF5D512),
                ],
              ),
            ),
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                if (checkbox == true) {
                  pdpaDb.pdpa = "1";
                  dbPdpa.initDB().then((value) => {
                        dbPdpa.insertPdpa(pdpaDb).then((value) => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Notrg(),
                                ),
                              )
                            }),
                      });
                } else {
                  MyClass.showToast(Language.pdpa('alertpdpa', lgs));
                }
              },
              child: Center(
                child: Text(
                  Language.pdpa('pdpasave', lgs),
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.defaultTxt1(context, 5, 'Bl'),
                ),
              ),
            ),
          ),
          const Expanded(
            child: Text(''),
          ),
        ],
      ),
    );
  }

  void _submit() {}
}
