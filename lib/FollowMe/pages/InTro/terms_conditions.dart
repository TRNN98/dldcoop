import 'package:dldcoop/FollowMe/pages/InTro/introScreen.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/pages/InTro/notrg.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var _fontsizeapps = 1.0;

class TermsConditions extends StatefulWidget {
  @override
  _TermsConditionsState createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  var tc =
      'การสมัครใช้บริการ\nข้อกำหนดและเงื่อนไขการใช้งาน Mobile Application\nสำหรับสมาชิก${MyClass.company('th')}';
  var tc1 =
      '1. Mobile Application ของ${MyClass.company('th')} (“สหกรณ์”) เป็นการให้บริการทางเครือข่ายอินเทอร์เน็ต ผ่านระบบและอุปกรณ์เทคโนโลยีในรูปแบบของ Application บนโทรศัพท์มือถือ เพื่ออำนวยความสะดวกให้สมาชิกของสหกรณ์ (“สมาชิก”) สามารถทำการตรวจสอบข้อมูลส่วนบุคคล ธุรกรรมทางการเงินที่มีกับสหกรณ์';
  var tc2 =
      '2. การเข้าใช้งานระบบข้อมูลสมาชิกจะต้องทำการสมัครเข้าใช้งานระบบและต้องเป็นสมาชิกของ สหกรณ์ เท่านั้น';
  var tc3 =
      '3. หากชื่อหรือหมายเลขสมาชิกของท่านได้มีการสมัครใช้งานแล้ว โดยท่านไม่ทราบ หรือทำการสมัครด้วยตัวท่านเองกรุณาแจ้งเจ้าหน้าที่เพื่อทำการตรวจสอบความถูกต้องต่อไป';
  var tc4 =
      '4. เพื่อความปลอดภัยในข้อมูลของท่าน หากสหกรณ์พบว่ามีบุคคลแอบอ้างใช้งานบัญชีของท่านในการเข้าสู่ระบบสหกรณ์จะบังคับบุคคลนั้นออกจากระบบ โดยไม่ต้องแจ้งให้ทราบ';
  var tc5 =
      '5. หากข้อมูลรายละเอียดของสมาชิกไม่ถูกต้องในระบบแล้วมีข้อสงสัยหรือต้องการทำการเปลี่ยนแปลงปรับปรุงข้อมูลให้สมาชิกติดต่อเจ้าหน้าที่เพื่อทำการแก้ไขปรับปรุงเปลี่ยนแปลงข้อมูลต่อไป';
  var tc6 =
      '6. ข้าพเจ้าได้อ่านข้อตกลงดังกล่าวและยินยอมในเงื่อนไขต่างๆที่ทางสหกรณ์กำหนดไว้รวมถึงที่สหกรณ์จะได้กำหนดแก้ไขเพิ่มเติมหรือเปลี่ยนแปลงในภายภาคหน้าซึ่งให้ถือเป็นส่วนหนึ่งของเงื่อนไขและข้อกำหนดนี้ด้วยยืนยันข้อมูล';

  bool _value1 = false;

  // void _value1Changed(bool value) => setState(() => _value1 = value!);

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: MyClass.backGround(context),
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0)),
                  color: MyColor.color('datatitle'),
                ),
                child: Column(
                  children: [
                    // tabletMode
                    //     ? hSizedBox(context, 0)
                    //     : hSizedBox(context, 0),
                    Padding(
                      padding: EdgeInsets.only(
                          top: displayHeight(context) * 0.1,
                          right: displayWidth(context) * 0.05,
                          left: displayWidth(context) * 0.05),
                      child: Text('เงื่อนไขการลงทะเบียน',
                          textAlign: TextAlign.center,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxt(context, 20)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: displayWidth(context) * 0.05,
                          left: displayWidth(context) * 0.05,
                          bottom: displayWidth(context) * 0.05),
                      child: Text('Registration Conditions',
                          textAlign: TextAlign.center,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxt(context, 5)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: displayWidth(context) * 0.05,
                          left: displayWidth(context) * 0.05),
                      child: Text(tc,
                          textAlign: TextAlign.center,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxt(context, 0)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: displayWidth(context) * 0.05,
                          left: displayWidth(context) * 0.05),
                      child: Text(tc1,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxt(context, 0)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: displayWidth(context) * 0.05,
                          left: displayWidth(context) * 0.05),
                      child: Text(tc2,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxt(context, 0)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: displayWidth(context) * 0.05,
                          left: displayWidth(context) * 0.05),
                      child: Text(tc3,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxt(context, 0)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: displayWidth(context) * 0.05,
                          left: displayWidth(context) * 0.05),
                      child: Text(tc4,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxt(context, 0)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: displayWidth(context) * 0.05,
                          left: displayWidth(context) * 0.05),
                      child: Text(tc5,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxt(context, 0)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: displayWidth(context) * 0.05,
                        left: displayWidth(context) * 0.05,
                      ),
                      child: Text(tc6,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxt(context, 0)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: displayWidth(context) * 0.05,
                          left: displayWidth(context) * 0.05,
                          bottom: displayHeight(context) * 0.2,
                          top: displayHeight(context) * 0.05),
                      child: Row(
                        children: [
                          Checkbox(
                            value: _value1,
                            onChanged: (bool? value) {
                              setState(() {
                                _value1 = value!;
                              });
                            },
                            // onChanged: _value1Changed,
                          ),
                          Text('ยอมรับเงื่อนไข',
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.defaultTxt(context, 5)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: MyColor.color('tabs'),
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          height: displayWidth(context) * 0.10,
          child: Row(
            children: [
              Expanded(
                child: Text(''),
              ),
              Container(
                width: displayWidth(context) * 0.4,
                height: displayHeight(context) * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0), color: Colors.red
                    // gradient: LinearGradient(
                    //   colors: <Color>[
                    //     MyColor.color('buttongra'),
                    //     MyColor.color('buttongra1'),
                    //   ],
                    // ),
                    ),
                padding: const EdgeInsets.only(right: 5),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IntroScreen(),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      'ยกเลิก',
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.buttonTxt(context, 0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(''),
              ),
              Container(
                width: displayWidth(context) * 0.4,
                height: displayHeight(context) * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(
                    colors: <Color>[
                      MyColor.color('buttongra'),
                      MyColor.color('buttongra1'),
                    ],
                  ),
                ),
                padding: const EdgeInsets.only(right: 5),
                child: InkWell(
                  onTap: () {
                    if (_value1 == true) {
                      _savestatus(context);
                    } else {
                      MyClass.showToast('ท่านยังไม่ได้กด ยอมรับเงื่อนไข ');
                    }
                  },
                  child: Center(
                    child: Text(
                      'ยืนยัน',
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.buttonTxt(context, 0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_savestatus(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int status = 1;
  await prefs.setInt('status', status);
  await Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => Notrg(),
    ),
  );
}
