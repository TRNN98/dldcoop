import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/pages/bank/bank_detail_page.dart';
import 'package:dldcoop/FollowMe/pages/deposit/deposit.dart';
import 'package:dldcoop/FollowMe/pages/dividend/dividend.dart';
import 'package:dldcoop/FollowMe/pages/loan_requestment/status_loan.dart';
import 'package:dldcoop/FollowMe/pages/gain/gain.dart';
import 'package:dldcoop/FollowMe/pages/guarantee/guarantee.dart';
import 'package:dldcoop/FollowMe/pages/kept/kept.dart';
import 'package:dldcoop/FollowMe/pages/loan/loan.dart';
import 'package:dldcoop/FollowMe/pages/location/location.dart';
import 'package:dldcoop/FollowMe/pages/mainmenu.dart';
import 'package:dldcoop/FollowMe/pages/news/news.dart';
import 'package:dldcoop/FollowMe/pages/offset/offset.dart';
import 'package:dldcoop/FollowMe/pages/profile/profile.dart';
import 'package:dldcoop/FollowMe/pages/share/share.dart';
import 'package:flutter/material.dart';

import '../FollowMe/pages/cooperative_mail/cooperative_mail.dart';
import '../FollowMe/pages/interest/interest_page.dart';
import '../FollowMe/pages/special_payment_receipts/kept_special.dart';

int _selectedPage = 0;

class Tabs extends StatefulWidget {
  Param param;

  Tabs(this.param);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  void initState() {
    _selectedPage = 0;
    super.initState();
  }

  final iconListA = [
    'assets/imgs/menu1.png',
    'assets/imgs/news1.png',
    'assets/imgs/location1.png',
    'assets/imgs/profile1.png',
  ];
  final iconList = [
    'assets/imgs/menu2.png',
    'assets/imgs/news2.png',
    'assets/imgs/location2.png',
    'assets/imgs/profile2.png',
  ];
  final nameList = [
    Language.tabsLg('menu', 'th'),
    Language.tabsLg('news', 'th'),
    Language.tabsLg('address', 'th'),
    Language.tabsLg('profile', 'th'),
  ];
  var _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    final _page = [
      MainMenu(widget.param),
      News(widget.param),
      Location(widget.param),
      Profile(widget.param),
    ];
    final _route = <String, WidgetBuilder>{
      '/loan': (BuildContext context) => Loan(widget.param),
      '/share': (BuildContext context) => Share(widget.param),
      '/deposit': (BuildContext context) => Deposit(widget.param),
      '/guarantee': (BuildContext context) => Guarantee(widget.param),
      '/kept': (BuildContext context) => Kept(widget.param),
      '/dividend': (BuildContext context) => Dividend(widget.param),
      '/gain': (BuildContext context) => Gain(widget.param),
      '/new': (BuildContext context) => News(widget.param),
      '/offset': (BuildContext context) => Offsets(widget.param),
      '/bank': (BuildContext context) => Bank_Detail(widget.param),
      '/interest': (BuildContext context) => Interest(widget.param),
      '/coopMail': (BuildContext context) => CoopMail(widget.param),
      '/status': (BuildContext context) => Status_loan(widget.param),
      '/keptSpecial': (BuildContext context) => KeptSpacial(widget.param),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Prompt',
      ),
      routes: _route,
      home: Scaffold(
        extendBody: true,
        body: _page[_selectedPage],
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? Colors.blue : Colors.white;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  isActive == true ? iconListA[index] : iconList[index],
                  width: tabletMode ? 40 : 30,
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    nameList[index].toString(),
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.defaultTxt(
                        context,
                        tabletMode
                            ? -15
                            : Platform.isAndroid
                                ? -5
                                : -4),
                  ),
                )
              ],
            );
          },
          // backgroundColor: Color.fromARGB(137, 255, 255, 255),
          activeIndex: _bottomNavIndex,
          // notchAndCornersAnimation: animation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.sharpEdge,
          gapLocation: GapLocation.none,
          leftCornerRadius: 20,
          rightCornerRadius: 20,
          height: tabletMode ? 100 : 70,
          onTap: (index) => setState(() => {
                _bottomNavIndex = index,
                _selectedPage = index,
              }),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
