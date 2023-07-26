import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/locals/dbFontSize.dart';
import 'package:dldcoop/FollowMe/models/sql/fontSizeDb.dart';
// import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class FontSize extends StatefulWidget {
  Param param;
  FontSize(this.param);
  @override
  _FontSizeState createState() => _FontSizeState();
}

class _FontSizeState extends State<FontSize> {
  late var _myActivity;
  late String _myActivityResult;
  final formKey = new GlobalKey<FormState>();
  String _font = '';

  late DBFs dBFs;
  FontSizeDb fs = FontSizeDb();

  @override
  void initState() {
    dBFs = DBFs();

    super.initState();
    _getfs();
    _myActivity = '';
    _myActivityResult = '';
  }

  @override
  void dispose() {
    dBFs.close();
    super.dispose();
  }

  _getfs() async {
    try {
      await dBFs.initDB();
      dBFs
          .getFs()
          .then(
            (value) => {
              _fontxt(MyClass.json(value)[0]['fs']),
            },
          )
          .catchError((e) {
        _fontxt('1.0'); // Future completes with 42.
      });
    } catch (err) {
      _fontxt('1.0');
    }
  }

  _fontxt(t) {
    setState(() {
      if (t == '0.85') {
        _font = Language.settingLg('small', widget.param.lgs);
      } else if (t == '1.0') {
        _font = Language.settingLg('normal', widget.param.lgs);
      } else if (t == '1.1') {
        _font = Language.settingLg('large', widget.param.lgs);
      } else {
        _font = Language.settingLg('normal', widget.param.lgs);
      }
    });
  }

  _saveForm() async {
    if (_myActivity.isEmpty) {
      MyClass.showToast(Language.settingLg('selectfont', widget.param.lgs));
    } else {
      await _insertfs(_myActivity);
      await Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) => new Pins(gettitle: 'pinCode')),
      );
    }

    // var form = formKey.currentState;
    // if (form.validate()) {
    //   form.save();
    //   print(_myActivity);
    // const pref_fontsize = 'fontsize';
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // await preferences.setDouble(pref_fontsize, double.parse(_myActivity));
    // await _insertfs(_myActivity);
    // await Navigator.pushReplacement(
    //   context,
    //   new MaterialPageRoute(
    //       builder: (context) => new Pins(gettitle: 'pinCode')),
    // );
    // setState(() {
    //   _myActivityResult = _myActivity;
    // });
    // }
  }

  _insertfs(f) async {
    fs.fs = f;
    await dBFs.initDB();
    await dBFs.deleteAll();
    await dBFs.insertFs(fs);
  }

  bool _enabled = true;
  var value;

  List<Map> _items = [];

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    _items = [
      {"value": '0.85', "text": Language.settingLg('small', widget.param.lgs)},
      {"value": '1.0', "text": Language.settingLg('normal', widget.param.lgs)},
      {"value": '1.1', "text": Language.settingLg('large', widget.param.lgs)}
    ];
    _fontsizeapps = widget.param.fontsizeapps;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 25),
            child: Column(),
          ),
          Container(
            height: double.infinity,
            decoration: MyClass.backGround(context),
            child: Container(
              padding: EdgeInsets.only(top: displayHeight(context) * 0.10),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: tabletMode
                          ? displayHeight(context) * 0.3
                          : displayHeight(context) * 0.1,
                    ),
                    Form(
                      key: formKey,
                      child: Container(
                        padding: EdgeInsets.all(displayHeight(context) * 0.05),
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    Language.settingLg(
                                        'fontsize', widget.param.lgs),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataBoldTxtC(
                                        context, 5, 'Bl'),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: DropdownButton(
                                    dropdownColor: Color(0xFF5DA3F1),
                                    iconSize: displayWidth(context) * 0.05,
                                    itemHeight: displayWidth(context) * 0.2,
                                    hint: Text(
                                      _font,
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.dataBoldTxtC(
                                          context, 5, 'Bl'),
                                    ),
                                    disabledHint: value != null
                                        ? Text(
                                            _items.firstWhere((item) =>
                                                item["value"] == value)["text"],
                                            textScaleFactor:
                                                MyClass.blocFontSizeApp(
                                                    _fontsizeapps),
                                            style: CustomTextStyle.dataBoldTxtC(
                                                context, 5, 'Bl'),
                                          )
                                        : null,
                                    items: _items
                                        .map((item) => DropdownMenuItem(
                                              value: item["value"],
                                              child: Text(
                                                item["text"],
                                                textScaleFactor:
                                                    MyClass.blocFontSizeApp(
                                                        _fontsizeapps),
                                                style: CustomTextStyle
                                                    .dataBoldTxtC(
                                                        context, 5, 'Bl'),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: _enabled
                                        ? (v) => setState(() {
                                              _myActivity = v;
                                              value = v;
                                            })
                                        : null,
                                    value: value,
                                  ),
                                ),
                              ],
                            ),
                            lineSizedBox(context, 100),
                            _buttom(),
                            lineSizedBox(context, 5),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi(),
          CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
        ],
      ),
    );
  }

  Widget _buttom() {
    return Row(
      children: [
        Container(
          width: displayWidth(context) * 0.8,
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
              _saveForm();
            },
            child: Center(
              child: Text(
                Language.settingLg('yes', widget.param.lgs),
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.buttonTxt(context, 5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
