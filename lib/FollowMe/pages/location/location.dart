import 'package:flutter/cupertino.dart';
import 'package:dldcoop/FollowMe/class/mycolor.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/sizes.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/class/widget.dart';
import 'package:dldcoop/FollowMe/models/location/addressJson.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class Location extends StatefulWidget {
  Param param;

  Location(this.param);
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  // late List<AddressModel> address;

  // List address = [
  //   {
  //     "address": "",
  //     "email": "",
  //     "email2": "",
  //     "fax": "",
  //     "number_phone1": "",
  //     "txt_phone1": "",
  //     "number_phone2": "",
  //     "txt_phone2": "",
  //     "number_phone3": "",
  //     "txt_phone3": "",
  //     "line": "",
  //     "facebook": "",
  //     "map": ""
  //   }
  // ];

  Future<bool> _onBackPressed() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              'ออกจากแอปพลิเคชัน',
              style: CustomTextStyle.dataHTxt(context, 5, 'slide1'),
            ),
            content: Text(
              'คุณต้องการออกจากแอปพลิเคชัน\nใช่ หรือ ไม่',
              style: CustomTextStyle.dataHTxt(context, 0, 'slide1'),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(
                  'ไม่',
                  style: CustomTextStyle.dataHTxt(context, 3, 'B'),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              CupertinoDialogAction(
                child: Text(
                  'ใช่',
                  style: CustomTextStyle.dataHTxt(context, 3, 'R'),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  Future _callNumber(n) async {
    var number = n.toString();
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  // Future<AddressModel> _getadress() async {
  //   await Network.fetchAddress('{"mode": "1"}').then((value) {
  //     setState(() {
  //       print(MyClass.json(value));
  //       address = value;
  //     });
  //   });
  //   throw Exception('Failed');
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

  Widget _getaddress({List<AddressModel>? address}) {
    return SelectionArea(
      child: Column(
        children: [
          _address(address),
          _callnumber(address),
        ],
      ),
    );
  }

  @override
  void initState() {
    // _getadress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    // print(address);
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: MyClass.backGround(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomUI.appbarTitleUi(
                        Language.addressLg('address', widget.param.lgs),
                        widget.param.fontsizeapps,
                        context),
                    CustomUI.appbarDetailUi3('assets/imgs/icon.png', context),
                    SizedBox(
                      height: tabletMode
                          ? displayHeight(context) * 0.0275
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
                              tabletMode == true ? 2 : 8,
                              'W',
                              tabletMode == true ? 5 : 3),
                        ),
                        Text(MyClass.company('th'),
                            textScaleFactor: MyClass.fontSizeApp(),
                            textAlign: TextAlign.center,
                            style: CustomTextStyle.dataHeadTitleCTxt(
                                context, tabletMode == true ? 2 : 8, 'slide1')),
                      ],
                    ),
                    SizedBox(
                      height: tabletMode
                          ? displayHeight(context) * 0.001
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
                      height: tabletMode ? 70 : 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 50),
                      child: Container(
                        padding: const EdgeInsets.only(top: 15, bottom: 25),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          color: MyColor.color('datatitle'),
                        ),
                        child: FutureBuilder<List<AddressModel>>(
                          future:
                              Network.fetchAddress('{"mode": "1"}', context),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              // return _getnew(news1: snapshot.data);
                              return _getaddress(address: snapshot.data);
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return MyClass.loading();
                          },
                        ),
                        // child: Column(
                        //   children: [
                        //     address == null
                        //         ? const SizedBox(height: 1)
                        //         : _address(address),
                        //     address == null
                        //         ? const SizedBox(height: 1)
                        //         : _callnumber(),
                        //   ],
                        // ),
                      ),
                    ),
                    // SingleChildScrollView(
                    //   child: Column(
                    //     children: [
                    // address == null ? SizedBox(height: 1) : _address(address),
                    // address == null ? SizedBox(height: 1) : _callnumber(),
                    SizedBox(
                      height: 50,
                    ),
                    // address == null ? SizedBox(height: 1) : _address1(address),
                    // address == null ? SizedBox(height: 1) : _callnumber1(),

                    //     ],
                    //   ),
                    // ),

                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: GestureDetector(
                    //     // child: Hero(
                    //     //   tag: 'imageHero',
                    //     child: Image.network(
                    //       '${MyClass.hostApp()}' +
                    //           '/public/member/new/Iphone.jpg',
                    //       // height: displayHeight(context) * 0.2,
                    //       width: displayWidth(context) * 1,
                    //     ),
                    //     // ),
                    //     onTap: () {
                    //       Navigator.push(context,
                    //           MaterialPageRoute(builder: (_) {
                    //         return DetailScreen(
                    //           url: '${MyClass.hostApp()}' +
                    //               '/public/member/new/Iphone.jpg',
                    //         );
                    //       }));
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            // CustomUI.appbarTxtTitleUi(Language.addressLg('address', widget.param.lgs),
            //     widget.param.fontsizeapps, context),
            // CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
          ],
        ),
      ),
    );
  }

  Widget _callnumber(List<AddressModel>? address) {
    return Column(
      children: [
        _phonenumber(address![0].numberPhone2, address[0].txtPhone2),
        _maps(address[0].map),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12),
          child: _link(address[0].website),
        ),
      ],
    );
  }

  Widget _maps(url) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: EdgeInsets.only(
        left: tabletMode ? 70 : 25,
        right: tabletMode ? 70 : 25,
      ),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset('assets/imgs/map.png'),
            iconSize: tabletMode ? 70 : 90,
            onPressed: () {
              _launchURL(url);
            },
          ),
        ],
      ),
    );
  }

  Widget _facebook(url) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: EdgeInsets.only(
        left: tabletMode ? 70 : 25,
        right: tabletMode ? 70 : 25,
      ),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset('assets/imgs/facebook.png'),
            iconSize: tabletMode ? 70 : 40,
            onPressed: () {
              _launchURL(url);
            },
          ),
        ],
      ),
    );
  }

  Widget _link(url) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Column(
      children: [
        Container(
          height: displayHeight(context) * 0.045,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              colors: <Color>[
                MyColor.color('LineColor'),
                MyColor.color('LineColor'),
              ],
            ),
          ),
          child: InkWell(
            onTap: () {
              _launchURL(url);
            },
            child: Center(
              child: Text(
                "เว็บไซต์สหกรณ์",
                style: CustomTextStyle.buttonTxt(context, -1),
              ),
            ),
          ),
        ),

        // IconButton(
        //   icon: Image.asset('assets/imgs/link.png'),
        //   iconSize: tabletMode ? 150 : 90,
        //   onPressed: () {
        //     _launchURL(url);
        //   },
        // ),
        // Text(
        //   'Website',
        //   textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
        //   style: CustomTextStyle.dataHTxt(context, tabletMode ? -5 : 0, 'LineColor'),
        // ),
      ],
    );
  }

  Widget _line(url) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: EdgeInsets.only(
        left: tabletMode ? 70 : 25,
        right: tabletMode ? 70 : 25,
      ),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset('assets/imgs/line.png'),
            iconSize: tabletMode ? 70 : 40,
            onPressed: () {
              _launchURL(url);
            },
          ),
        ],
      ),
    );
  }

  Widget _note() {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'กด 12,13 : สอบถามเรื่องเงินกู้',
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.defaultTxt(
              context,
              tabletMode ? -8 : -5,
            ),
          ),
          Text(
            'กด 15,16 : สอบถามเรื่องเงินฝาก',
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.defaultTxt(
              context,
              tabletMode ? -8 : -5,
            ),
          ),
          Text(
            'กด 18 : สอบถามเรื่องสมาคมฌาปนกิจ',
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.defaultTxt(
              context,
              tabletMode ? -8 : -5,
            ),
          ),
          Text(
            'โทร.ทหาร : 52 53346',
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.defaultTxt(
              context,
              tabletMode ? -8 : -5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _phonenumber1(n, t) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset('assets/imgs/call.png'),
            iconSize: tabletMode ? 70 : 40,
            onPressed: () {
              _callNumber(MyClass.formatNumberPhoneI(n));
            },
          ),
          Text(
            n + t,
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.defaultTxt(
              context,
              tabletMode ? -5 : 0,
            ),
          ),
          // Text(
          //   t,
          //   textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
          //   style: CustomTextStyle.defaultTxt(
          //     context,
          //     tabletMode ? -9 : -6,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _phonenumber(n, t) {
    bool platformandroid = MyClass.checkPlatform();
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset('assets/imgs/call.png'),
            iconSize: tabletMode ? 70 : 40,
            onPressed: () {
              _callNumber(MyClass.formatNumberPhoneI(n));
            },
          ),
          Text(
            n,
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.dataHTxt(
                context, platformandroid == true ? -1 : 0, 'slide1'),
          ),
          // Text(
          //   t,
          //   textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
          //   style: CustomTextStyle.dataHTxt(
          //       context, platformandroid == true ? -1 : 0, 'slide1'),
          // ),
        ],
      ),
    );
  }

  Widget _address(address) {
    return Center(
      child: Column(
        children: [
          Text(
            "ที่อยู่",
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.dataHTxt(context, 4, 'slide1'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Text(
                    address[0].address,
                    textAlign: TextAlign.center,
                    textScaleFactor:
                        MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                    style: CustomTextStyle.dataHTxt(context, 0, 'slide1'),
                  ),
                ),
              ],
            ),
          ),
          hSizedBoxButton(context, -15),
          Text(
            "ติดต่อเรา",
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.dataHTxt(context, 4, 'slide1'),
          ),
          Padding(
            padding: EdgeInsets.only(left: displayWidth(context) * 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Email: ',
                  textScaleFactor:
                      MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStyle.dataHTxt(context, 0, 'slide1'),
                ),
                Text(
                  address[0].email,
                  textScaleFactor:
                      MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStyle.dataHTxt(context, 0, 'slide1'),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: displayWidth(context) * 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  address[0].fax == '' ? '' : 'Fax: ',
                  textScaleFactor:
                      MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStyle.dataHTxt(context, 0, 'slide1'),
                ),
                Text(
                  address[0].fax,
                  textScaleFactor:
                      MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStyle.dataHTxt(context, 0, 'slide1'),
                ),
              ],
            ),
          ),
          hSizedBoxButton(context, -5),
        ],
      ),
    );
  }

  Widget _address1(address) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  address[0].address1,
                  textAlign: TextAlign.center,
                  textScaleFactor:
                      MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStyle.defaultTxt(context, 0),
                ),
              ],
            ),
          ),
          // hSizedBoxButton(context, -5),
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
