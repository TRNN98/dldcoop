import 'package:flutter/cupertino.dart';
import 'package:dldcoop/FollowMe/class/textstyle.dart';
import 'package:dldcoop/FollowMe/pages/auth/Pins.dart';
import 'package:dldcoop/FollowMe/class/customUI.dart';
import 'package:dldcoop/FollowMe/class/language.dart';
import 'package:dldcoop/FollowMe/class/myclass.dart';
import 'package:dldcoop/FollowMe/services/netword.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MainMenu extends StatefulWidget {
  Param param;
  MainMenu(this.param);

  @override
  _MainMenuState createState() => _MainMenuState();
}

var _colorMenu = Color(0xFFFFFFFF);
var _colorBorderMenu = Color.fromARGB(192, 0, 208, 255);

class Menu {
  final String title;
  final String img;
  final String page;

  const Menu({required this.title, required this.img, required this.page});
}

final List<Menu> menus = <Menu>[
  const Menu(title: "share", img: 'assets/imgs/share.png', page: '/share'),
  const Menu(title: "loan", img: 'assets/imgs/loan.png', page: '/loan'),
  const Menu(
      title: "deposit", img: 'assets/imgs/deposit.png', page: '/deposit'),
  const Menu(
      title: "guarantee", img: 'assets/imgs/guarantee.png', page: '/guarantee'),
  const Menu(title: "kept", img: 'assets/imgs/kept.png', page: '/kept'),
  const Menu(
      title: "dividend", img: 'assets/imgs/dividend.png', page: '/dividend'),
  const Menu(title: "gain", img: 'assets/imgs/gain.png', page: '/gain'),
  const Menu(
      title: "coopMail", img: 'assets/imgs/coopMail.png', page: '/coopMail'),
  const Menu(
      title: "StatusLoan", img: 'assets/imgs/StatusLoan.png', page: '/status'),
  const Menu(
      title: "keptSpecial",
      img: 'assets/imgs/keptSpecial.png',
      page: '/keptSpecial'),
  const Menu(title: "interest", img: 'assets/imgs/rate.png', page: '/interest'),
  const Menu(title: "contact", img: 'assets/imgs/contact.png', page: '/bank'),

  // const Menu(
  //     title: "memberref", img: 'assets/imgs/memberref.png', page: '/memberref'),
  // const Menu(title: "offset", img: 'assets/imgs/offset.png', page: '/offset'),
  // const Menu(title: "new", img: 'assets/imgs/new.png', page: '/new'),
];

class Tab {
  final String title;
  final IconData icon;

  const Tab({required this.title, required this.icon});
}

class _MainMenuState extends State<MainMenu> {
  String? imgprofile;
  int _msgstatus = 0;

  Future<void> _getMsgStatus() async {
    var ObjMsgStatus = '{"mode": "3","message_type":"0"}';
    final List _msg =
        await Network.fetchMsgStatus(ObjMsgStatus, widget.param.token, context);
    setState(() {
      _msgstatus = MyClass.json(_msg)[0]['countStatus'];
    });
  }

  Future<bool> _onBackPressed() async {
    // return showDialog<void>(context: context);
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              'ออกจากแอปพลิเคชัน',
              style: CustomTextStyle.dataHTxt(context, 5, 'Bl'),
            ),
            content: Text(
              'คุณต้องการออกจากแอปพลิเคชัน\nใช่ หรือ ไม่',
              style: CustomTextStyle.dataHTxt(context, 0, 'Bl'),
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

//   _oneSignal() async {
//     OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
//     await OneSignal.shared
//         .setAppId("31253ef6-7f3d-4053-9117-ddfb16d76fa3");
//     // OneSignal.shared.init("5e172461-1bb1-4f9c-9187-68730a8ffe7d", iOSSettings: {
//     //   OSiOSSettings.autoPrompt: true,
//     //   OSiOSSettings.inAppLaunchUrl: false
//     // });
//     // OneSignal.shared
//     //     .setInFocusDisplayType(OSNotificationDisplayType.notification);
//
// // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
//     await OneSignal.shared
//         .promptUserForPushNotificationPermission(fallbackToSettings: true);
//   }
//   Future<void> initMessaging() async {
//     await OneSignal.shared.setAppId("31253ef6-7f3d-4053-9117-ddfb16d76fa3");
//     OneSignal.shared.setInAppMessageClickedHandler((OSInAppMessageAction action) {
//       MyClass.showToast(action);
//     });
//     // OneSignal.shared.setInAppMessageClickedHandler((action) {
//     //   MyClass.showToast('123123123');
//     //   MyClass.showToast(action.clickName);
//     //
//     //   print(action.clickName);
//     //   if (action.clickName == 'successPage') {
//     //     print('234234234');
//     //     MyClass.showToast('123123123');
//     //     print(action.clickName);
//     //     // Navigator.of(context)
//     //     //     .push(MaterialPageRoute(builder: (_) => const SuccessScreen()));
//     //   }
//     // });
//   }
  @override
  void initState() {
    super.initState();
    _getMsgStatus();
    // initMessaging();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    imgprofile =
        '${MyClass.hostApp()}/public/member/profile/${widget.param.membership_no}.jpg';
    // initMessaging();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'prompt'),
      home: Scaffold(
        body: WillPopScope(
          onWillPop: _onBackPressed,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: tabletMode
                        ? AssetImage("assets/imgs/bg_tablet.png")
                        : AssetImage("assets/imgs/bg.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: GridView.count(
                  primary: false,
                  padding: EdgeInsets.only(
                      left: 15, top: tabletMode ? 350 : 200, right: 15),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: tabletMode ? 4 : 3,
                  children: List.generate(
                    menus.length,
                    (index) => Container(
                      decoration: BoxDecoration(
                          color: _colorMenu,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _colorBorderMenu,
                            width: 1,
                          )),
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Image.asset(
                                menus[index].img,
                                fit: BoxFit.contain,
                                width: tabletMode ? 100 : 50,
                                height: tabletMode ? 100 : 50,
                              ),
                            ),
                            AutoSizeText(
                              Language.menuLg(
                                  menus[index].title, widget.param.lgs),
                              textAlign: TextAlign.center,
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: TextStyle(
                                fontSize: tabletMode ? 23 : 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              maxFontSize: tabletMode ? 30 : 13,
                            )
                          ],
                        ),
                        onTap: () {
                          menus[index].title == "contact"
                              ? _launchURL(
                                  'https://www.dldcoop.com/view.php?No=7')
                              : Navigator.pushNamed(context, menus[index].page);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              CustomUI.appbarUiMainMenu(
                  imgprofile, _msgstatus, widget.param, '0', context),
            ],
          ),
          // ),
        ),
      ),
    );
  }

  void _navigator(p) {
    Navigator.pushNamed(context, p);
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

// class CustomShapeBorder extends ContinuousRectangleBorder {
//   @override
//   Path getOuterPath(Rect rect, {TextDirection textDirection}) {
//     final double innerCircleRadius = 3.0;
//     // Path path = Path();
//     // path.lineTo(0, rect.height);
//     // // path.quadraticBezierTo(rect.width / 2 - (innerCircleRadius / 2) - 30, rect.height + 15, rect.width / 2 - 75, rect.height + 50);
//     // // path.cubicTo(
//     // //     rect.width / 2 - 40, rect.height + innerCircleRadius - 40,
//     // //     rect.width / 2 + 40, rect.height + innerCircleRadius - 40,
//     // //     rect.width / 2 + 75, rect.height + 50
//     // // );
//     // // path.quadraticBezierTo(rect.width / 2 + (innerCircleRadius / 2) + 30, rect.height + 15, rect.width, rect.height);
//     // path.lineTo(rect.width, 0.0);
//     // path.close();
//     Path p = new Path();
//     p.lineTo(rect.width * innerCircleRadius, 0.0);
//     p.lineTo(
//         rect.width * innerCircleRadius, rect.height * innerCircleRadius / 8.75);
//     p.lineTo(0.0, rect.height * innerCircleRadius / 1.75);
//     p.close();
//     return p;
//     // return path;
//   }

// @override
// bool shouldReclip(CustomClipper oldClipper) {
//   return true;
// }
// }
