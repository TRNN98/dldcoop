import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/pages/InTro/pdpa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../class/customUI.dart';
import '../../class/language.dart';
import '../../class/myclass.dart';
import '../../class/mycolor.dart';
import '../../class/textstyle.dart';
import '../auth/Pins.dart';

double _fontsizeapps = 1.0;

class Bank_Detail extends StatefulWidget {
  Param param;

  Bank_Detail(this.param);

  @override
  State<Bank_Detail> createState() => _Bank_DetailState();
}

class _Bank_DetailState extends State<Bank_Detail> {
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
                Column(
                  children: [
                    CustomUI.appbarTxtTitleUi(
                        Language.menuLg('bank', widget.param.lgs),
                        widget.param.fontsizeapps,
                        context),
                    CustomUI.appbarDetailUi3('assets/imgs/icon.png', context),
                    SizedBox(
                      height: tabletMode
                          ? displayHeight(context) * 0.01
                          : displayHeight(context) * 0.0275,
                    ),
                    Stack(
                      children: [
                        Text(
                          MyClass.company('th'),
                          textScaleFactor: MyClass.fontSizeApp(),
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.dataHeadTitleCTxt1Paint(
                              context,
                              tabletMode == true ? 2 : 0,
                              'W',
                              tabletMode == true ? 5 : 3),
                        ),
                        Text(MyClass.company('th'),
                            textScaleFactor: MyClass.fontSizeApp(),
                            textAlign: TextAlign.center,
                            style: CustomTextStyle.dataHeadTitleCTxt(
                                context, tabletMode == true ? 2 : 0, 'R')),
                      ],
                    ),
                    SizedBox(
                      height: tabletMode
                          ? displayHeight(context) * 0.00
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
                    SizedBox(
                      height: tabletMode ? 40 : 20,
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, right: 0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          color: MyColor.color('datatitle'),
                        ),
                        child: Container(
                          child: _bankname(context),
                        )),
                  ],
                ),
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi(),
        ],
      ),
    );
  }

  Widget _bankname(address) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    TextEditingController field = TextEditingController();

    return SelectionArea(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/imgs/ktb.png',
                      width: tabletMode
                          ? displayWidth(context) * 0.1
                          : displayWidth(context) * 0.12,
                      height: tabletMode
                          ? displayWidth(context) * 0.1
                          : displayWidth(context) * 0.12,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        "ธนาคารกรุงไทย\nสาขานนทบุรี\n108-1-80592-7",
                        textAlign: TextAlign.left,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, 0, 'Bl'),
                      )),
                  Padding(
                    padding: EdgeInsets.only(right: tabletMode ? 60 : 15.0),
                    child: GestureDetector(
                      child: Image.asset(
                        'assets/imgs/clipboard.png',
                        width: tabletMode
                            ? displayWidth(context) * 0.06
                            : displayWidth(context) * 0.08,
                        height: tabletMode
                            ? displayWidth(context) * 0.06
                            : displayWidth(context) * 0.08,
                        fit: BoxFit.fitHeight,
                      ),
                      onTap: () async {
                        await Clipboard.setData(
                            const ClipboardData(text: "108-1-80592-7"));
                        MyClass.showToast('คัดลอกสำเร็จ');
                        // copied successfully
                      },
                    ),
                  ),
                ],
              ),
            ),
            hSizedBoxButton(context, -10),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/imgs/BangkokBank.png',
                      width: tabletMode
                          ? displayWidth(context) * 0.1
                          : displayWidth(context) * 0.12,
                      height: tabletMode
                          ? displayWidth(context) * 0.1
                          : displayWidth(context) * 0.12,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        "ธนาคารกรุงเทพ\nสาขานนทบุรี\n140-0-55001-6",
                        textAlign: TextAlign.left,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, 0, 'Bl'),
                      )),
                  Padding(
                    padding: EdgeInsets.only(right: tabletMode ? 60 : 15.0),
                    child: GestureDetector(
                      child: Image.asset(
                        'assets/imgs/clipboard.png',
                        width: tabletMode
                            ? displayWidth(context) * 0.06
                            : displayWidth(context) * 0.08,
                        height: tabletMode
                            ? displayWidth(context) * 0.06
                            : displayWidth(context) * 0.08,
                        fit: BoxFit.fitHeight,
                      ),
                      onTap: () async {
                        await Clipboard.setData(
                            const ClipboardData(text: "140-0-55001-6"));
                        MyClass.showToast('คัดลอกสำเร็จ');
                        // copied successfully
                      },
                    ),
                  ),
                ],
              ),
            ),
            hSizedBoxButton(context, -10),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/imgs/ttb.png',
                      width: tabletMode
                          ? displayWidth(context) * 0.1
                          : displayWidth(context) * 0.12,
                      height: tabletMode
                          ? displayWidth(context) * 0.1
                          : displayWidth(context) * 0.12,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        "ธนาคารทหารไทยธนชาต\nสาขาถนนประชาราษฎร์-นนทบุรี\n191-2-07596-5",
                        textAlign: TextAlign.left,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, 0, 'Bl'),
                      )),
                  Padding(
                    padding: EdgeInsets.only(right: tabletMode ? 60 : 15.0),
                    child: GestureDetector(
                      child: Image.asset(
                        'assets/imgs/clipboard.png',
                        width: tabletMode
                            ? displayWidth(context) * 0.06
                            : displayWidth(context) * 0.08,
                        height: tabletMode
                            ? displayWidth(context) * 0.06
                            : displayWidth(context) * 0.08,
                        fit: BoxFit.fitHeight,
                      ),
                      onTap: () async {
                        await Clipboard.setData(
                            const ClipboardData(text: "191-2-07596-5"));
                        MyClass.showToast('คัดลอกสำเร็จ');
                        // copied successfully
                      },
                    ),
                  ),
                ],
              ),
            ),
            hSizedBoxButton(context, -10),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/imgs/ttb.png',
                      width: tabletMode
                          ? displayWidth(context) * 0.1
                          : displayWidth(context) * 0.12,
                      height: tabletMode
                          ? displayWidth(context) * 0.1
                          : displayWidth(context) * 0.12,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        "ธนาคารทหารไทยธนชาต\nสาขาวงค์สว่าง\n680-2-00249-0",
                        textAlign: TextAlign.left,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, 0, 'Bl'),
                      )),
                  Padding(
                    padding: EdgeInsets.only(right: tabletMode ? 60 : 15.0),
                    child: GestureDetector(
                      child: Image.asset(
                        'assets/imgs/clipboard.png',
                        width: tabletMode
                            ? displayWidth(context) * 0.06
                            : displayWidth(context) * 0.08,
                        height: tabletMode
                            ? displayWidth(context) * 0.06
                            : displayWidth(context) * 0.08,
                        fit: BoxFit.fitHeight,
                      ),
                      onTap: () async {
                        await Clipboard.setData(
                            const ClipboardData(text: "680-2-00249-0"));
                        MyClass.showToast('คัดลอกสำเร็จ');
                        // copied successfully
                      },
                    ),
                  ),
                ],
              ),
            ),
            hSizedBoxButton(context, -10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Text(
                    Language.bank('bankDetail', lgs),
                    textAlign: TextAlign.center,
                    textScaleFactor:
                        MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                    style: CustomTextStyle.dataHTxt(
                        context, tabletMode ? -5 : 0, 'TextFormFieldTextStyle'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
